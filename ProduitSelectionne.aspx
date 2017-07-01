<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProduitSelectionne.aspx.cs" Inherits="ProduitSelectionne" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Produit</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyProduitSelectionne">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div id="divLeftProduitSelectionne" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row">
                    <h1 id="h1TitreProduits" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Liste des produits</h1>
                </div>
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <img src="http://learchem.com/userfiles/assorted%20bearings.png" id="imgProduitSelectionne" />
                </div>
                <div class="row col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                    <asp:GridView ID="GridViewProduits" runat="server" CssClass="table-responsive "></asp:GridView>
                </div>
            </div>
            <div id="divRightProduitSelectionne" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row">
                    <asp:Label ID="labelTitreNomProduit" runat="server" Text="Nom du Produit"></asp:Label>
                </div>
                <div class="row">
                    <div>
                        <div class="form-group">
                            <label id="labeltextBoxDescriptionProduit" for="textBoxDescriptionProduit">Description : </label>
                            <asp:TextBox ID="textBoxDescriptionProduit" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="labelTypeProduit" runat="server" Text="Type du produit : "></asp:Label>
                </div>
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
