﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntretienSelectionne : System.Web.UI.Page
{
    private bool rechercher;
    MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        textBoxDescriptionEntretien.ReadOnly = true;
        textBoxReccurence.ReadOnly = true;
    }

    public IQueryable GridViewListeProduitsEntretien_GetData()
    {
        if (rechercher == false)
        {
            var query = from ent in ctx.Entretiens
                        where ent.Element.Id == Cmds.idMachineSelectionne
                        select new
                        {
                            ent.Id,
                            ent.TitreEntretien,
                            ent.Recurrence,
                            ent.DateProchainEntretien,
                            ent.DescriptionEntretien
                        };
            return query;
        }
        else
        {
            int typeID = int.Parse(dropDownListEntretiensMachine.Text);
            if (typeID != -1)
            {
                var query1 = from pro in ctx.Produits
                             join type in ctx.TypesProduits on pro.TypesProduit.Id equals type.Id
                             where pro.TypesProduit.Id == typeID && pro.NomProduit.Contains(textBoxRechercherEntretienMachine.Text)
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
                             where pro.NomProduit.Contains(textBoxRechercherEntretienMachine.Text)
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
    public void GridViewListeProduitsEntretien_UpdateItem(int id)
    {
        Entretien entretienMachine = null;
        entretienMachine = ctx.Entretiens.Find(id);
        if (entretienMachine == null)
        {
            ModelState.AddModelError("",
                String.Format("Le produit # {0} n'existe pas", id));
        }
        else
        {
            TryUpdateModel(entretienMachine);
            if (ModelState.IsValid)
            {
                ctx.SaveChanges();
            }
        }
    }

    protected void dropDownListEntretiensMachine_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewListeProduitsEntretien.DataBind();
    }

    protected void textBoxRechercherEntretienMachine_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewListeProduitsEntretien.DataBind();
    }

    protected void GridViewListeProduitsEntretien_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewListeProduitsEntretien.DataBind();
    }
}