﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeDesMachines : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercher;

    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        if (!Page.IsPostBack)
        {
            rechercher = false;
            List<TypesElement> departements = ctx.TypesElements.ToList();
            departements.Insert(0, new TypesElement { Id = -1, NomTypeElement = "Sélectionner un type..." });
            dropDownListTypesElement.DataSource = departements;
            dropDownListTypesElement.DataValueField = "ID";
            dropDownListTypesElement.DataTextField = "NomTypeElement";
            dropDownListTypesElement.DataBind();
        }
    }

    private void InitialiserBoutonDeconnexion()
    {
        if (Cmds.nomUsagerConnecte == null && Cmds.prenomUsagerConnecte == null && Cmds.usagerConnecte == false)
        {
            Response.Redirect("PageAccueilConnexion.aspx");
        }
        else
        {
            //Hide li ou block au lieu de none pour afficher.
            //Initialise le label permettant de voir qui est connecté lorsque la souris est placée au-dessus du glyphicon deconnexion de la navbar.
            labelNomUtilisateurConnecte.Text = Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
            liAdministrateur.Style.Add("display", "block");
            labelNomUtilisateurConnecte.ForeColor = System.Drawing.Color.Black;
            labelNomUtilisateurConnecte.Font.Name = "Times New Roman";
            if (Cmds.admin == true)
            {
                liAdministrateur.Visible = true;
            }
            else
            {
                liAdministrateur.Visible = false;
            }
        }
    }

    protected void textBoxRechercherMachine_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewMachines.DataBind();
    }


    public IQueryable gridViewMachines_GetData()
    {
        if (rechercher == false)
        {
            var query = (from ma in ctx.Elements
                         join type in ctx.TypesElements on ma.TypesElement.Id equals type.Id
                         where ma.NomElement.Contains("")
                         select new
                         {
                             ma.Id,
                             ma.NomElement,
                             ma.NumeroElement,
                             type.NomTypeElement
                         });
            return query;
        }
        else
        {
            int typeID = int.Parse(dropDownListTypesElement.Text);
            if (typeID != -1)
            {
                var query1 = from ma in ctx.Elements
                             join type in ctx.TypesElements on ma.TypesElement.Id equals type.Id
                             where ma.TypesElement.Id == typeID && (ma.NomElement.Contains(textBoxRechercherMachine.Text) || ma.NumeroElement.Contains(textBoxRechercherMachine.Text))
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
    public void gridViewMachines_UpdateItem(int id)
    {
        Element element = null;
        element = ctx.Elements.Find(id);
        if (element == null)
        {
            ModelState.AddModelError("",
                String.Format("La machine # {0} n'existe pas", id));
        }
        else
        {
            TryUpdateModel(element);
            if (ModelState.IsValid)
            {
                ctx.SaveChanges();
            }
        }
        gridViewMachines.Columns[3].Visible = true;
    }

    protected void dropDownListTypesElement_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewMachines.DataBind();
    }

    protected void gridViewMachines_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gridViewMachines_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int no = Convert.ToInt16(e.CommandArgument);
            Cmds.numeroMachineSelectionne = gridViewMachines.Rows[no].Cells[3].Text;
            Cmds.nomMachineSelectionne = gridViewMachines.Rows[no].Cells[2].Text;
            Response.Redirect("DossierMachine.aspx");
        }
        if (e.CommandName == "Edit")
        {
            gridViewMachines.Columns[3].Visible = false;
        }
        if (e.CommandName == "Cancel")
        {
            gridViewMachines.Columns[3].Visible = true;
        }

    }

    protected void buttonAjouterElement_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterElements.aspx");
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }
}