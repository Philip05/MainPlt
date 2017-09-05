<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssocierProduitEntretien.aspx.cs" Inherits="AssocierProduitEntretien" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Associer un entretien</title>
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
                <asp:Label class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-0" id="titreAjouterProduit" runat="server"></asp:Label>
            </div>
            <div id="nomProduit" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-0">
                    <asp:TextBox ID="textBoxRechercherNomProduit" CssClass="form-control" runat="server" placeholder="Rechercher un produit" OnTextChanged="textBoxRechercherNomProduit_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div id="Gridview" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="label1" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxDescriptionProduit" runat="server" Text="Produits : "></asp:Label>
                 <asp:GridView ID="GridViewProduitsEntretien" class="table-responsive table" GridLines="None" runat="server"
                        DataKeyNames="id"
                        SelectMethod="GridViewProduitsEntretien_GetData"
                        AutoGenerateColumns="false" OnRowCommand="GridViewProduitsEntretien_RowCommand">
                           <Columns>
                               <asp:CommandField ShowSelectButton="true" />
                                <asp:BoundField DataField="Id" HeaderText="Numéro du produit" />
                                <asp:BoundField DataField="NomProduit" HeaderText="Produit" />
                                <asp:BoundField DataField="NomTypeProduit" HeaderText="Type" />
                            </Columns>
                    </asp:GridView>
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
