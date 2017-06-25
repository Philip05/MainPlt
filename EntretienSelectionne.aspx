<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretienSelectionne.aspx.cs" Inherits="EntretienSelectionne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyEntretienSelectionne">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3">
                <asp:Label ID="labelTitreNomEntretien" runat="server" Text="Nom de l'entretien"></asp:Label>
            </div>
            <div class="row">
                <div>
                    <div class="form-group">
                        <label id="labeltextBoxDescriptionEntretien" for="textBoxDescriptionEntretien">Description : </label>
                        <asp:TextBox ID="textBoxDescriptionEntretien" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label id="labelTextBoxReccurence" for="TextBoxReccurence">Réccurence : </label>
                        <asp:TextBox ID="textBoxReccurence" CssClass="form-group" runat="server"></asp:TextBox>
                    </div>
                    <asp:Label ID="labelDateProchainEntretien" runat="server" Text="Prochain entretien dû pour le "></asp:Label>
                </div>
            </div>
        </div>
        <br /><br />
        <div class="row">
            <asp:Label ID="labelTitreListeProduitsEntretien" runat="server" class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2" Text="Liste des produits affectés à cet entretien "></asp:Label>
            <asp:GridView ID="GridViewProduitsEntretien" class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2" runat="server"></asp:GridView>
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
