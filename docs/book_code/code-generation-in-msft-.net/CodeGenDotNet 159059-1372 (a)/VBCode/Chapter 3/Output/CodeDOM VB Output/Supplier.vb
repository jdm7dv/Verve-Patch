' ***^^^***|||***^^^***' ' ' ' %%%###%%%e87ef6d28d4106fcc4093d381d07885f%%%###%%%' ***^^^***|||***^^^***'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Runtime Version: 1.1.4322.573
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports Fred2 = System

Namespace CodeDOMTest
    
    Public Class Startup
        
        Public Shared Sub Main()
            Dim iSum As Integer
            Dim iValue As Integer = 42
            Dim stream As System.IO.Stream
            Dim fileName As String = "Test.txt"
            System.Console.WriteLine("Hello World")
            iSum = (42 + 23)
            stream = New System.IO.FileStream(fileName, System.IO.FileMode.Create)
            Dim aInts() As Integer
            Dim a2Ints() As Integer
            a2Ints = New Integer(9) {}
            aInts = New Integer() {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
            iValue = aInts(3)
            Dim i As Integer = 0
            aInts(i) = aInts((i + 1))
            If (i > 6) Then
                System.Console.WriteLine("True Executed")
            Else
                System.Console.WriteLine("False Executed")
            End If
            i = 0
            Do While (i <= 9)
                System.Console.WriteLine(aInts(i))
                i = (i + 1)
            Loop
            obj.MethodA(obj.MethodC(j))
            Startup.EqualityDifference
        End Sub
        
        Shared Sub EqualityDifference()
            Dim iValue As Integer
            If (iValue  _
                        = (42 + 23)) Then
                System.Console.WriteLine("True Executed")
            Else
                System.Console.WriteLine("False Executed")
            End If
        End Sub
    End Class
    
    Public Class TestClass
        Inherits TestBase
        Implements ITest, ITest2, ITest3
        
        Public Overridable Sub Foo() Implements ITest.Foo , ITest2.Foo
        End Sub
        
        Private Sub DefaultScope()
            '5002-20482
        End Sub
        
        Sub ITest3_BarZ() Implements ITest3.BarZ
            '5000-Private
        End Sub
        
        Private Sub ScopeTest()
            '5002-20482
        End Sub
        
        Public Shadows Overridable Sub TestShadows()
            '6010-24592
        End Sub
        
        Public Overrides Sub TestOverride()
            '6004-24580
        End Sub
        
        Public Overloads Overridable Sub TestOverloaded2()
            '6100-24832
        End Sub
        
        Sub TestFinal()
            '2-Final
        End Sub
        
        Sub TestFinalAndOverrides()
            '6-6
        End Sub
    End Class
    
    Public Class TestClass
        Inherits TestBase
        Implements ITest, ITest2, ITest3
        
        Public Overridable Sub Foo() Implements ITest.Foo , ITest2.Foo
        End Sub
        
        Private Sub DefaultScope()
            '5002-20482
        End Sub
        
        Sub ITest3_BarZ() Implements ITest3.BarZ
            '5000-Private
        End Sub
        
        Private Sub ScopeTest()
            '5002-20482
        End Sub
        
        Public Shadows Overridable Sub TestShadows()
            '6010-24592
        End Sub
        
        Public Overrides Sub TestOverride()
            '6004-24580
        End Sub
        
        Public Overloads Overridable Sub TestOverloaded2()
            '6100-24832
        End Sub
        
        Sub TestFinal()
            '2-Final
        End Sub
        
        Sub TestFinalAndOverrides()
            '6-6
        End Sub
    End Class
    
    Public Class TestBase
        
        Public Overridable Sub Test()
        End Sub
        
        Sub Test2()
        End Sub
    End Class
    
    MustInherit Class TestMustInherit
        
        Private Sub Test()
        End Sub
    End Class
    
    NotInheritable Class TestNotInheritable
        
        Public Overridable Sub Test()
        End Sub
    End Class
    
    Class TestNotPublic
        
        Public Overridable Sub Test()
        End Sub
    End Class
    
    Class TestNested
        
        Public Overridable Sub Test()
        End Sub
    End Class
    
    Public Interface ITest
        
        Sub Foo()
    End Interface
    
    Public Interface ITest2
        
        Sub Foo()
    End Interface
    
    Public Class 
        
        Class Publc
        End Class
        
        Public Class Frend
        End Class
        
        Class Privte1
        End Class
        
        Class Privte2
        End Class
        
        Class Privte3
        End Class
        
        Class Privte4
        End Class
        
        Private Class Privte5
        End Class
        
        Public Class Privte6
        End Class
    End Class
End Namespace