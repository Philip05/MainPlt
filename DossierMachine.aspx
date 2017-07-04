<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DossierMachine.aspx.cs" Inherits="DossierMachine" %>
<%@ Register src="~/Navbar.ascx" tagname="Navbar" tagprefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Machine</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyDossierMachine">
    <menu:Navbar runat="server"></menu:Navbar>
    <form id="form1" runat="server">
        <div class="container-fluid" id="containerDossierMachine">
                <div class="row col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 form-inline">
                    <asp:Label ID="labelTitreMachine" runat="server" Text="Machine"></asp:Label>
                    <asp:Label ID="labelTypeElement" runat="server" Text="L"></asp:Label>
                    <asp:Label ID="labelTypeEmplacement" runat="server" Text="L"></asp:Label>
                </div>
            <div id="divDossierMachine">
                <div id="divLeftDossierMachine" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Image ID="imageElementSelectionne" CssClass="img-responsive" runat="server" />
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
                            <asp:LinkButton runat="server" ID="labelProduitsMachine" OnClick="labelProduitsMachine_Click" Text="Produits"></asp:LinkButton>
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
