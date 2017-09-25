<%@ Control Language="C#" ClassName="Navbar" AutoEventWireup="true" CodeFile="Navbar.ascx.cs" Inherits="Navbar" %>
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
                             <a href="ListeDesMachines.aspx" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Listes  <span class="caret"></span></a>
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
                                <li>
                                    <asp:LinkButton ID="linkButtonBatisse" OnClick="linkButtonBatisse_Click" runat="server">Batisse</asp:LinkButton>
                                </li>
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
                        <li><a href="MessagesTransition.aspx">Messages de transitions<span class="sr-only"></span></a></li>
                        <li><a href="Commandes.aspx">Commandes<span class="sr-only"></span></a></li>
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
                                    <asp:Label ID="labelNomUtilisateurConnecte" Font-Names="Time New Roman" runat="server" CssClass="glyphicon glyphicon-asterisk" Text="  Usager"></asp:Label>
                                </li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>
        </nav>