<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterUtilisateur.aspx.cs" Inherits="AjouterUtilisateur" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Ajouter un utilisateur</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyAjouterUtilisateur">
    <menu:Navbar runat="server" />
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 id="titreAjouterUtilisateur">Ajouter un utilisateur</h1>
            </div>
            <div id="formulaire">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-3 col-md-offset-3 col-sm-offset-1 col-xs-offset-1">
                            <label id="labelNom" for="textBoxNomUsager">Nom : </label>
                            <asp:TextBox ID="textBoxNomUsager" runat="server" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-3 col-md-offset-3 col-sm-offset-1 col-xs-offset-1">
                            <label id="labelPrenom" for="textBoxPrenomUsager">Prénom : </label>
                            <asp:TextBox ID="textBoxPrenomUsager" runat="server" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-3 col-md-offset-3 col-sm-offset-1 col-xs-offset-1">
                            <label id="labelMotDePasse" for="textBoxMotDePasse">Mot de passe : </label>
                            <asp:TextBox ID="textBoxMotDePasse" runat="server" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-3 col-md-offset-3 col-sm-offset-1 col-xs-offset-1 form-inline">
                        <asp:CheckBox ID="checkBoxAdministrateur" runat="server" />
                        <label id="labelCheckboxAdministrateur" class="checkbox">Si vous cochez cette case, l'utilisateur héritera des droits d'administrateurs, donc des mêmes droits que vous.</label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-3 col-md-offset-3 col-sm-offset-1 col-xs-offset-1">
                        <asp:Button ID="buttonAjouterUtilisateur" OnClick="buttonAjouterUtilisateur_Click" CssClass="btn-primary" runat="server" Text="Enregistrer le nouvel utilisateur" />
                    </div>
                </div>
            </div>
        </div>
        <menu:FooterConception runat="server"/>
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
