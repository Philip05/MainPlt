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
        var divHtml = new System.Text.StringBuilder();
        IQueryable<ElementProcedure> query = from pro in ctx.ElementProcedures where pro.Elements.Id == Cmds.idMachineSelectionne select pro;
        foreach (ElementProcedure pro in query)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
          new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.Style.Add(HtmlTextWriterStyle.Margin, "25px");
            createDiv.Attributes["class"] = "col-lg-2 col-md-3 col-sm-6 col-xs-12 img-responsive";
            createDiv.Style.Add(HtmlTextWriterStyle.BackgroundImage, "ImagesLogiciel/imagePdf.jpg");
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "250px");
            //createDiv.Attributes.Add("onclick", "Test()");
            LinkButtonPDF nomProcedure = new LinkButtonPDF();
            nomProcedure.sourceFichierPdf = pro.Procedure.SourceProcedure;
            nomProcedure.Click += NomProcedure_Click1;
            nomProcedure.Text = pro.Procedure.NomProcedure;
            createDiv.Controls.Add(nomProcedure);
            divProcedures.Controls.Add(createDiv);
        }
    }

    private void NomProcedure_Click1(object sender, EventArgs e)
    {
        LinkButtonPDF b = new LinkButtonPDF();
        b = (LinkButtonPDF)sender;
        Response.Redirect("http://localhost:50883/" + b.sourceFichierPdf);
    }
}