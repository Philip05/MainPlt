﻿using System;
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
        try
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
            textBoxRechercherProduit.Focus();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    public IQueryable gridViewListeProduits_GetData()
    {
        try
        {
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
                                 where pro.TypesProduit.Id == typeID && pro.NomProduit.Contains(textBoxRechercherProduit.Text)
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
                                 where pro.NomProduit.Contains(textBoxRechercherProduit.Text)
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

    // Le nom du paramètre id doit correspondre à la valeur DataKeyNames définie sur le contrôle
    public void gridViewListeProduits_UpdateItem(int id)
    {
        try
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
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    protected void textBoxRechercherProduit_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewListeProduits.DataBind();
    }

    protected void dropDownListTypesProduit_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewListeProduits.DataBind();
    }
}