﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class PageAdministrateur : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private int idRow;
    protected void Page_Load(object sender, EventArgs e)
    {
        ModalPopupExtender1.Hide();
        InitialiserBoutonDeconnexion();
        if (!Page.IsPostBack)
        {

        }
    }

    private void ModifierCode()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = @"UPDATE Usagers SET MotDePasse = @code WHERE Id = @ID" ;
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.Add(new SqlParameter("@code", Cmds.HashSHA1(textBoxNouveauMotDePasse.Text)));
        cmd.Parameters.Add(new SqlParameter("@ID", Cmds.IdModifierCodeUsager));
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
        Cmds.Alerte("Mot de passe modifié.", this, GetType());
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

    protected void buttonAjouterUsager_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterUtilisateur.aspx");
    }

    public IQueryable gridViewListeUtilisateurs_GetData()
    {
        var query = from usager in ctx.Usagers
                    select new
                    {
                        usager.Id,
                        usager.Nom,
                        usager.Prenom,
                        usager.Administrateur,
                        usager.DateInscription,
                    };
        return query;
    }

    protected void gridViewListeUtilisateurs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "black");
        }
        if (e.CommandName == "modifierCode")
        {
            Cmds.IdModifierCodeUsager = Convert.ToInt16(e.CommandArgument);
            ModalPopupExtender1.Show();
        }
        if (e.CommandName == "Update")
        {
            gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "white");
        }
    }

    protected void gridViewListeUtilisateurs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "white");
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }

    protected void ButtonModifierCode_Click(object sender, EventArgs e)
    {

    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        ModifierCode();
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