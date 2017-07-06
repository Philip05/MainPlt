<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageAdministrateur.aspx.cs" Inherits="PageAdministrateur" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Page administrateur</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyPageAdministrateur">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="col-lg-8 col-md-8 col-sm-12 col-xs-12">Liste des utilisateurs</h1>
                <asp:Button ID="buttonAjouterUsager" CssClass="col-lg-offset-1 col-md-offset-1 btn-primary col-sm-offset-0 col-xs-offset-0 col-lg-2 col-md-2 col-sm-12 col-xs-12" OnClick="buttonAjouterUsager_Click" runat="server" Text="Ajouter un utilisateur +" />
            </div>
            <div class="row">
                <asp:GridView ID="gridViewListeUtilisateurs" HeaderStyle-ForeColor="Black" HorizontalAlign="Center" CssClass="table-responsive table table-striped" runat="server"
                    AutoGenerateColumns="false"
                    SelectMethod="gridViewListeUtilisateurs_GetData"
                    DataKeyNames="id"
                    OnRowCommand="gridViewListeUtilisateurs_RowCommand"
                    OnRowCancelingEdit="gridViewListeUtilisateurs_RowCancelingEdit">
                    <Columns>
                        <asp:CommandField ShowEditButton="true" />
                        <asp:BoundField DataField="Id" HeaderText="Numéro" />
                        <asp:BoundField DataField="Nom" HeaderText="Nom" />
                         <asp:BoundField DataField="Prenom" HeaderText="Prénom" />
                        <asp:BoundField DataField="Administrateur" HeaderText="Administrateur" />
                         <asp:BoundField DataField="DateInscription" HeaderText="Date d'inscription" />
                        <asp:BoundField DataField="MotDePasse" HeaderText="Mot de passe" />
                    </Columns>
                </asp:GridView>
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
