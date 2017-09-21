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
        try
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
                try
                {
                    int idTexte = Convert.ToInt32(textBoxRechercherNomProduit.Text);
                    var query1 = from pro in ctx.Produits
                                 join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                                 where pro.Id == idTexte
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
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
            return null;
        }
    }



    protected void GridViewProduitsEntretien_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        //if (e.CommandName == "Select")
        //{
        //    int idProduit = Convert.ToInt32(GridViewProduitsEntretien.Rows[no].Cells[1].Text);
        //    EntretiensProduit entp = new EntretiensProduit();

        //    Produit p = (from pro in ctx.Produits
        //                 where pro.Id == idProduit
        //                 select pro).FirstOrDefault();

        //    Entretien en = (from ent in ctx.Entretiens
        //                    where ent.Id == Cmds.IdProduitAssocie
        //                    select ent).FirstOrDefault();

        //    entp.QuantiteProduitEntretien = 1;
        //    entp.Produit = p;
        //    entp.Entretien = en;
        //    ctx.EntretiensProduits.Add(entp);
        //    ctx.SaveChanges();
        //}
    }

    protected void textBoxRechercherNomProduit_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewProduitsEntretien.DataBind();
    }

    protected void ButtonEnregistrer_Click(object sender, EventArgs e)
    {
        //Cmds.quantiteProduitEntretien = Convert.ToInt32(TextBoxQuantite.Text);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int no = Convert.ToInt32(row.RowIndex);
            int idProduit = Convert.ToInt32(GridViewProduitsEntretien.Rows[no].Cells[1].Text);

            EntretiensProduit entp = new EntretiensProduit();

            Produit p = (from pro in ctx.Produits
                         where pro.Id == idProduit
                         select pro).FirstOrDefault();

            Entretien en = (from ent in ctx.Entretiens
                            where ent.Id == Cmds.IdProduitAssocie
                            select ent).FirstOrDefault();

            Cmds.quantiteProduitEntretien = Convert.ToInt32(HiddenField1.Value);

            entp.QuantiteProduitEntretien = Cmds.quantiteProduitEntretien;
            entp.Produit = p;
            entp.Entretien = en;
            ctx.EntretiensProduits.Add(entp);
            ctx.SaveChanges();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }
}