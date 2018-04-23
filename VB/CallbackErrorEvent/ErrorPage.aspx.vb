Imports System
Imports System.Web

Partial Public Class Default2
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If HttpContext.Current.Session("Log") IsNot Nothing Then
			Memo.Text = HttpContext.Current.Session("Log").ToString()
		End If
	End Sub
	Protected Sub ClearLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs)
		HttpContext.Current.Session("Log") = ""
		Memo.Text = ""
	End Sub
End Class