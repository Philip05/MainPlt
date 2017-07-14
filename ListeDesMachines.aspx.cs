using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeDesMachines : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercher;
    int typeID;

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
            typeID = -1;
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

    private int TypeID()
    {
        if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.airMakeUp)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "AirMakeUp" select ty.TypesElement.Id).FirstOrDefault();
        }
        else if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.pontRoulant)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "Ponts roulants" select ty.TypesElement.Id).FirstOrDefault();
        }
        else if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.remorque)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "Remorques" select ty.TypesElement.Id).FirstOrDefault();
        }
        else if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.soudeuse)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "Soudeuses" select ty.TypesElement.Id).FirstOrDefault();
        }
        else if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.usinage)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "Usinage" select ty.TypesElement.Id).FirstOrDefault();
        }
        else if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.vehicules)
        {
            typeID = (from ty in ctx.Elements where ty.TypesElement.NomTypeElement == "Vehicules" select ty.TypesElement.Id).FirstOrDefault();
        }
        else
        {
            
        }
        return typeID;
    }

    public IQueryable gridViewMachines_GetData()
    {
        int typeListe = -1;
        if (rechercher == false)
        {
            if (Cmds.categorieListeProduits == Cmds.CategorieListeProduit.tout)
            {
                typeListe = TypeID();
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
                Cmds.categorieListeProduits = Cmds.CategorieListeProduit.tout;
                return query;
            }
            else
            {
                typeListe = TypeID();
                var query = (from ma in ctx.Elements
                             join type in ctx.TypesElements on ma.TypesElement.Id equals type.Id
                             where ma.NomElement.Contains("") && ma.TypesElement.Id == typeListe
                             select new
                             {
                                 ma.Id,
                                 ma.NomElement,
                                 ma.NumeroElement,
                                 type.NomTypeElement
                             });
                Cmds.categorieListeProduits = Cmds.CategorieListeProduit.tout;
                return query;
            }
        }
        else
        {
            typeListe = int.Parse(dropDownListTypesElement.Text);
            if (typeListe != -1)
            {
                var query1 = from ma in ctx.Elements
                             join type in ctx.TypesElements on ma.TypesElement.Id equals type.Id
                             where ma.TypesElement.Id == typeListe && (ma.NomElement.Contains(textBoxRechercherMachine.Text) || ma.NumeroElement.Contains(textBoxRechercherMachine.Text))
                             select new
                             {
                                 ma.Id,
                                 ma.NomElement,
                                 ma.NumeroElement,
                                 type.NomTypeElement
                             };
                rechercher = false;
                Cmds.categorieListeProduits = Cmds.CategorieListeProduit.tout;
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
                Cmds.categorieListeProduits = Cmds.CategorieListeProduit.tout;
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

    protected void linkButtonVéhicules_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.vehicules;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonUsinage_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.usinage;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonRemorque_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.remorque;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonPontsRoulants_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.pontRoulant;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonSoudeuse_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.soudeuse;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonAirMakeUp_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.airMakeUp;
        Response.Redirect("ListeDesMachines.aspx");
    }
}