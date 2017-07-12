using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterUtilisateur : System.Web.UI.Page
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

    private void Enregistrer()
    {
        Usager user = new Usager();
        user.Nom = textBoxNomUsager.Text;
        user.Prenom = textBoxPrenomUsager.Text;
        user.MotDePasse = textBoxMotDePasse.Text;
        user.DateInscription = DateTime.Today;
        if(checkBoxAdministrateur.Checked == true)
        {
            user.Administrateur = true;
        }
        else
        {
            user.Administrateur = false;
        }
        ctx.Usagers.Add(user);
        ctx.SaveChanges();
        Cmds.Alerte("Insertion réussie", this, GetType());
    }

    protected void buttonAjouterUtilisateur_Click(object sender, EventArgs e)
    {
        Enregistrer();
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }
}