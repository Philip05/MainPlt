using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CentreDeControl : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        Commentaires();
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

    private void Commentaires()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = "SELECT * FROM Messages ORDER BY Date DESC";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader Reader;
        try
        {
            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl();
                createDiv.Attributes.Add("class", "row col-lg-offset-1 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-12 col-xs-12");
                createDiv.Style.Add(HtmlTextWriterStyle.MarginTop, "50px");
                Label date = new Label();
                date.Text = Reader.GetValue(2).ToString();
                date.Style.Add(HtmlTextWriterStyle.Color, "black");
                date.Style.Add(HtmlTextWriterStyle.FontSize, "20px");
                TextBox comm = new TextBox();
                comm.ReadOnly = true;
                comm.TextMode = TextBoxMode.MultiLine;
                comm.Text = Reader.GetValue(1).ToString();
                comm.CssClass = "form-control";
                createDiv.Controls.Add(date);
                createDiv.Controls.Add(comm);
                divCommentaires.Controls.Add(createDiv);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
    }

    protected void buttonAjouterUnCommentaire_Click(object sender, EventArgs e)
    {
        AjouterLeCommentaire();
        Response.Redirect(Request.RawUrl);
    }

    private void AjouterLeCommentaire()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = "INSERT INTO Messages(Commentaires, Date) VALUES (@Commentaire, @Date)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@Commentaire", textBoxAjouterCommentaire.Text));
            cmd.Parameters.Add(new SqlParameter("@Date", DateTime.Now.ToString()));
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }
}