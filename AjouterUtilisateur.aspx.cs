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

    protected void Page_Load(object source, EventArgs e)
    {
        textBoxNomUsager.Focus();
    }

    private void AjouterUser()
    {
        Guid userGuid = System.Guid.NewGuid();
        SqlConnection con = new SqlConnection("SERVER=188.121.44.214;DATABASE=mainplt_SqlDatabase;UID=mainplt;PASSWORD=MainPlt2210;");
        string query = "INSERT INTO Usagers(Nom,Prenom,DateInscription,MotDePasse,Administrateur,UserGuid,Hash) VALUES (@Nom,@Prenom,@DateInscription,@MotDePasse,@Administrateur,@Guid,@Hash)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@Nom", textBoxNomUsager.Text));
            cmd.Parameters.Add(new SqlParameter("@Prenom", textBoxPrenomUsager.Text));
            cmd.Parameters.Add(new SqlParameter("@DateInscription", DateTime.Today));
            cmd.Parameters.Add(new SqlParameter("@Hash", Cmds.HashSHA1(textBoxMotDePasse.Text)));
            cmd.Parameters.Add(new SqlParameter("@Guid", userGuid));
            cmd.Parameters.Add(new SqlParameter("@MotDePasse",Cmds.HashSHA1(textBoxMotDePasse.Text) + userGuid));
            if (checkBoxAdministrateur.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Administrateur", true));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@Administrateur", false));
            }
            cmd.ExecuteNonQuery();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
        con.Close();
    }

    private void Enregistrer()
    {
        AjouterUser();
        ViderTextBox();
        Cmds.Alerte("Insertion réussie", this, GetType());
    }

    protected void buttonAjouterUtilisateur_Click(object sender, EventArgs e)
    {
        Enregistrer();
    }

    private void ViderTextBox()
    {
        textBoxMotDePasse.Text = string.Empty;
        textBoxNomUsager.Text = string.Empty;
        textBoxPrenomUsager.Text = string.Empty;
        checkBoxAdministrateur.Checked = false;
    }
}