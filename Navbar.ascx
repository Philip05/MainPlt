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
            <a class="navbar-brand glyphicon glyphicon-ok-sign" href="Accueil.aspx">Bienvenue</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Accueil.aspx">Accueil<span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Entretiens<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="accueil.html">Usinage</a></li>
                        <li><a href="inscription.html">Soudure</a></li>
                        <li><a href="inscription.html">Chariots élévateurs</a></li>
                        <li><a href="inscription.html">Bâtiment</a></li>
                        <li><a href="inscription.html">Cours</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Procédures<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="Jupiter.html">Ponts roulants</a></li>
                        <li><a href="Gallerie.html">Soudeuses</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Autres <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="Jeu.html">Jeu de l'espace</a></li>
                    </ul>
                </li>
                <li runat="server" id="liAdministrateur">
                    <a href="PageAdministrateur.aspx">
                        <asp:Label ID="labelAdministrateur" runat="server" Text="Administrateur"></asp:Label></a>
                </li>
            </ul>
            <form class="navbar-form pull-right form-inline">
                <li class="dropdown" runat="server" id="deconnexionNavbar">
                    <a>
                        <asp:Label ID="labelNavbarDeconnexion" runat="server" Text="Déconnexion"></asp:Label><span class="glyphicon glyphicon-user" runat="server"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <asp:Label ID="labelNomUtilisateurConnecte" runat="server" CssClass="glyphicon glyphicon-asterisk" Text="  Philip Drouin"></asp:Label>
                        </li>
                    </ul>
                </li>
                <script type="text/javascript" src="Navbar.ascx"></script>
            </form>
        </div>
    </div>
</nav>
<script> 
    $("#labelNavbarDeconnexion").mouseover(function () {
        alert("");
    });
</script>