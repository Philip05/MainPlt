<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListeDesMachines.aspx.cs" Inherits="ListeDesMachines" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Liste des machines</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyListeMachines">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 id="h1TitreMachines" class="col-lg-4 col-md-4 col-sm-4 col-xs-12">Liste des machines enregistrées</h1>
                <div class="row col-lg-2 col-md-2 col-sm-2 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypesElement" OnSelectedIndexChanged="dropDownListTypesElement_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="row col-lg-2 col-md-2 col-sm-2 col-xs-12">
                    <asp:TextBox ID="textBoxRechercherMachine" CssClass="form-control" runat="server" placeholder="Rechercher une machine" OnTextChanged="textBoxRechercherMachine_TextChanged"></asp:TextBox>
                </div>
                <asp:Button ID="buttonAjouterElement" OnClick="buttonAjouterElement_Click" CssClass="btn-primary col-lg-2 col-md-2 col-sm-12 col-xs-12" runat="server" Text="Machine +" UseSubmitBehavior="False" />
            </div>
            <div class="row col-lg-10 col-md-10 col-sm-10 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0">
                <asp:GridView ID="gridViewMachines"  CssClass="table table-striped table-responsive"
                    DataKeyNames="id"
                    SelectMethod="gridViewMachines_GetData"
                    UpdateMethod="gridViewMachines_UpdateItem"
                    OnSelectedIndexChanged="gridViewMachines_SelectedIndexChanged"
                    AutoGenerateEditButton="True" AutoGenerateColumns="False" GridLines="None" BackColor="White" runat="server" OnRowCommand="gridViewMachines_RowCommand">
                    <Columns>
                        <asp:CommandField ShowSelectButton="true"/>
                        <asp:BoundField DataField="NomElement" HeaderText="Nom" />
                        <asp:BoundField DataField="NumeroElement" HeaderText="Numéro" />
                        <asp:BoundField DataField="NomTypeElement" HeaderText="Type" />
                    </Columns>
                </asp:GridView>
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
