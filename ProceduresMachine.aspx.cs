using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProceduresMachine : System.Web.UI.Page
{
    private string sourceFichierSlectionne;
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        AjouterProcedures();
    }


    private void AjouterProcedures()
    {
        int i = 0;
        var divHtml = new System.Text.StringBuilder();
        IQueryable<ElementProcedure> query = from pro in ctx.ElementProcedures where pro.Elements.Id == Cmds.idMachineSelectionne select pro;
        foreach (ElementProcedure pro in query)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
          new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            Label labelDescription = new Label();
            labelDescription.Text = pro.Procedure.NomProcedure;
            labelDescription.Attributes.Add("style", "color:black;font-size:25px;display:block;background-color:white; margin-top:150px;");
            labelDescription.ID = "labelDescription" + i.ToString();
            ButtonNumeroMachine nomProcedure = new ButtonNumeroMachine();
            nomProcedure.SourceFichierPdf = pro.Procedure.SourceProcedure;
            nomProcedure.ID = "btnPdf" + i.ToString();
            nomProcedure.Click += NomProcedure_Click1;
            nomProcedure.Text = pro.Procedure.DescriptionProcedure;
            nomProcedure.Attributes.Add("style", "height: 250px;display:none;background-color:black; color:white;font-size 15px;");
            createDiv.Style.Add(HtmlTextWriterStyle.Margin, "25px");
            createDiv.Attributes["class"] = "col-lg-2 col-md-3 col-sm-6 col-xs-12 img-responsive";
            nomProcedure.Attributes["class"] = "col-lg-12 col-md-12 col-sm-12 col-xs-12";
            createDiv.Style.Add(HtmlTextWriterStyle.BackgroundImage, "ImagesLogiciel/imagePdf.jpg");
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "250px");
            createDiv.ID = "divPdf" + i.ToString();
            string source = pro.Procedure.SourceProcedure;
            createDiv.Attributes.Add("onmouseover", "$('#" + nomProcedure.ClientID + "').show();$('#" + labelDescription.ClientID + "').hide()");
            createDiv.Attributes.Add("onmouseout", "$('#" + nomProcedure.ClientID + "').hide();$('#" + labelDescription.ClientID + "').show()");
            createDiv.Controls.Add(labelDescription);
            createDiv.Controls.Add(nomProcedure);
            divProcedures.Controls.Add(createDiv);
            i++;
        }
    }

    private void NomProcedure_Click1(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        Response.Redirect("http://localhost:50883/" + b.SourceFichierPdf);
    }

    protected void buttonAssocierProcedureTelecharger_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterProcedure.aspx");
    }
}