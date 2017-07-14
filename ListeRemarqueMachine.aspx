<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListeRemarqueMachine.aspx.cs" Inherits="ListeRemarqueMachine" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Liste des remarques</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyListeRemarqueMachine">
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
            <div id="divLeftListeRemarques" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="labelTitreListeRemarque" runat="server" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" Text="Remarques faites sur "></asp:Label>
                </div>
                <div class="row col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <asp:TextBox ID="textBoxRechercherRemarque" placeholder="Rechercher une remarque" OnTextChanged="textBoxRechercherRemarque_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="row col-lg-10 col-md-8 col-sm-11 col-xs-11">
                    <asp:GridView ID="gridViewRemarques" CssClass="table-responsive table" GridLines="None" runat="server"
                        AutoGenerateColumns="false"
                        OnRowCommand="gridViewRemarques_RowCommand"
                        DataKeyNames="id"
                        SelectMethod="gridViewRemarques_GetData">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true"/>
                            <asp:BoundField DataField="Id" HeaderText="Numéro de remarque" />
                            <asp:BoundField DataField="TitreRemarque" HeaderText="Nom"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="divRightListeRemarques" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="labelTitreDescriptionRemarque" CssClass="col-lg-5 col-md-5 col-sm-12 col-xs-12" runat="server" Text="Nom : "></asp:Label>
                    <asp:Button ID="buttonAjouterRemarqueSansEntretien" OnClick="buttonAjouterRemarqueSansEntretien_Click" runat="server" CssClass=" btn-primary col-lg-7 col-md-7 col-sm-12 col-xs-12" Text="Ajouter une remarque sans entretien + " UseSubmitBehavior="False" />
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group">
                        <label id="labeltextBoxDescriptionRemarque" for="textBoxDescriptionRemarque">Description : </label>
                        <asp:TextBox ID="textBoxDescriptionRemarque" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="row">
                    <asp:Label ID="labelTitrePhotos" runat="server" Text="Photos"></asp:Label>
                </div>
                <div id="divPhotosRemarque" class="img-responsive" runat="server">

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
