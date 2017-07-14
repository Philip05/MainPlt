<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accueil.aspx.cs" Inherits="Accueil" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>
<!DOCTYPE html>

<html id="htmlAccueil" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Accueil</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyAccueil">
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
            <div class="row" id="row1">
                <div id="divNouvelles" runat="server" class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                    <div id="divMachines" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1">
                        <h2 id="h2Machines" runat="server" class="divh2">Machines</h2>
                        <p class="textes">Voir, modifier ou ajouter des machines.</p>
                    </div>
                    <div id="divProduits" runat="server" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1 col2">
                        <h2 id="h2Produits" runat="server" class="divh2">Produits</h2>
                        <p class="textes">Voir, modifier ou ajouter des produits.</p>
                    </div>
                    <div id="divProcedures1" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1 col2">
                        <h2 id="h2Procedure" class="divh2">Procedures</h2>
                        <p class="textes">Imprimer ou voir la procédure à suivre pour un travail quelconque.</p>
                    </div>
                    <div id="divEntretiens" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1 col2">
                        <h2 id="h2Entretien" class="divh2">Imprimer</h2>
                        <p class="textes">Imprimer une liste des entretiens à faire dans les prochains jours.</p>
                    </div>
                    <div id="divAjout" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1 col2">
                        <h2 id="h2TypesMachine" class="divh2">Commenter</h2>
                        <p class="textes">Ajouter un commentaire sur le projet.</p>
                    </div>
                    <div id="divDeconnexion" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1 col2">
                        <h2 id="h2TypesProduits" class="divh2">Déconnexion</h2>
                        <p class="textes">Se déconnecter de sa session.</p>
                    </div>
                </div>
                <div id="divTitreNotifications" class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                    <h2 id="titreNotifications">Notifications</h2>
                    <asp:LinkButton runat="server" id="imprimerNotifications" OnClick="imprimerNotifications_Click" CssClass="glyphicon glyphicon-print"></asp:LinkButton>
                    <asp:Panel ID="panelNotifications" class="col-lg-offset-7 col-md-offset-7 col-sm-offset-7 col-xs-offset-7 col-lg-7 col-md-12 col-sm-12 col-xs-12 img-responsive" runat="server" Style="margin-left: 1040px" Width="850px" Height="610px" ScrollBars="Vertical"></asp:Panel>
                </div>
            </div>
            <div id="divChangerDateEntretien" runat="server" class="col-lg-offset-4 col-md-offset-4 col-sm-offset-3 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="panelDateProchainEntretien" CssClass="col-lg-4 col-md-4 col-sm-8 col-xs-10" runat="server">
                    <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h2>Changer la date de l'entretien </h2>
                    </div>
                    <div class="row">
                        <asp:Calendar ID="calendarDate" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-0 col-lg-8 col-md-8 col-sm-10 col-xs-12" OnSelectionChanged="calendarDate_SelectionChanged" runat="server"></asp:Calendar>
                    </div>
                    <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:TextBox ID="textBoxProchaineDate" placeholder="yyyy-mm-jj" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Button ID="buttonOk" OnClick="buttonOk_Click" CssClass="btn-primary col-lg-4 col-md-4 col-sm-12 col-xs-12" runat="server" Text="Enregistrer" />
                        <asp:Button ID="buttonCancel" OnClick="buttonCancel_Click" CssClass="btn-primary col-lg-5 col-md-5 col-sm-12 col-xs-12" runat="server" Text="Quitter" />
                    </div>
                </asp:Panel>
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
