﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimerEntretien.aspx.cs" Inherits="ImprimerEntretien" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Imprimer un entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyImprimerEntretiensProchainsJours">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
    <div class="container-fluid">
        <div class="row col-lg-offset-4 col-md-offset-4 col-sm-offset-3 col-xs-offset-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
             <h1 id="h1TitreImprimerEntretiens">Imprimer les entretiens et les remarques à venir</h1>
        </div>
        <div id="divDropDownListImprimerEntretien" class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-2 col-xs-offset-0 col-lg-12 col-md-12 col-sm-10 col-xs-12">
            <asp:Label ID="label1texteListe" runat="server" Text="Liste des entretiens à faire dans les"></asp:Label>
            <asp:DropDownList ID="dropDownListNombreJours" CssClass="btn btn-primary dropdown-toggle" runat="server"></asp:DropDownList>
            <asp:Label ID="label2texteListe" runat="server" Text="prochains jours."></asp:Label>
        </div>
        <div class="row">
            <asp:Button ID="buttonGenererLaliste" OnClick="buttonGenererLaliste_Click" CssClass="btn-primary col-lg-offset-4 col-md-offset-4 col-sm-offset-3 col-xs-offset-1 col-lg-3 col-md-3 col-sm-7 col-xs-10" runat="server" Text="Générer la liste" />
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
