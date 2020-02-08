// -*- mode: C++; tab-width: 4; indent-tabs-mode: nil -*- (for GNU Emacs)
//
// Copyright (c) 1985-2000 Microsoft Corporation
//
// This file is part of the Microsoft Research IPv6 Network Protocol Stack.
// You should have received a copy of the Microsoft End-User License Agreement
// for this software along with this release; see the file "license.txt".
// If not, please see http://www.research.microsoft.com/msripv6/license.htm,
// or write to Microsoft Research, One Microsoft Way, Redmond, WA 98052-6399.
//
// Abstract:
//
// TraceRoute utility for IPv6.
//


#include <windows.h>
#include <devioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <winsock2.h>
// Need ntddip6 before ws2ip6 to get CopyTDIFromSA6 and CopySAFromTDI6.
#include <ntddip6.h>
#include <ws2ip6.h>


#define DEFAULT_MAXIMUM_HOPS            30
#define DEFAULT_SEND_SIZE               64

#define DEFAULT_TIMEOUT 3000L
#define MIN_INTERVAL    1000L

char *
format_addr(struct sockaddr_in6 *address)
{
    static char buffer[128];

    if (getnameinfo((struct sockaddr *)address, sizeof *address,
                    buffer, sizeof buffer, NULL, 0, NI_NUMERICHOST) != 0)
        strcpy(buffer, "<invalid>");

    return buffer;
}

void
print_ip_addr(struct sockaddr_in6 *addr, BOOLEAN DoReverseLookup)
{
    char stringBuffer[128];
    BOOLEAN didReverse = FALSE;

    if (DoReverseLookup) {
        if (getnameinfo((struct sockaddr *)addr, sizeof *addr,
                        stringBuffer, sizeof stringBuffer,
                        NULL, 0, NI_NAMEREQD) == 0) {
            didReverse = TRUE;
            printf("%s ", stringBuffer);
        }
    }

    if (getnameinfo((struct sockaddr *)addr, sizeof *addr,
                    stringBuffer, sizeof stringBuffer,
                    NULL, 0, NI_NUMERICHOST) != 0)
        strcpy(stringBuffer, "<invalid>");

    if (didReverse) {
        printf("[%s]", stringBuffer);
    } else {
        printf("%s", stringBuffer);
    }
}


void
print_time(ulong Time)
{
    if (Time) {
        printf("%4u ms  ", Time);
    } else {
        printf("  <1 ms  ");
    }
}

BOOLEAN
param(
    ulong *parameter,
    char **argv,
    int argc,
    int current,
    ulong min,
    ulong max)
{
    ulong   temp;
    char    *dummy;

    if (current == (argc - 1)) {
        printf("A value must be supplied for option %s.\n", argv[current]);
        return(FALSE);
    }

    temp = strtoul(argv[current+1], &dummy, 0);
    if (temp < min || temp > max) {
        printf("Bad value for option %s.\n", argv[current]);
        return(FALSE);
    }

    *parameter = temp;

    return(TRUE);
}

//
// Can only be called once, because
// a) does not call freeaddrinfo
// b) uses a static buffer for some results
//
int
get_pingee(char *ahstr, int dnsreq, struct sockaddr_in6 *address, char **hstr)
{
    struct addrinfo hints;
    struct addrinfo *result;
    char *name = NULL;

    memset(&hints, 0, sizeof hints);
    hints.ai_flags = AI_NUMERICHOST;
    hints.ai_family = PF_INET6;

    if (getaddrinfo(ahstr, NULL, &hints, &result) != 0) {
        //
        // Not a numeric address.
        // Try again with DNS name resolution.
        //
        hints.ai_flags = AI_CANONNAME;
        if (getaddrinfo(ahstr, NULL, &hints, &result) != 0) {
            //
            // Failure - we can not resolve the name.
            //
            return FALSE;
        }

        name = result->ai_canonname;
    }
    else {
        //
        // Should we do a reverse-lookup to get a name?
        //
        if (dnsreq) {
            static char namebuf[NI_MAXHOST];

            if (getnameinfo(result->ai_addr, result->ai_addrlen,
                            namebuf, sizeof namebuf,
                            NULL, 0,
                            NI_NAMEREQD) == 0) {
                //
                // Reverse lookup succeeded.
                //
                name = namebuf;
            }
        }
    }

    *address = * (struct sockaddr_in6 *) result->ai_addr;
    *hstr = name;
    return TRUE;
}

int
get_source(char *astr, struct sockaddr_in6 *address)
{
    struct addrinfo hints;
    struct addrinfo *result;

    memset(&hints, 0, sizeof hints);
    hints.ai_flags = AI_PASSIVE;
    hints.ai_family = PF_INET6;

    if (getaddrinfo(astr, NULL, &hints, &result) != 0)
        return FALSE;

    *address = * (struct sockaddr_in6 *) result->ai_addr;
    return TRUE;
}

void
PrintUsage(void)
{
    printf("\nUsage: tracert6 [-d] [-h maximum_hops] [-w timeout] "
           "[-s srcaddr] target_name\n\n"
           "Options:\n"
           "-d             Do not resolve addresses to hostnames.\n"
           "-h max_hops    Maximum number of hops to search for target.\n"
           "-w timeout     Wait timeout milliseconds for each reply.\n"
           "-s srcaddr     Source address to use.\n"
           "-r             Use routing header to test reverse route also.\n");
}

int _CRTAPI1
main(int argc, char **argv)
{
    struct sockaddr_in6   address, sourceAddress, replyAddress;
    ushort                RcvSize;
    BOOL                  result;
    DWORD                 bytesReturned;
    HANDLE                Handle;
    DWORD                 status;
    PICMPV6_ECHO_REQUEST  request;
    PICMPV6_ECHO_REPLY    reply;
    char                 *hostname;
    char                 *arg;
    int                   i;
    ulong                 maximumHops = DEFAULT_MAXIMUM_HOPS;
    BOOLEAN               doReverseLookup = TRUE;
    ulong                 timeout = DEFAULT_TIMEOUT;
    BOOLEAN               foundAddress = FALSE;
    BOOLEAN               haveReply;
    uchar                 Ttl = 1;
    WSADATA  WsaData;
    int Reverse = FALSE;

    memset(&address, 0, sizeof address);
    memset(&sourceAddress, 0, sizeof sourceAddress);

    request = alloca(sizeof *request + DEFAULT_SEND_SIZE);
    reply = alloca(sizeof *reply + DEFAULT_SEND_SIZE);

    if (WSAStartup( MAKEWORD(2, 0), &WsaData)) {
        printf("Unable to initialize the Windows Sockets interface, "
               "error code %u.\n", GetLastError());
        return(1);
    }

    if (argc < 2) {
        PrintUsage();
        goto error_exit;
    }

    //
    // process command line
    //
    for (i=1; i < argc; i++) {
        arg = argv[i];

        if (arg[0] == '-') {
            switch(arg[1]) {
            case '?':
                PrintUsage();
                goto error_exit;

            case 'd':
                doReverseLookup = FALSE;
                break;

            case 'r':
                Reverse = TRUE;
                break;

            case 'h':
                if (!param(&maximumHops, argv, argc, i, 1, 255)) {
                    goto error_exit;
                }
                break;

            case 'w':
                if (!param(&timeout, argv, argc, i, 1, 0xffffffff)) {
                    goto error_exit;
                }
                break;

            case 's':
                if (!get_source(argv[++i], &sourceAddress)) {
                    printf("Bad IPv6 address %s.\n", argv[i]);
                    goto error_exit;
                }
                break;

            default:
                printf("%s is not a valid command option.\n", argv[i]);
                PrintUsage();
                goto error_exit;
                break;

            }
        } else {
            foundAddress = TRUE;
            if (!get_pingee(argv[i], doReverseLookup, &address, &hostname)) {
                printf("Unable to resolve target system name %s.\n", argv[i]);
                goto error_exit;
            }
        }
    }

    if (!foundAddress) {
        printf("A target name or address must be specified.\n");
        PrintUsage();
        goto error_exit;
    }

    Handle = CreateFileW(WIN_IPV6_DEVICE_NAME,
                         0,          // desired access
                         FILE_SHARE_READ | FILE_SHARE_WRITE,
                         NULL,       // security attributes
                         OPEN_EXISTING,
                         0,          // flags & attributes
                         NULL);      // template file
    if (Handle == INVALID_HANDLE_VALUE) {
        status = GetLastError();
        printf( "Unable to contact IPv6 driver. Error code %u.\n", status);
        goto error_exit;
    }

    if (hostname) {
        printf("\nTracing route to %s [%s]\nover a maximum of %u hops:\n\n",
               hostname,
               format_addr(&address),
               maximumHops);
    } else {
        printf("\nTracing route to %s\nover a maximum of %u hops:\n\n",
               format_addr(&address),
               maximumHops);
    }

    //
    // Initialize the echo request.
    //
    CopyTDIFromSA6(&request->DstAddress, &address);
    CopyTDIFromSA6(&request->SrcAddress, &sourceAddress);
    request->Flags = 0;
    if (Reverse)
        request->Flags |= ICMPV6_ECHO_REQUEST_FLAG_REVERSE;
    request->Timeout = timeout;
    memset(request + 1, 0, DEFAULT_SEND_SIZE);

    while((Ttl <= maximumHops) && (Ttl != 0)) {

        printf("%3u  ", Ttl);

        haveReply = FALSE;
        request->TTL = Ttl;

        for (i=0; i<3; i++) {

            if (! DeviceIoControl(Handle, IOCTL_ICMPV6_ECHO_REQUEST, request,
                                  sizeof *request + DEFAULT_SEND_SIZE, reply,
                                  sizeof *reply + DEFAULT_SEND_SIZE,
                                  &bytesReturned, NULL)) {

                status = GetLastError();
            } else {
                status = reply->Status;
            }

            if (status == IP_SUCCESS) {
                print_time(reply->RoundTripTime);

                haveReply = TRUE;
                CopySAFromTDI6(&replyAddress, &reply->Address);

                if (i == 2) {
                    print_ip_addr(&replyAddress, doReverseLookup);
                    printf("\n");
                    goto loop_end;
                }
            } else if (status == IP_HOP_LIMIT_EXCEEDED) {
                print_time(reply->RoundTripTime);

                haveReply = TRUE;
                CopySAFromTDI6(&replyAddress, &reply->Address);

                if (i == 2) {
                    print_ip_addr(&replyAddress, doReverseLookup);
                    printf("\n");
                }
            } else if (status == IP_REQ_TIMED_OUT) {
                printf("   *     ");
                if (i == 2) {
                    if (haveReply) {
                        print_ip_addr(&replyAddress, doReverseLookup);
                        printf("\n");
                    } else {
                        printf("Request timed out.\n");
                    }
                }
            } else if (status < IP_STATUS_BASE) {
                printf("Transmit error: code %u\n", status);
                goto loop_end;
            } else {
                //
                // Fatal error.
                //
                if (reply != NULL) {
                    CopySAFromTDI6(&replyAddress, &reply->Address);
                    print_ip_addr(&replyAddress, doReverseLookup);
                    printf(" reports: ");
                }

                printf("%s\n", GetErrorString(status));
                goto loop_end;
            }

            if (reply->RoundTripTime < MIN_INTERVAL) {
                Sleep(MIN_INTERVAL - reply->RoundTripTime);
            }
        }

        Ttl++;
    }

loop_end:

    printf("\nTrace complete.\n");
    return(0);

error_exit:

    return(1);
}

