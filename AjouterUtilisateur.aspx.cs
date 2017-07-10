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
}