'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version: 1.1.4322.573
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On


Namespace MyNameSpace
    
    Public Class [MyClass]
        
        Public Overridable Sub MonMethod()
            Try 
                Me.ThrowApplicationException
            Catch ex As System.ApplicationException
                'Handle any SystemApplicationException here
            Catch ex As System.Exception
                'Handle any other exception type here
            Finally
                'Handle any finally block statements
            End Try
        End Sub
    End Class
End Namespace
