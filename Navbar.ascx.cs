using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Navbar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        Cmds.commandeEntretien = Cmds.CommandeEntretien.selectionnerTousLesEntretiens;
        Cmds.commandeProduit = Cmds.CommandeProduit.selectionnerTousLesProduits;
        buttonDeconnexionNavbar.Attributes.Add("margin-right", "100px");
        labelNomUtilisateurConnecte.Attributes.Add("margin-right", "100px");
    }

    private void InitialiserBoutonDeconnexion()
    {
        if (Cmds.nomUsagerConnecte == null && Cmds.prenomUsagerConnecte == null && Cmds.usagerConnecte == false)
        {
            Response.Redirect("Default.aspx");
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

    protected void linkButtonBatisse_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.batisse;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("Default.aspx");
    }
}