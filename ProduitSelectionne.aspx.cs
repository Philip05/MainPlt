using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProduitSelectionne : System.Web.UI.Page
{
    private bool rechercher;
    MainPltModelContainer ctx = new MainPltModelContainer();
    private string idProduitSelectionne;
    protected void Page_Load(object sender, EventArgs e)
    {
        textBoxDescriptionProduit.ReadOnly = true;
        if (!Page.IsPostBack)
        {
            rechercher = false;
            List<TypesProduit> departements = ctx.TypesProduits.ToList();
            departements.Insert(0, new TypesProduit { Id = -1, NomTypeProduit = "Sélectionner un type..." });
            dropDownListTypesProduit.DataSource = departements;
            dropDownListTypesProduit.DataValueField = "ID";
            dropDownListTypesProduit.DataTextField = "NomTypeProduit";
            dropDownListTypesProduit.DataBind();
        }
    }

    protected void dropDownListTypesProduit_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewProduits.DataBind();
    }

    protected void textBoxRechercherProduit_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewProduits.DataBind();
    }

    public IQueryable gridViewProduits_GetData()
    {
        int id = 0;
        if (rechercher == false)
        {
            var query = from pro in ctx.Produits
                        join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                        where pro.NomProduit.Contains("")
                        select new
                        {
                            pro.Id,
                            pro.NomProduit,
                            pro.DescriptionProduit,
                            type.NomTypeProduit
                        };
            return query;
        }
        else
        {
            int typeID = int.Parse(dropDownListTypesProduit.Text);
            if (typeID != -1)
            {
                var query1 = from pro in ctx.Produits
                             join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                             where pro.TypesProduit.Id == typeID && pro.NomProduit.Contains(textBoxRechercherProduit.Text) || pro.Id == id
                             select new
                             {
                                 pro.Id,
                                 pro.NomProduit,
                                 pro.DescriptionProduit,
                                 type.NomTypeProduit
                             };
                rechercher = false;
                return query1;
            }
            else
            {
                var query1 = from pro in ctx.Produits
                             join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                             where pro.NomProduit.Contains(textBoxRechercherProduit.Text) || pro.Id == id
                             select new
                             {
                                 pro.Id,
                                 pro.NomProduit,
                                 pro.DescriptionProduit,
                                 type.NomTypeProduit
                             };
                rechercher = false;
                return query1;
            }
        }
    }




    // Le nom du paramètre id doit correspondre à la valeur DataKeyNames définie sur le contrôle
    public void gridViewProduits_UpdateItem(int id)
    {
        Produit produit = null;
        produit = ctx.Produits.Find(id);
        if (produit == null)
        {
            ModelState.AddModelError("",
                String.Format("Le produit # {0} n'existe pas", id));
        }
        else
        {
            TryUpdateModel(produit);
            if (ModelState.IsValid)
            {
                ctx.SaveChanges();
            }
        }
    }

    protected void gridViewProduits_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            labelTitreNomProduit.Text = "Nom du produit : " + gridViewProduits.Rows[no].Cells[3].Text;
            labelTypeProduit.Text = "Type de produit : " + gridViewProduits.Rows[no].Cells[4].Text;
            textBoxDescriptionProduit.Text = gridViewProduits.Rows[no].Cells[4].Text;
            idProduitSelectionne = gridViewProduits.Rows[no].Cells[2].Text;
            AjouterPhotosProduit();
        }
    }

    private void AjouterPhotosProduit()
    {
        var divHtml = new System.Text.StringBuilder();
        int i = 0;
        int id = Convert.ToInt32(idProduitSelectionne);
        IQueryable<PhotosProduit> query = from photo in ctx.PhotosProduits where photo.Produit.Id == id select photo;
        foreach (PhotosProduit pho in query)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
          new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.ID = i.ToString();
            createDiv.Style.Add(HtmlTextWriterStyle.Margin, "25px");
            createDiv.Attributes["class"] = "col-lg-2 col-md-6 col-sm-6 col-xs-12 img-responsive";
            //createDiv.Attributes.Add("onclick", "return Test()");
            Image img = new Image();
            img.ImageUrl = pho.SourcePhotoProduit;
            img.Width = 150;
            img.Height = 150;
            createDiv.Controls.Add(img);
            divPhotosProduit.Controls.Add(createDiv);
            i++;
        }
    }

    protected void buttonAjouterProduit_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterProduit.aspx");
    }
}