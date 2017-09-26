<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commandes.aspx.cs" Inherits="Commandes" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Commandes</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="backgroundCommande">
    <form runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="col-lg-10 col-md-10 col-sm-10 col-xs-12" style="color:white">Commandes</h1>
                 <asp:LinkButton runat="server" ID="imprimerCommandes" OnClick="imprimerNotifications_Click" CssClass="glyphicon glyphicon-print col-lg-2 col-md-2 col-sm-2 col-xs-12"></asp:LinkButton>
            </div>
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:GridView ID="GridViewCommandes" AutoGenerateColumns="false" CssClass="table table-responsive table-striped table-hover" GridLines="None" runat="server" OnRowCommand="GridViewCommandes_RowCommand" OnRowDataBound="GridViewCommandes_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="Commander" ShowDeleteButton="true" DeleteText="Supprimer" />
                        <asp:BoundField DataField="Id" HeaderText="Numéro de commande" />
                        <asp:BoundField DataField="Commande" HeaderText="Commandé" />
                        <asp:BoundField DataField="Numéro" HeaderText="Numéro du produit" />
                        <asp:BoundField DataField="NomProduit" HeaderText="Produit" />
                        <asp:BoundField DataField="DescriptionProduit" HeaderText="Description" />
                        <asp:BoundField DataField="NomTypeProduit" HeaderText="Type" />
                        <asp:BoundField DataField="Quantite" HeaderText="Quantité" />
                    </Columns>
                </asp:GridView>
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
