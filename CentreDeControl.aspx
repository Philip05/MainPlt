﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CentreDeControl.aspx.cs" Inherits="CentreDeControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Centre de contrôle</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="backgroundCentreDeControl">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Centre de contrôle</h1>
            </div>
            <div id="divAjouterCommentaire" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="form-group">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                         <asp:TextBox ID="textBoxAjouterCommentaire" placeholder="Inscrivez ici toute amélioration qui pourrait être apportée au projet" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="buttonAjouterUnCommentaire" OnClick="buttonAjouterUnCommentaire_Click" runat="server" CssClass="btn-primary col-lg-4 col-md-4 col-sm-12 col-xs-12" Text="Ajouter + " />
                </div>
            </div>
            <div id="divCommentaires" class="row col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-12 col-xs-12" runat="server">

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
