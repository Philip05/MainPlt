<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterRemarque.aspx.cs" Inherits="AjouterRemarque" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ajouter une remarque</title>
     <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyAjouterRemarqueEntretien">
    <form id="form1" runat="server">
        <menu:Navbar runat="server"/>
    <div class="container-fluid">
        <div class="row">
            <h1 id="h1AjouterRemarque">Ajouter une remarque</h1>
        </div>
        <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
            <asp:Label ID="labelNom" runat="server" ForeColor="White" Text="Nom : "></asp:Label>
            <asp:TextBox ID="textBoxNom" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
            <asp:Label ID="labelDescriptionRemarque1" runat="server" Text="Description : "></asp:Label>
            <asp:TextBox ID="textBoxDescrition" CssClass="form-control" TextMode="MultiLine"  runat="server"></asp:TextBox>
        </div>
        <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7""><asp:Label ID="labelResponsable" runat="server" Text="Responsable : "></asp:Label></div>
        <div class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
            <asp:FileUpload ID="FileUploadImages"  accept=".png, .jpg, .jpeg" AllowMultiple="true" CssClass="rowRemarque col-lg-9 col-md-9 col-sm-12 col-xs-12" runat="server" />
            <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
        </div>
        <div class="row col-lg-offset-5 col-md-offset-5 col-sm-offset-5 col-xs-offset-5 col-lg-7 col-md-7 col-sm-7 col-xs-7">
            <asp:Button ID="buttonAjouterRemarque" OnClick="buttonAjouterRemarque_Click" CssClass="btn-primary" runat="server" Text="Ajouter la remarque" />
        </div>
    </div>
        <menu:FooterConception runat="server"/>
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
