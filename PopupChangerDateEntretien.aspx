<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopupChangerDateEntretien.aspx.cs" Inherits="PopupChangerDateEntretien" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Changer une date</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div>
                <asp:ToolkitScriptManager ID="toolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                <asp:Panel ID="panelDateProchainEntretien" runat="server">
                    <asp:Button ID="buttonOk"  runat="server" Text="Button" />
                    <asp:Button ID="buttonCancel" runat="server" Text="Button" />
                </asp:Panel>
                <asp:ModalPopupExtender ID="ModalPopupExtender1" PopupControlID="panelDateProchainEntretien" runat="server" CancelControlID="buttonCancel" TargetControlID="buttonOk">
                    
                </asp:ModalPopupExtender>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
            integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
            integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
        <script src="java.js" type="text/javascript"></script>
    </form>
</body>
</html>
