<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretienSelectionne.aspx.cs" Inherits="EntretienSelectionne" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyEntretienSelectionne">
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
                        <li class="dropdown">
                            <a href="ListeDesMachines.aspx" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Machines  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:LinkButton ID="linkButtonVéhicules" OnClick="linkButtonVéhicules_Click" runat="server">Véhicules</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="linkButtonUsinage" OnClick="linkButtonUsinage_Click" runat="server">Usinage</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="linkButtonRemorque" OnClick="linkButtonRemorque_Click" runat="server">Remorques</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="linkButtonPontsRoulants" OnClick="linkButtonPontsRoulants_Click" runat="server">Ponts roulants</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="linkButtonSoudeuse" OnClick="linkButtonSoudeuse_Click" runat="server">Soudeuses</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="linkButtonAirMakeUp" OnClick="linkButtonAirMakeUp_Click" runat="server">Air make up</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Listes  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ProduitSelectionne.aspx">Produits</a></li>
                                <li><a href="Procedures.aspx">Procédures</a></li>
                                <li><a href="EntretienSelectionne.aspx">Entretiens</a></li>
                                <li><a href="ListeRemarqueMachine.aspx">Remarques</a></li>
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
                    <asp:Label ID="labelTitreNomEntretien" runat="server" Text="Nom de l'entretien : "></asp:Label>
                </div>
                <div class="form-group">
                    <label id="labeltextBoxDescriptionEntretien" for="textBoxDescriptionEntretien">Description : </label>
                    <asp:TextBox ID="textBoxDescriptionEntretien" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label id="labelTextBoxReccurence" for="TextBoxReccurence">Récurrence : </label>
                    <asp:TextBox ID="textBoxReccurence" CssClass="form-group" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="labelDateProchainEntretien1" runat="server" Text="Prochain entretien dû pour le "></asp:Label>
                <div class="row">
                    <asp:Label ID="labelTitreListeProduitsEntretien" runat="server" Text="Liste des produits affectés à cet entretien "></asp:Label>
                    <asp:GridView ID="GridViewProduitsEntretien" class="table-responsive table" GridLines="None" runat="server"
                        DataKeyNames="id"
                        SelectMethod="GridViewProduitsEntretien_GetData"
                        AutoGenerateColumns="false">
                           <Columns>
                                <asp:BoundField DataField="TitreEntretien" HeaderText="Entretien" />
                                <asp:BoundField DataField="NomProduit" HeaderText="Produit" />
                                <asp:BoundField DataField="Id" HeaderText="Numéro du produit" />
                            </Columns>
                    </asp:GridView>
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
