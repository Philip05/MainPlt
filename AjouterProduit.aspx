<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterProduit.aspx.cs" Inherits="AjouterProduit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Ajouter un produit</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyAjouterProduit">
    <form id="form1" runat="server">
         <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div class="row">
                <h1 class="col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-0" id="titreAjouterProduit">Ajouter un produit</h1>
            </div>
            <div id="nomProduit" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="labelProduit" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNomProduit" runat="server" Text="Nom : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNomProduit" placeholder="Nom du produit" MaxLength="75" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="descriptionProduit" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="label1" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxDescriptionProduit" runat="server" Text="Description : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxDescriptionProduit" placeholder="Description du produit" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="typeProduit" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelTypeDeProduit" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="dropDownListTypeProduit" runat="server" Text="Type : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypeProduit" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div>
                <h2 id="h2AjouterPhotoProduit" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">Ajouter une photo</h2>
            </div>
            <div id="fileUpload" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1S col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:FileUpload ID="fileUploadPhotoProduit" accept=".png, .jpg, .jpeg" runat="server" />
                <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-lg-offset-5 col-md-offset-5 col-sm-offset-5 col-xs-offset-3 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Button ID="buttonEnregistrer" OnClick="buttonEnregistrer_Click" CssClass="btn-primary" runat="server" Text="Enregistrer" />
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
