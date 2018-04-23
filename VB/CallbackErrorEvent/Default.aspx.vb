Imports System
Imports System.Web
Imports System.Web.UI

Partial Public Class _Default
	Inherits Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If HttpContext.Current.Session("Log") Is Nothing Then
			HttpContext.Current.Session("Log") = ""
		End If
	End Sub
	Protected Sub CallbackControl_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgs)
		Dim innerException As New Exception("NoReport")
		Throw New Exception("This Exception is thrown to demonstrate the ASPxWebControl.CallbackError Event.", innerException)
	End Sub
End Class