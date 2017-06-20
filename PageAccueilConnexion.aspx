<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageAccueilConnexion.aspx.cs" Inherits="PageAccueil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Connexion MainPlt</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyAccueil">
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 <img src="https://s3.amazonaws.com/owler-image/logo/plessitech_owler_20160229_042821_original.gif"/>
                    <h2 id="h2TitreAccueil">Entretiens et procédures de l'usine</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-offset-8 col-md-offset-8 col-sm-offset-6 col-xs-offset-4">
                <h2 id="h2ConnexionAccueil">Connexion</h2>
            </div>
        </div>
        <br /><br />
          <div class="row">
            <div class="col-lg-offset-8 col-md-offset-8 col-sm-offset-5 col-xs-offset-2">
                <asp:Label ID="LabelCodeAccueil" runat="server" Text="Code : " Font-Size="Large"></asp:Label>
                <asp:TextBox ID="TextBoxCode" runat="server" Font-Size="Large"></asp:TextBox>
            </div>
        </div>
        <br /><br /><br />
        <div class="row">
            <div class="col-lg-offset-9 col-md-offset-9 col-sm-offset-6 col-xs-offset-3">
                <asp:Button ID="ButtonConnexionAccueil" CssClass="bg-primary" runat="server" Text="Connexion" />
            </div>
        </div>
    </div> 
    </form>
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
</body>
</html>
