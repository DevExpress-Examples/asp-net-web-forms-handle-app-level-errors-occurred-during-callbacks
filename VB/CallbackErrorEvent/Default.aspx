<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v14.2" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<dx:ASPxButton ID="Button" runat="server" Text="Throw Exception on Callback" AutoPostBack="False" Width="120px">
		<ClientSideEvents Click="function(s, e) { CallbackControl.PerformCallback(); }" />
	</dx:ASPxButton>
	<dx:ASPxCallback ID="CallbackControl" ClientInstanceName="CallbackControl" runat="server" OnCallback="CallbackControl_Callback">
	</dx:ASPxCallback>
	</form>
</body>
</html>