<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntretiensMachine.aspx.cs" Inherits="EntretiensMachine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Entretiens de la machine</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body id="bodyEntretiensMachine">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div id="divLeftEntretienMachine" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="row col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                    <asp:Label ID="labelTitreEntretiensMachine" runat="server" Text="Entretiens récents "></asp:Label>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:GridView ID="GridViewEntretiensMachine" CssClass="table-responsive" runat="server"></asp:GridView>
                </div>
            </div>
             <div id="divLRightEntretienMachine" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                 <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
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
                            <label id="labelNomEmploye">Fait par : </label>
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
