<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Procedures.aspx.cs" Inherits="Procedures" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Procédures</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyProcedures">
    <form id="form1" runat="server">
         <menu:Navbar runat="server"/>
        <div>
            <div class="container-fluid">
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <%--<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                        <asp:DropDownList ID="dropDownListTypesProcedure" AutoPostBack="true" OnSelectedIndexChanged="dropDownListTypesProcedure_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>--%>
                    <div class=" col-lg-offset-1 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <asp:TextBox ID="textBoxRechercherProcedure" AutoPostBack="true" OnTextChanged="textBoxRechercherProcedure_TextChanged" CssClass="form-control" placeholder="Rechercher une procédure" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h1 id="h1TitreProcedures" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Procédures</h1>
                </div>
                <div id="divProcedures" class="row" runat="server"></div>
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
