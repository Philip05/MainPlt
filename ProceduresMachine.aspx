<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProceduresMachine.aspx.cs" Inherits="ProceduresMachine" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Procédures</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyProcedureMachine">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <h1 class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Procédures</h1>
            <asp:Button ID="buttonAssocierProcedureTelecharger" OnClick="buttonAssocierProcedureTelecharger_Click" class="col-lg-6 col-md-6 col-sm-6 col-xs-6" runat="server" CssClass="btn-primary" Text="Associer une procédure +" />
        </div>
        <br />
        <div id="divProcedures" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

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
