using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageAdministrateur : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
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
                        usager.MotDePasse
                    };
        return query;
    }



    protected void gridViewListeUtilisateurs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Edit")
        {
            gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "black");
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
}