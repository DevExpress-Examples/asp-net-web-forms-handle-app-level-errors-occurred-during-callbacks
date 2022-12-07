<%@ Page Language="vb" AutoEventWireup="true" CodeFile="ErrorPage.aspx.vb" Inherits="Default2" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<asp:LinkButton ID="BackLinkButton" runat="server" Text="Back to Example" PostBackUrl="~/Default.aspx"></asp:LinkButton><br />
	<br />
	Error log:
	<dx:ASPxMemo ID="Memo" runat="server" Height="500px" Width="100%">
	</dx:ASPxMemo>
	<asp:LinkButton ID="ClearLinkButton" runat="server" Text="Clear" OnClick="ClearLinkButton_Click"></asp:LinkButton>
	</form>
</body>
</html>