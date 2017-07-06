using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Procedures : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercherTextbox;
    private int typeID;
    private int i = 0;
    private int row = 0;
    private int rowDropDownList = 0;
    private System.Web.UI.HtmlControls.HtmlGenericControl[] createDiv;
    private Label[] labelDescription;
    private ButtonNumeroMachine[] nomProcedure;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rechercherTextbox = false;
            //List<TypesElement> type = ctx.TypesElements.ToList();
            //type.Insert(0, new TypesElement { Id = -1, NomTypeElement = "Sélectionner un type..." });
            //dropDownListTypesProcedure.DataSource = type;
            //dropDownListTypesProcedure.DataValueField = "ID";
            //dropDownListTypesProcedure.DataTextField = "NomTypeElement";
            //dropDownListTypesProcedure.DataBind();
        }
        //typeID = int.Parse(dropDownListTypesProcedure.Text);
        Count();
        AjouterLesProcedures();
    }

    private void Count()
    {
        row = (from pro in ctx.ElementProcedures select pro.Id).Count();
        createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl[row];
        labelDescription = new Label[row];
        nomProcedure = new ButtonNumeroMachine[row];
    }

    private void BoucleProcedures(IQueryable<ElementProcedure> query)
    {
        foreach (ElementProcedure pro in query)
        {
            createDiv[i] = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            labelDescription[i] = new Label();
            labelDescription[i].Text = pro.Procedure.NomProcedure;
            labelDescription[i].Attributes.Add("style", "color:black;font-size:25px;display:block;background-color:white; margin-top:150px;");
            labelDescription[i].ID = "labelDescription" + i.ToString();
            nomProcedure[i] = new ButtonNumeroMachine();
            nomProcedure[i].SourceFichierPdf = pro.Procedure.SourceProcedure;
            nomProcedure[i].ID = "btnPdf" + i.ToString();
            nomProcedure[i].Click += NomProcedure_Click;
            nomProcedure[i].Text = pro.Procedure.DescriptionProcedure;
            nomProcedure[i].Attributes.Add("style", "height: 250px;display:none;background-color:black; color:white;font-size 15px;");
            createDiv[i].Style.Add(HtmlTextWriterStyle.Margin, "25px");
            createDiv[i].Attributes["class"] = "col-lg-2 col-md-3 col-sm-6 col-xs-12 img-responsive";
            nomProcedure[i].Attributes["class"] = "col-lg-12 col-md-12 col-sm-12 col-xs-12";
            createDiv[i].Style.Add(HtmlTextWriterStyle.BackgroundImage, "ImagesLogiciel/imagePdf.jpg");
            createDiv[i].Style.Add(HtmlTextWriterStyle.Height, "250px");
            createDiv[i].ID = "divPdf" + i.ToString();
            string source = pro.Procedure.SourceProcedure;
            createDiv[i].Attributes.Add("onmouseover", "$('#" + nomProcedure[i].ClientID + "').show();$('#" + labelDescription[i].ClientID + "').hide()");
            createDiv[i].Attributes.Add("onmouseout", "$('#" + nomProcedure[i].ClientID + "').hide();$('#" + labelDescription[i].ClientID + "').show()");
            createDiv[i].Controls.Add(labelDescription[i]);
            createDiv[i].Controls.Add(nomProcedure[i]);
            divProcedures.Controls.Add(createDiv[i]);
            i++;
        }
    }

    private void AjouterLesProcedures()
    {
        i = 0;
        //typeID = int.Parse(dropDownListTypesProcedure.Text);
        if (/*typeID == -1 && */rechercherTextbox == false)
        {
            BoucleProcedures(from pro in ctx.ElementProcedures select pro);
        }
        else if (rechercherTextbox == true /*&& typeID == -1*/)
        {
            BoucleProcedures(from pro in ctx.ElementProcedures where pro.Procedure.NomProcedure.Contains(textBoxRechercherProcedure.Text) select pro);
            rechercherTextbox = false;
        }
        else if (rechercherTextbox == false /*&& typeID != -1*/)
        {
            BoucleProcedures(from pro in ctx.ElementProcedures where pro.Procedure.TypesMachines.Id == typeID select pro);
        }
        else
        {
            BoucleProcedures(from pro in ctx.ElementProcedures where pro.Procedure.TypesMachines.Id == typeID && pro.Procedure.NomProcedure.Contains(textBoxRechercherProcedure.Text) select pro);
        }
    }

    private void NomProcedure_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        Response.Redirect("http://localhost:50883/" + b.SourceFichierPdf);
    }

    protected void textBoxRechercherProcedure_TextChanged(object sender, EventArgs e)
    {
        viderLeDiv();
        rechercherTextbox = true;
        AjouterLesProcedures();
    }

    //protected void dropDownListTypesProcedure_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    viderLeDivDropDownList();
    //    AjouterLesProcedures();  
    //}

    private void viderLeDiv()
    {
        for (int i = 0; i < row; i++)
        {
            createDiv[i].Visible = false;
            createDiv[i].ID = "nodiv" + i.ToString();
            labelDescription[i].ID = "noLabel" + i.ToString();
            nomProcedure[i].ID = "noButton" + i.ToString();
        }
    }
    //private void viderLeDivDropDownList()
    //{
    //    typeID = int.Parse(dropDownListTypesProcedure.Text);
    //    rowDropDownList = (from pro in ctx.ElementProcedures where pro.Procedure.TypesMachines.Id == typeID select pro.Id).Count();
    //    for (int i = 0; i < rowDropDownList; i++)
    //    {
    //        createDiv[i].Visible = false;
    //        createDiv[i].ID = "nodiv" + i.ToString();
    //        labelDescription[i].ID = "noLabel" + i.ToString();
    //        nomProcedure[i].ID = "noButton" + i.ToString();
    //    }
    //}
}