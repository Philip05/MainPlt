using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssocierProduitEntretien : System.Web.UI.Page
{
    MainPltModelContainer ctx = new MainPltModelContainer();

    private bool rechercher = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        titreAjouterProduit.Text = "Associer un produit à l'entretien suivant : " + Cmds.NomEntretienAssocierProduit;
    }
    public IQueryable GridViewProduitsEntretien_GetData()
    {
        if (rechercher == false)
        {
            var query = from pro in ctx.Produits
                        join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                        select new
                        {
                            pro.Id,
                            pro.NomProduit,
                            pro.TypesProduit
                        };
            return query;
        }
        else
        {
            try
            {
                int id = int.Parse(textBoxRechercherNomProduit.Text);
                var query1 = from pro in ctx.Produits
                             join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                             where pro.Id == id
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
            catch
            {
                var query1 = from pro in ctx.Produits
                             join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                             where pro.NomProduit.Contains(textBoxRechercherNomProduit.Text)
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

    protected void GridViewProduitsEntretien_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            int idProduit = Convert.ToInt32(GridViewProduitsEntretien.Rows[no].Cells[1].Text);
            EntretiensProduit entp = new EntretiensProduit();

            Produit p = (from pro in ctx.Produits
                         where pro.Id == idProduit
                         select pro).FirstOrDefault();

            Entretien en = (from ent in ctx.Entretiens
                         where ent.Id == Cmds.IdProduitAssocie
                         select ent).FirstOrDefault();

            entp.QuantiteProduitEntretien = 1;
            entp.Produit = p;
            entp.Entretien = en;
            ctx.EntretiensProduits.Add(entp);
            ctx.SaveChanges();
        }
    }

    protected void textBoxRechercherNomProduit_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewProduitsEntretien.DataBind();
    }
}