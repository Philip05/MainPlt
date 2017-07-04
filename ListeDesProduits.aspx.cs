using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeDesProduits : System.Web.UI.Page
{
    private bool rechercher;
    MainPltModelContainer ctx = new MainPltModelContainer();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rechercher = false;
            List<TypesElement> departements = ctx.TypesElements.ToList();
            departements.Insert(0, new TypesElement { Id = -1, NomTypeElement = "Sélectionner un type..." });
            dropDownListTypesProduit.DataSource = departements;
            dropDownListTypesProduit.DataValueField = "ID";
            dropDownListTypesProduit.DataTextField = "NomTypeProduit";
            dropDownListTypesProduit.DataBind();
        }
    }

    public IQueryable gridViewListeProduits_GetData()
    {
        if (rechercher == false)
        {
            var query = from pro in ctx.Produits
                        where pro.NomProduit.Contains("")
                        select new
                        {
                            pro.Id,
                            pro.NomProduit,
                            pro.DescriptionProduit
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
                             where pro.TypesProduit.Id == typeID
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
                var query1 = from ma in ctx.Elements
                             join type in ctx.TypesElements on ma.TypesElement.Id equals type.Id
                             where ma.NomElement.Contains(textBoxRechercherMachine.Text) || ma.NumeroElement.Contains(textBoxRechercherMachine.Text)
                             select new
                             {
                                 ma.Id,
                                 ma.NomElement,
                                 ma.NumeroElement,
                                 type.NomTypeElement
                             };
                rechercher = false;
                return query1;
            }
        }
    }

    // Le nom du paramètre id doit correspondre à la valeur DataKeyNames définie sur le contrôle
    public void gridViewListeProduits_UpdateItem(int id)
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

    protected void textBoxRechercherProduit_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewListeProduits.DataBind();
    }
}