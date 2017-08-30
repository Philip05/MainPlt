using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageAccueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cmds.InitialiserLesValeurs();
        System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
        new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        createDiv.ID = "divNotifications";
        this.Controls.Add(createDiv);
        ButtonConnexionAccueil.Click += ButtonConnexionAccueil_Click;
    }

    /// <summary>
    /// Initialise les varaiables de connexion de l'usager.
    /// </summary>
    /// <param name="nom">Nom de l'usager.</param>
    /// <param name="prenom">Prénom de l'usager.</param>
    private void InitialiserUsager(string nom, string prenom)
    {
        Cmds.prenomUsagerConnecte = prenom;
        Cmds.nomUsagerConnecte = nom;
        Cmds.usagerConnecte = true;
    }

    private void ButtonConnexionAccueil_Click(object sender, EventArgs e)
    {
        //Cmds.prenomUsagerConnecte = "t";
        //Cmds.nomUsagerConnecte = "y";
        //Cmds.usagerConnecte = true;
        //Response.Redirect("Accueil.aspx");
        GetUserIdByUsernameAndPassword(TextBoxCode.Text);
    }

    public void GetUserIdByUsernameAndPassword(string password)
    {
        int userId = 0;
        string code = TextBoxCode.Text;
        string nom;
        string prenom;
        // Now we hash the UserGuid from the database with the password we wan't to check
        // In the same way as when we saved it to the database in the first place. (see AddUser() function)
        string hashedPassword = Cmds.HashSHA1(code);
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        try
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Id,Nom,Prenom,DateInscription,MotDePasse,Administrateur,UserGuid,Hash FROM [Usagers] WHERE Hash = @code", con))
            {
                cmd.Parameters.AddWithValue("@code", hashedPassword);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    // dr.Read() = we found user(s) with matching username!

                    int dbUserId = Convert.ToInt32(dr["Id"]);
                    Cmds.IdUsagerConnecte = dbUserId;
                    string dbPassword = Convert.ToString(dr["MotDePasse"]);
                    string dbUserGuid = Convert.ToString(dr["UserGuid"]);
                    nom = Convert.ToString(dr["Nom"]);
                    prenom = Convert.ToString(dr["Prenom"]);
                    Cmds.admin = Convert.ToBoolean(dr["Administrateur"]);


                    // if its correct password the result of the hash is the same as in the database
                    if (dbPassword == hashedPassword + dbUserGuid)
                    {
                        // The password is correct
                        userId = dbUserId;
                        InitialiserUsager(nom,prenom);
                    }
                }
                con.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (userId > 0)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Mauvais mot de passe.');", true);
                TextBoxCode.Text = string.Empty;
            }
        }
    }
}
