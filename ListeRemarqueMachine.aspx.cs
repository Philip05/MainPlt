using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeRemarqueMachine : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercher;
    private int idRemarqueSelectionne;
    protected void Page_Load(object sender, EventArgs e)
    {
        rechercher = false;
        labelTitreListeRemarque.Text = "Remarques sur : " +  Cmds.nomMachineSelectionne;
        textBoxRechercherRemarque.Focus();
    }

    public IQueryable gridViewRemarques_GetData()
    {
        try
        {
            if (rechercher == false)
            {
                var query = from ent in ctx.Remarques
                            where ent.Elements.Id == Cmds.idMachineSelectionne
                            select new
                            {
                                ent.Id,
                                ent.TitreRemarque
                            };
                return query;
            }
            else
            {
                var query = from ent in ctx.Remarques
                            where ent.Elements.Id == Cmds.idMachineSelectionne && ent.TitreRemarque.Contains(textBoxRechercherRemarque.Text)
                            select new
                            {
                                ent.Id,
                                ent.TitreRemarque
                            };
                rechercher = false;
                return query;
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
            return null;
        }
    }

    protected void textBoxRechercherRemarque_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewRemarques.DataBind();
    }

    protected void gridViewRemarques_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int no = Convert.ToInt16(e.CommandArgument);
            idRemarqueSelectionne = Convert.ToInt32(gridViewRemarques.Rows[no].Cells[1].Text);
            if (e.CommandName == "Select")
            {
                labelTitreDescriptionRemarque.Text = gridViewRemarques.Rows[no].Cells[2].Text;
                textBoxDescriptionRemarque.Text = (from ent in ctx.Remarques
                                                   where ent.Id == idRemarqueSelectionne
                                                   select ent.DescriptionRemarque).FirstOrDefault();
                AjouterPhotosRemarque();
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }


    private void AjouterPhotosRemarque()
    {
        try
        {
            var divHtml = new System.Text.StringBuilder();
            int i = 0;
            IQueryable<PhotosRemarque> query = from photo in ctx.PhotosRemarques where photo.Remarque.Id == idRemarqueSelectionne select photo;
            foreach (PhotosRemarque pho in query)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
              new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                createDiv.ID = i.ToString();
                createDiv.Style.Add(HtmlTextWriterStyle.Margin, "25px");
                createDiv.Attributes["class"] = "col-lg-2 col-md-6 col-sm-6 col-xs-12 img-responsive";
                //createDiv.Attributes.Add("onclick", "return Test()");
                Image img = new Image();
                img.ImageUrl = pho.SourcePhotoRemarque;
                img.Width = 150;
                img.Height = 150;
                createDiv.Controls.Add(img);
                divPhotosRemarque.Controls.Add(createDiv);
                i++;
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    protected void buttonAjouterRemarqueSansEntretien_Click(object sender, EventArgs e)
    {
        Cmds.remarqueSansEntretien = true;
        Response.Redirect("AjouterRemarque.aspx");
    }
}