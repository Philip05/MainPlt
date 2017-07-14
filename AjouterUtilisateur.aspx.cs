using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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

    private void AjouterUser()
    {
        Guid userGuid = System.Guid.NewGuid();
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = "INSERT INTO Usagers(Nom,Prenom,DateInscription,MotDePasse,Administrateur,UserGuid) VALUES (@Nom,@Prenom,@DateInscription,@MotDePasse,@Administrateur,@Guid)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@Nom", textBoxNomUsager.Text));
            cmd.Parameters.Add(new SqlParameter("@Prenom", textBoxPrenomUsager.Text));
            cmd.Parameters.Add(new SqlParameter("@DateInscription", DateTime.Today));
            cmd.Parameters.Add(new SqlParameter("@MotDePasse",Cmds.HashSHA1(textBoxMotDePasse.Text)));
            if (checkBoxAdministrateur.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Administrateur", true));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@Administrateur", false));
            }
            cmd.Parameters.Add(new SqlParameter("@Guid", userGuid));
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
    }

    private void Enregistrer()
    {
        AjouterUser();
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