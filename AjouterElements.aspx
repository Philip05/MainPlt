<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterElements.aspx.cs" Inherits="AjouterElements" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Ajouter un élément</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyAjouterElement" style="background-image:url(ImagesLogiciel/BackgroundAjouterElement2.jpg)">
    <form id="form1" runat="server">
        <menu:Navbar runat="server"/>
        <div class="container-fluid" id="formulaireMachine">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 id="titreAjouterElement">Ajouter une machine</h1>
            </div>
            <div id="nomMachine" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="labelNomMachine" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNomElement" runat="server" Text="Nom : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNomElement" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="numeroMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelNumero" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNumero" runat="server" Text="# Model : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNumero" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
             <div id="numeroSerieMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelNumeroSerieMachine" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNumeroSerieMachine" runat="server" Text="# Série : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNumeroSerieMachine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="anneeMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelAnneeMachine" CssClass="col-lg-3 col-md-3 col-sm-5 col-xs-12" for="dropDownListAnneeMachine" runat="server" Text="Année : "></asp:Label>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListAnneeMachine" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div id="descriptionMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelDescriptionElement1" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxDescription" runat="server" Text="Description : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
             <div id="typeMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelTypeElement" CssClass="col-lg-3 col-md-3 col-sm-5 col-xs-12 col-lg-offset-0 col-md-offset-1 col-sm-offset-0 col-xs-offset-0" for="dropDownListTypeMachine" runat="server" Text="Type de machine : "></asp:Label>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypeMachine" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
             <div id="typeEmplacement" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelTypeEmplacement" CssClass="col-lg-3 col-md-3 col-sm-5 col-xs-12 col-lg-offset-0 col-md-offset-1 col-sm-offset-0 col-xs-offset-0" for="dropDownListTypeEmplacement" runat="server" Text="Emplacement : "></asp:Label>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypeEmplacement" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div>
                <h2 id="h2AjouterPhotoMachine" class="col-lg-4 col-md-4 col-sm-5 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Ajouter une photo</h2>
            </div>
            <div id="fileUpload" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-2 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:FileUpload ID="fileUploadPhotoMachine"  accept=".png, .jpg, .jpeg" runat="server" />
                <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-lg-offset-5 col-md-offset-6 col-sm-offset-5 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Button ID="buttonEnregistrer" OnClick="buttonEnregistrer_Click" CssClass="btn-primary" runat="server" Text="Enregistrer" UseSubmitBehavior="False" />
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
