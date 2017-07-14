﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageAdministrateur.aspx.cs" Inherits="PageAdministrateur" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Page administrateur</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyPageAdministrateur">
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
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="col-lg-8 col-md-8 col-sm-12 col-xs-12">Liste des utilisateurs</h1>
                <asp:Button ID="buttonAjouterUsager" CssClass="col-lg-offset-1 col-md-offset-1 btn-primary col-sm-offset-0 col-xs-offset-0 col-lg-2 col-md-2 col-sm-12 col-xs-12" OnClick="buttonAjouterUsager_Click" runat="server" Text="Ajouter un utilisateur +" UseSubmitBehavior="False" />
            </div>
            <div class="row">
                <asp:GridView ID="gridViewListeUtilisateurs" HeaderStyle-ForeColor="Black" HorizontalAlign="Center" CssClass="table-responsive table table-striped" runat="server"
                    AutoGenerateColumns="false"
                    SelectMethod="gridViewListeUtilisateurs_GetData"
                    DataKeyNames="id"
                    OnRowCommand="gridViewListeUtilisateurs_RowCommand"
                    OnRowCancelingEdit="gridViewListeUtilisateurs_RowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Numéro" />
                        <asp:BoundField DataField="Nom" HeaderText="Nom" />
                        <asp:BoundField DataField="Prenom" HeaderText="Prénom" />
                        <asp:BoundField DataField="Administrateur" HeaderText="Administrateur" />
                        <asp:BoundField DataField="DateInscription" HeaderText="Date d'inscription" />
                        <asp:TemplateField HeaderText=" Modifier le mot de passe">
                            <ItemTemplate>
                                <asp:Button ID="buttonModifierCode" OnClick="ButtonModifierCode_Click" runat="server"
                                    CommandName="modifierCode" ForeColor="Black" Text="Modifier le code" CommandArgument='<%#Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                <asp:Panel ID="panelDateProchainEntretien" runat="server">
                    <asp:Label ID="labelCode" runat="server" Text="  Nouveau mot de passe :"></asp:Label>
                    <asp:TextBox ID="textBoxNouveauMotDePasse" runat="server"></asp:TextBox>
                    <asp:Button ID="buttonOk" Enabled="true" runat="server" Text="Ok" />
                    <asp:Button ID="buttonEnregistrer" OnClick="buttonEnregistrer_Click" runat="server" Text="Enregistrer" />
                    <asp:Button ID="buttonCancel" runat="server" Text="Annuler" />
                </asp:Panel>
                <asp:ModalPopupExtender ID="ModalPopupExtender1" PopupControlID="panelDateProchainEntretien" runat="server" CancelControlID="buttonCancel" TargetControlID="buttonOk">
                    
                </asp:ModalPopupExtender>
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
