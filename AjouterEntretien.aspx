<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterEntretien.aspx.cs" Inherits="AjouterEntretien" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Ajouter un entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="backgroundAjouterEntretien">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 id="titreAjouterEntretien">Ajouter un entretien</h1>
            </div>
            <div id="nomEntretien" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="labelNomEntretien" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNomEntretien" runat="server" Text="Nom : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNomEntretien" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="descriptionMachine" class="row form-group col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelDescriptionEntretien" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxDescriptionEntretien" runat="server" Text="Description : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxDescriptionEntretien" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="labelRecurrence" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:Label ID="label1" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxRecurrence" runat="server" Text="Récurrence (jours) : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxRecurrence" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="labelProchaineDate" class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <div class="form-group">
                     <asp:Label ID="labelDateProchainEntretien2" ForeColor="White" CssClass="col-lg-3 col-md-4 col-sm-4 col-xs-12" for="textBoxDateProchainEntretien" runat="server" Text="Date du prochain entretien : "></asp:Label>
                    <asp:ToolkitScriptManager ID="ToolkitScriptManagerDateProchainEntretien" runat="server"></asp:ToolkitScriptManager>
                    <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12">
                        <asp:TextBox ID="textBoxDateProchainEntretien" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtenderDateProchainEntretien" runat="server" TargetControlID="textBoxDateProchainEntretien"></asp:CalendarExtender>
                    </div>
                </div>
                </>
            </div>
            <div>
                <div class="row form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-4 col-md-offset-4 col-sm-offset-1 col-xs-offset-0">
                    <asp:Button ID="buttonEnregistrer" OnClick="buttonEnregistrer_Click" CssClass="btn-primary col-lg-3 col-md-3 col-sm-6 col-xs-12 col-lg-offset-1 col-md-offset-4 col-sm-offset-1 col-xs-offset-0" runat="server" Text="Enregistrer" />
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
