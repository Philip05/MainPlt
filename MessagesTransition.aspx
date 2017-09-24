<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessagesTransition.aspx.cs" Inherits="MessagesTransition" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Messages de transition</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="backgroundMessageTransition">
    <form id="form1" runat="server">
        <menu:Navbar runat="server"/>
        <div class="container-fluid">
            <div class="row col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="col-lg-12 col-md-12 col-sm-12 col-xs-12">Messages</h1>
            </div>
            <div id="divAjouterMessage" class="row col-lg-offset-2 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="form-group">
                    <div class="col-lg-8 col-md-9 col-sm-12 col-xs-12 ">
                         <asp:TextBox ID="textBoxAjouterMessage" placeholder="Inscrivez votre message" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="buttonAjouterUnMessage"  OnClick="buttonAjouterUnMessage_Click" runat="server" CssClass="btn-primary col-lg-4 col-md-3 col-sm-12 col-xs-12" Text="Ajouter + " />
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

