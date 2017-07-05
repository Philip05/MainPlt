﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListeRemarqueMachine.aspx.cs" Inherits="ListeRemarqueMachine" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Liste des remarques</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyListeRemarqueMachine">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div id="divLeftListeRemarques" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="labelTitreListeRemarque" runat="server" Text="Remarques faites sur "></asp:Label>
                </div>
                <div class="row col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <asp:TextBox ID="textBoxRechercherRemarque" placeholder="Rechercher une remarque" OnTextChanged="textBoxRechercherRemarque_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="row col-lg-10 col-md-8 col-sm-11 col-xs-11">
                    <asp:GridView ID="gridViewRemarques" CssClass="table-responsive table" GridLines="None" runat="server"
                        AutoGenerateColumns="false"
                        OnRowCommand="gridViewRemarques_RowCommand"
                        DataKeyNames="id"
                        SelectMethod="gridViewRemarques_GetData">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true"/>
                            <asp:BoundField DataField="Id" HeaderText="Numéro de remarque" />
                            <asp:BoundField DataField="TitreRemarque" HeaderText="Nom"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="divRightListeRemarques" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row">
                    <asp:Label ID="labelTitreDescriptionRemarque" runat="server" Text="Nom : "></asp:Label>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="form-group">
                        <label id="labeltextBoxDescriptionRemarque" for="textBoxDescriptionRemarque">Description : </label>
                        <asp:TextBox ID="textBoxDescriptionRemarque" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="row">
                    <asp:Label ID="labelTitrePhotos" runat="server" Text="Photos"></asp:Label>
                </div>
                <div id="divPhotosRemarque" class="img-responsive" runat="server">

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
