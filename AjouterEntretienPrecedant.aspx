<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjouterEntretienPrecedant.aspx.cs" Inherits="AjouterEntretienPrecedant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html">

<html xmlns="http://www.w3.org/1999/xhtml" id="bodyHtmlEntretienPrecedant">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Compléter un entretien</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyEntretienPrecedantAjout">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div>
                        <asp:Label ID="labelTitreAjouterEntretien" class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2" runat="server" Text="Compléter un entretien sur "></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                        <asp:Label ID="labelTypeEntretien" runat="server" Text="Entretien : "></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                        <asp:Label ID="labelDateEntretien" runat="server" Text="Date : "></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div>
                        <div class="form-group">
                            <div>
                                <label id="labeltextBoxDescriptionAjouterEntretien" class="col-lg-offset-5 col-md-offset-5 col-sm-offset-3 col-xs-offset-2" for="textBoxDescriptionProduit">Description : </label>
                                <asp:TextBox ID="textBoxDescriptionAjouterEntretien" placeholder="Comment s'est passé l'entretien ?" TextMode="MultiLine" Height="250px" CssClass="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="row">
                    <div>
                        <div class="form-group">
                            <div>
                                <h1 class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-lg-offset-5 col-md-offset-5 col-sm-offset-5 col-xs-offset-5" style="color: white">Ajouter une remarque</h1>
                                <asp:CheckBox ID="buttonAjouterRemarqueEntretien" Text="Cochez si vous désirez ajouter une remarque à cet entretien" ForeColor="White" AutoPostBack="true" CssClass="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-5 col-md-offset-5 col-sm-offset-5 col-xs-offset-5" OnCheckedChanged="buttonAjouterRemarqueEntretien_CheckedChanged" runat="server" Font-Size="Large" Height="50" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="container-fluid" id="divRemarque" runat="server">
                    <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
                        <asp:Label ID="labelNom" runat="server" ForeColor="White" Text="Nom : "></asp:Label>
                        <asp:TextBox ID="textBoxNom" placeholder="Nom de la remarque" MaxLength="100" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
                        <asp:Label ID="labelDescriptionRemarque1" runat="server" Text="Description : "></asp:Label>
                        <asp:TextBox ID="textBoxDescrition" placeholder="Description de la remarque" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                     <div class="row rowRemarque col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7">
                         <asp:CheckBox ID="checkBoxPressant" AutoPostBack="true" OnCheckedChanged="checkBoxPressant_CheckedChanged" Text="Remarque pressante (Sera affichée en rouge)" CssClass="col-lg-4 col-md-4 col-sm-4 col-xs-12 checkRemarque" runat="server" />
                         <asp:CheckBox ID="checkBoxNonPressant" AutoPostBack="true" OnCheckedChanged="checkBoxNonPressant_CheckedChanged" Text="Remarque non-pressante (Sera affichée en vert)" CssClass="col-lg-4 col-md-4 col-sm-4 col-xs-12 checkRemarque" runat="server" />
                         <asp:CheckBox ID="checkBoxNePasAfficher" AutoPostBack="true" OnCheckedChanged="checkBoxNePasAfficher_CheckedChanged" Text="Ne pas afficher la remarque (Ne sera pas affichée)." CssClass="col-lg-4 col-md-4 col-sm-4 col-sm-1 col-xs-12 checkRemarque" runat="server" />
                    </div>
                    <div class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 col-lg-7 col-md-7 col-sm-7 col-xs-7 rowRemarque">
                        <asp:FileUpload ID="FileUploadImages" ForeColor="White" accept=".png, .jpg, .jpeg" AllowMultiple="true" CssClass="rowRemarque col-lg-9 col-md-9 col-sm-12 col-xs-12" runat="server" />
                        <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                        <asp:Label ID="labelResponsableEntretien" runat="server" Text="Responsable : "></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                        <asp:Label ID="labelRecurrenceEntretien" runat="server" Text="Récurrence :"></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-2">
                        <asp:Label ID="labelDateProchainEntretien1" runat="server" Text="Date du prochain entretien :"></asp:Label>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-5 col-md-offset-5 col-sm-offset-3 col-xs-offset-1">
                        <asp:Button ID="buttonAjouterEntretien" OnClick="buttonAjouterEntretien_Click" CssClass="btn-primary" runat="server" Text="Ajouter l'entretien +" />
                    </div>
                </div>
            </div>
        </div>
        <menu:FooterConception runat="server" />
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
