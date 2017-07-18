<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretiensMachine.aspx.cs" Inherits="EntretiensMachine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="~/Navbar.ascx" TagName="Navbar" TagPrefix="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Entretiens de la machine</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyEntretiensMachine">
    <form id="form1" runat="server">
         <menu:Navbar runat="server" />
        <div class="container-fluid">
            <div id="divLeftEntretienMachine" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                    <asp:Label ID="labelTitreEntretiensMachine" runat="server" Text="Entretiens récents "></asp:Label>
                </div>
                <div class="row col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <asp:TextBox ID="textBoxRechercherEntretienMachine" CssClass="form-control" runat="server" placeholder="Rechercher une machine" OnTextChanged="textBoxRechercherMachine_TextChanged"></asp:TextBox>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:GridView ID="gridViewEntretiensMachine" runat="server" GridLines="None" CssClass="table-responsive table col-lg-12"
                        SelectMethod="gridViewEntretiensMachine_GetData"
                        OnRowCommand="gridViewEntretiensMachine_RowCommand"
                        AutoGenerateColumns="false"
                        DataKeyNames="id">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" />
                            <asp:BoundField DataField="Id" HeaderText="Numéro d'entretien" />
                            <asp:BoundField DataField="TitreEntretien" HeaderText="Entretien" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div id="divLRightEntretienMachine" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                    <div>
                        <asp:Label ID="labelDateFait" runat="server" Text="Fait le : "></asp:Label>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <label id="labeltextBoxDescriptionEntretienMachine">Description : </label>
                        <asp:TextBox ID="textBoxDescriptionEntretienMachine" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <asp:Label ID="labelEmploye" runat="server" Text="Fait par : "></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="labelTitreRemarque" runat="server" Text="Remarques faites lors de cet entretien : "></asp:Label>
                    </div>
                    <div>
                        <asp:GridView ID="gridViewRemarques" CssClass="table table-responsive" GridLines="None" runat="server"
                            SelectMethod="gridViewRemarques_GetData"
                            AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Numéro"/>
                                <asp:BoundField DataField="TitreRemarque" HeaderText="Nom"/>
                            </Columns>
                        </asp:GridView>
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
