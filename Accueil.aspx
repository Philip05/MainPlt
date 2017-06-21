<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accueil.aspx.cs" Inherits="Accueil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Accueil</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyAccueil">
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
                </ul>
                <form class="navbar-form pull-right form-inline">
                    <li id="deconnexion"><a href="PageAccueilConnexion.aspx"><span class="glyphicon glyphicon-user"></span>Déconnexion</a></li>
                </form>
            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <form id="form1" runat="server">
        <div class="container-fluid">
                <div class="row" id="row1">
                    <div id="divMachines" class="col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col1">frefrgr</div> 
                    <div id="divTitreNotifications" class="col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-1 col-lg-7 col-md-7 col-sm-7 col-xs-7" style="margin-right: 42px">
                        <h2 id="titreNotifications">Notifications</h2>
                        <asp:GridView ID="GridViewNotifications" runat="server" CssClass="table-responsive" Width="1318px"></asp:GridView>
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
