﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprimerEntretien.aspx.cs" Inherits="ImprimerEntretien" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Imprimer les entretiens à venir</title>
     <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyImprimerEntretiensProchainsJours">
    <form id="form1" runat="server">
     <nav class="navbar navbar-default">
            <div class="container-fluid" id="navbarColor">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand glyphicon glyphicon-ok-sign" href="Accueil.aspx">Bienvenue </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="ListeDesMachines.aspx">Machines<span class="sr-only"></span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Listes  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ListeDesMachines.aspx">Machines</a></li>
                                <li><a href="ProduitSelectionne.aspx">Produits</a></li>
                                <li><a href="Procedures.aspx">Procédures</a></li>
                                <li><a href="EntretienSelectionne.aspx">Entretiens</a></li>
                                <li><a href="ListeRemarqueMachine.aspx">Remarques</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ajouter  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="AjouterElements.aspx">Machine</a></li>
                                <li><a href="AjouterProduit.aspx">Produit</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Imprimer  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Procedures.aspx">Une procédure</a></li>
                                <li><a href="ImprimerEntretien.aspx">Une liste d'entretiens</a></li>
                            </ul>
                        </li>
                         <li><a href="CentreDeControl.aspx">Commentaires<span class="sr-only"></span></a></li>
                        <li runat="server" id="liAdministrateur">
                            <a href="PageAdministrateur.aspx">
                                <asp:Label ID="labelAdministrateur" runat="server" Text="Administrateur"></asp:Label></a>
                        </li>
                    </ul>
                    <div class="navbar-form pull-right form-inline">
                        <li class="dropdown" runat="server" id="deconnexionNavbar">
                            <a>
                                <asp:LinkButton ID="buttonDeconnexionNavbar" runat="server" OnClick="buttonDeconnexionNavbar_Click">Déconnexion</asp:LinkButton><span class="glyphicon glyphicon-user" runat="server"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:Label ID="labelNomUtilisateurConnecte" runat="server" CssClass="glyphicon glyphicon-asterisk" Text="  Usager"></asp:Label>
                                </li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>
        </nav>
    <div class="container-fluid">
        <div class="row col-lg-offset-4 col-md-offset-4 col-sm-offset-3 col-xs-offset-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
             <h1 id="h1TitreImprimerEntretiens">Imprimer les entretiens à venir</h1>
        </div>
        <div id="divDropDownListImprimerEntretien" class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-2 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:Label ID="label1texteListe" runat="server" Text="Liste des entretiens à faire dans les"></asp:Label>
            <asp:DropDownList ID="dropDownListNombreJours" CssClass="btn btn-primary dropdown-toggle" runat="server"></asp:DropDownList>
            <asp:Label ID="label2texteListe" runat="server" Text="prochains jours."></asp:Label>
        </div>
        <div class="row">
            <asp:Button ID="buttonGenererLaliste" OnClick="buttonGenererLaliste_Click" CssClass="btn-primary col-lg-offset-4 col-md-offset-4 col-sm-offset-3 col-xs-offset-1 col-lg-3 col-md-3 col-sm-10 col-xs-10" runat="server" Text="Générer la liste" />
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
