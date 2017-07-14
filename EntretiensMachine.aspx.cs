using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntretiensMachine : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercher;
    private bool selectionner;
    private string idEntretienSelectionne;
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        rechercher = false;
        selectionner = false;
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

    public IQueryable gridViewEntretiensMachine_GetData()
    {
        if (rechercher == false)
        {
            var query = from ent in ctx.EntretiensPrecedants
                        where ent.Elements.Id == Cmds.idMachineSelectionne
                        select new
                        {
                            ent.Id,
                            ent.Entretien.TitreEntretien
                        };
            return query;
        }
        else
        {
            var query = from ent in ctx.EntretiensPrecedants
                        where ent.Elements.Id == Cmds.idMachineSelectionne && ent.Entretien.TitreEntretien.Contains(textBoxRechercherEntretienMachine.Text)
                        select new
                        {
                            ent.Id,
                            ent.Entretien.TitreEntretien
                        };
            rechercher = false;
            return query;
        }
    }

    protected void textBoxRechercherMachine_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewEntretiensMachine.DataBind();
    }

    private void RemplirLabels(int id)
    {
        DateTime date;
        string nomEmploye;
        string prenomEmploye;
        string description;

        date = (from ent in ctx.EntretiensPrecedants
                where ent.Id == id
                select ent.DateEntretienPrecedant).FirstOrDefault();

        nomEmploye = (from ent in ctx.EntretiensPrecedants
                      where ent.Id == id
                      select ent.NomEmploye).FirstOrDefault();

        prenomEmploye = (from ent in ctx.EntretiensPrecedants
                         where ent.Id == id
                         select ent.PrenomEmploye).FirstOrDefault();

        description = (from ent in ctx.EntretiensPrecedants
                       where ent.Id == id
                       select ent.DescriptionEntretienPrecedant).FirstOrDefault();


        labelEmploye.Text = "Fait par : " + prenomEmploye + " " + nomEmploye;
        textBoxDescriptionEntretienMachine.Text = description;
        labelDateFait.Text = "Fait le : " + date.ToString("yyy-MM-dd");
    }


    protected void gridViewEntretiensMachine_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            selectionner = true;
            idEntretienSelectionne = gridViewEntretiensMachine.Rows[no].Cells[1].Text;
            RemplirLabels(Convert.ToInt32(idEntretienSelectionne));
            gridViewRemarques.DataBind();
        }
    }

    public IQueryable gridViewRemarques_GetData()
    {
        int id = Convert.ToInt32(idEntretienSelectionne);
        var query = from ent in ctx.Remarques
                    where ent.EntretiensPrecedant.Id == id
                    select new
                    {
                        ent.Id,
                        ent.TitreRemarque
                    };
        return query;
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