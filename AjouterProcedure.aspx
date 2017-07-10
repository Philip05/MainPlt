<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterProcedure.aspx.cs" Inherits="AjouterProcedure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="backgroundAjouterProcedure">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <h1 id="titreAjouterProcedure" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Ajouter une procédure</h1>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                        <label id="labelNomProcedure" for="textBoxNomProcedure">Titre : </label>
                        <asp:TextBox ID="textBoxNomProcedure" runat="server" CssClass="form-control">
                        </asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                        <label id="labelDescription" for="textBoxDescription">Description : </label>
                        <asp:TextBox ID="textBoxDescription" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:FileUpload ID="fileUploadProcedure" accept=".pdf" class="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0" runat="server" />
                <asp:Label ID="statusLabel" CssClass="col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-0" runat="server" Text=""></asp:Label>
            </div>
            <div class="row">
                <asp:Button ID="buttonEnregistrer" class="btn-primary col-lg-4 col-md-4 col-sm-11 col-xs-11 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" runat="server" OnClick="buttonEnregistrer_Click" Text="Enregistrer" />
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
