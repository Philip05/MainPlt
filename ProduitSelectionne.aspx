﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProduitSelectionne.aspx.cs" Inherits="ProduitSelectionne" Culture="fr-CA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>
<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Produits</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyProduitSelectionne">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div id="divLeftProduitSelectionne" class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <div class="row">
                    <h1 id="h1TitreProduits" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Liste des produits</h1>
                </div>
                <div class="row col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypesProduit" OnSelectedIndexChanged="dropDownListTypesProduit_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="row col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <asp:TextBox ID="textBoxRechercherProduit" CssClass="form-control" runat="server" placeholder="Rechercher un produit" OnTextChanged="textBoxRechercherProduit_TextChanged"></asp:TextBox>
                </div>
                <div>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </div>
                <div class="row">
                    <asp:GridView ID="gridViewProduits" runat="server" CssClass="table-responsive table-striped table col-lg-11"
                        DataKeyNames="id"
                        AutoGenerateColumns="false"
                        SelectMethod="gridViewProduits_GetData"
                        UpdateMethod="gridViewProduits_UpdateItem"
                        AutoGenerateEditButton="true"
                        GridLines="None" OnRowCommand="gridViewProduits_RowCommand">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true"/>
                            <asp:BoundField DataField="Id" HeaderText="Numéro" />
                            <asp:BoundField DataField="NomProduit" HeaderText="Nom" />
                            <asp:BoundField DataField="DescriptionProduit" HeaderText="Description" />
                            <asp:BoundField DataField="NomTypeProduit" HeaderText="Type" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="divRightProduitSelectionne" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-1">
                <div class="row">
                    <asp:Button ID="buttonAjouterProduit" OnClick="buttonAjouterProduit_Click" CssClass="btn-primary col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" runat="server" Text="Ajouter un produit +" CausesValidation="False" UseSubmitBehavior="False" />
                    <asp:Button ID="buttonCommander" OnClientClick="HiddenField1.value = prompt('Quantité ','');" runat="server" OnClick="buttonCommander_Click" CssClass="btn-primary col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" Text="Commander le produit" />
                    <asp:Label ID="labelTitreNomProduit" runat="server" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" Text="Nom du Produit : "></asp:Label>
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
                <div class="row">
                    <asp:Label ID="labelPhotosProduit" runat="server" Text="Photos"></asp:Label>
                </div>
                <div class="row" id="divPhotosProduit" runat="server">
                </div>
            </div>
        </div>
        <menu:FooterConception runat="server" />
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
