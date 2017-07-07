<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterElements.aspx.cs" Inherits="AjouterElements" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ajouter un élément</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" id="formulaireMachine">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1>Ajouter une machine</h1>
            </div>
            <div id="nomMachine" class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelNomMachine" CssClass="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2 col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNomElement" runat="server" Text="Nom : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNomElement" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="numeroMachine" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelNumero" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxNumero" runat="server" Text="Numéro : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxNumero" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="descriptionMachine" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelDescription" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="textBoxDescription" runat="server" Text="Description : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:TextBox ID="textBoxDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
             <div id="typeMachine" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="labelTypeElement" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="dropDownListTypeMachine" runat="server" Text="Type : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypeMachine" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
             <div id="typeEmplacement" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="label1" CssClass="col-lg-2 col-md-2 col-sm-5 col-xs-12" for="dropDownListTypeEmplacement" runat="server" Text="Type : "></asp:Label>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <asp:DropDownList ID="dropDownListTypeEmplacement" CssClass="form-control" runat="server"></asp:DropDownList>
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
