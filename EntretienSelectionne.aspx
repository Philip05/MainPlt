<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretienSelectionne.aspx.cs" Inherits="EntretienSelectionne" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyEntretienSelectionne">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div id="left" class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
                        <h2 id="h2TitreEntretienSelectionne">Entretiens</h2>
                    </div>
                    <div class="row col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <asp:DropDownList ID="dropDownListEntretiensMachine" OnSelectedIndexChanged="dropDownListEntretiensMachine_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:TextBox ID="textBoxRechercherEntretienMachine" CssClass="form-control" runat="server" placeholder="Rechercher une machine" OnTextChanged="textBoxRechercherEntretienMachine_TextChanged"></asp:TextBox>
                    </div>
                    <asp:GridView ID="GridViewListeProduitsEntretien" GridLines="None" OnSelectedIndexChanged="GridViewListeProduitsEntretien_SelectedIndexChanged" CssClass="table-responsive table" runat="server"
                        SelectMethod="GridViewListeProduitsEntretien_GetData"
                        UpdateMethod="GridViewListeProduitsEntretien_UpdateItem"
                        DataKeyNames="id"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="true">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" />
                            <asp:BoundField DataField="TitreEntretien" HeaderText="Nom" />
                            <asp:BoundField DataField="Recurrence" HeaderText="Réccurence" />
                            <asp:BoundField DataField="DateProchainEntretien" HeaderText="Date du prochain entretien" />
                            <asp:BoundField DataField="DescriptionEntretien" HeaderText="Description" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <div id="right" class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
            <div class="row">
                <asp:Label ID="labelTitreNomEntretien" runat="server" Text="Nom de l'entretien : "></asp:Label>
            </div>
            <div class="form-group">
                <label id="labeltextBoxDescriptionEntretien" for="textBoxDescriptionEntretien">Description : </label>
                <asp:TextBox ID="textBoxDescriptionEntretien" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label id="labelTextBoxReccurence" for="TextBoxReccurence">Réccurence : </label>
                <asp:TextBox ID="textBoxReccurence" CssClass="form-group" runat="server"></asp:TextBox>
            </div>
            <asp:Label ID="labelDateProchainEntretien" runat="server" Text="Prochain entretien dû pour le "></asp:Label>
            <div class="row">
                <asp:Label ID="labelTitreListeProduitsEntretien" runat="server" Text="Liste des produits affectés à cet entretien "></asp:Label>
                <asp:GridView ID="GridViewProduitsEntretien" class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2" runat="server"></asp:GridView>
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
