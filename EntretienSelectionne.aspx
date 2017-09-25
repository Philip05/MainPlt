<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretienSelectionne.aspx.cs" Inherits="EntretienSelectionne" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Entretiens</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyEntretienSelectionne">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div id="left" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-lg-11 col-md-11 col-sm-12 col-xs-12 form-group">
                        <h2 id="h2TitreEntretienSelectionne">Entretiens</h2>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <asp:TextBox ID="textBoxRechercherEntretienMachine" AutoPostBack="true" CssClass="form-control" runat="server" OnTextChanged="textBoxRechercherEntretienMachine_TextChanged" placeholder="Rechercher un entretien"></asp:TextBox>
                        </div>
                        <asp:GridView ID="GridViewListeProduitsEntretien" GridLines="None" CssClass="table-responsive table" runat="server"
                            SelectMethod="GridViewListeProduitsEntretien_GetData"
                            UpdateMethod="GridViewListeProduitsEntretien_UpdateItem"
                            DataKeyNames="id"
                            AutoGenerateColumns="false"
                            AutoGenerateEditButton="true" OnRowCommand="GridViewListeProduitsEntretien_RowCommand">
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" />
                                <asp:BoundField DataField="Id" HeaderText="Numéro" />
                                <asp:BoundField DataField="TitreEntretien" HeaderText="Nom" />
                                <asp:BoundField DataField="Recurrence" HeaderText="Réccurence" />
                                <asp:BoundField DataField="DateProchainEntretien" HeaderText="Date du prochain entretien" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div id="right" class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                <div class="row">
                     <asp:Button ID="buttonAjouterEntretien" OnClick="buttonAjouterEntretien_Click" CssClass="col-lg-5 col-md-5 col-sm-12 col-xs-12 btn-primary" runat="server" Text="Ajouter un entretien + " />
                    <asp:Button ID="buttonAssocierProduit" OnClick="buttonAssocierProduit_Click" CssClass="col-lg-offset-1 col-lg-5 col-md-5 col-sm-12 col-xs-12 btn-primary" runat="server" Text="Associer à un produit" />
                </div>
                <div class="row">
                    <asp:Label ID="labelTitreNomEntretien" runat="server" CssClass="col-lg-12" Text="Nom de l'entretien : "></asp:Label>
                </div>
                <div class="form-group">
                    <label id="labeltextBoxDescriptionEntretien" for="textBoxDescriptionEntretien">Description : </label>
                    <asp:TextBox ID="textBoxDescriptionEntretien" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label id="labelTextBoxReccurence" for="TextBoxReccurence">Récurrence : </label>
                    <asp:TextBox ID="textBoxReccurence" CssClass="form-group" runat="server"></asp:TextBox>
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:Label ID="labelDateProchainEntretien1" runat="server" Text="Prochain entretien dû pour le "></asp:Label>
                <div class="row">
                    <asp:Label ID="labelTitreListeProduitsEntretien" runat="server" Text="Liste des produits affectés à cet entretien "></asp:Label>
                    <asp:GridView ID="GridViewProduitsEntretien" class="table-responsive table" GridLines="None" runat="server"
                        DataKeyNames="id"
                        SelectMethod="GridViewProduitsEntretien_GetData"
                        AutoGenerateColumns="false">
                           <Columns>
                                <asp:BoundField DataField="TitreEntretien" HeaderText="Entretien" />
                               <asp:BoundField DataField="Id" HeaderText="Numéro du produit" />
                                <asp:BoundField DataField="NomProduit" HeaderText="Produit" />
                               <asp:BoundField DataField="QuantiteProduitEntretien" HeaderText="Quantité" />
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="ButtonCommander" OnClientClick="HiddenField1.value = prompt('Quantité ','');" OnClick="ButtonCommander_Click" runat="server" Text="Commander" /></ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                    </asp:GridView>
                </div>
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
