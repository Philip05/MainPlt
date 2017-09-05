<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DossierMachine.aspx.cs" Inherits="DossierMachine" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/FooterConception.ascx" TagName="FooterConception" TagPrefix="menu" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MainPlt - Machine</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="MainPlt. Service d'entretiens de l'équipement de l'usine." />
    <meta name="author" content="Philip Drouin" />
    <link rel="icon" href="ImagesLogiciel/IconePlessitech.jpg" />
    <link rel="apple-touch-icon" href="ImagesLogiciel/IconePlessitech.jpg"/>
    <meta name="robots" content="noodp" />
    <link rel="shortcut icon" href="ImagesLogiciel/IconePlessitech.jpg" />
</head>
<body id="bodyDossierMachine">
    <form id="form1" runat="server">
        <menu:Navbar runat="server" />
        <div class="container-fluid" id="containerDossierMachine">
                <div class="row form-inline">
                    <asp:Label ID="labelTypeElement" CssClass="col-lg-2 col-md-2 col-sm-12 col-xs-12" runat="server" Text=""></asp:Label>
                    <asp:Label ID="labelTitreNumeroSerieMachine" CssClass="col-lg-2 col-md-3 col-sm-12 col-xs-12" runat="server" Text="Machine"></asp:Label>
                    <asp:Label ID="labelTitreAnneeMachine" CssClass="col-lg-2 col-md-2 col-sm-12 col-xs-12" runat="server" Text=""></asp:Label>
                    <asp:Label ID="labelTypeEmplacement" CssClass="col-lg-2 col-md-3 col-sm-12 col-xs-12" runat="server" Text=""></asp:Label>
                    <asp:Label ID="labelNumeroMachine" CssClass="col-lg-2 col-md-3 col-sm-12 col-xs-12" runat="server" Text=""></asp:Label>
                </div>
            <div id="divDossierMachine">
                <div id="divLeftDossierMachine" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                     <asp:Label ID="labelTitreMachine" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" Text="Machine"></asp:Label>
                    <div id="divImageMachine" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Image ID="imageElementSelectionne" CssClass="img-responsive" runat="server" />
                        <asp:Label ID="labelAjouterPhotoMachine" runat="server" ForeColor="White" Text="Aucune image n'a été ajoutée à cette machine."></asp:Label>
                            <asp:FileUpload ID="fileUploadAjouterPhotoMachine" ForeColor="White" Font-Size="18px" accept=".png, .jpg, .jpeg" runat="server" />
                            <asp:Label ID="statusLabel" runat="server" Text=""></asp:Label>
                             <asp:Button ID="ButtonAjouterImage" ForeColor="Black" Font-Size="17px" OnClick="ButtonAjouterImage_Click" runat="server" Text="Ajouter l'image" />
                </div>
                </div>
                <div id="divRightDossierMachine" class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="divElement col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="labelEntretiensMachine" OnClick="labelEntretiensMachine_Click" Text="Entretiens"></asp:LinkButton>
                        </div>
                        <div¸class="divElement col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="labelEntretiensRecents" OnClick="labelEntretiensRecents_Click" Text="Entretiens récents"></asp:LinkButton>
                        </div>
                        <div class="divElement col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" ID="labelRemarquesMachine" OnClick="labelRemarquesMachine_Click" Text="Remarques de la machine"></asp:LinkButton>
                        </div>
                        <div class="divElement col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:LinkButton runat="server" OnClick="labelProceduresMachine_Click" ID="labelProceduresMachine" Text="Procédures"></asp:LinkButton>
                        </div>
                  </div>
               </div>
                <div id="divRight2DossierMachine" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                         <div>
                            <asp:TextBox ID="textBoxDescriptionMachine" TextMode="MultiLine" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" runat="server" Height="250px"></asp:TextBox>
                        </div>
                 </div>
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
