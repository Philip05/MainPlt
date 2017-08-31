using System;
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
        if (!Page.IsPostBack)
        {

        }
    }

    private void ModifierCode()
    {
        Guid userGuid = System.Guid.NewGuid();
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = @"UPDATE Usagers SET Hash = @code, UserGuid = @userGuid, MotDePasse = @nouveauPass WHERE Id = @ID" ;
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.Add(new SqlParameter(@"userGuid", userGuid));
        cmd.Parameters.Add(new SqlParameter("@code", Cmds.HashSHA1(textBoxNouveauMotDePasse.Text)));
        cmd.Parameters.Add(new SqlParameter("@nouveauPass", Cmds.HashSHA1(textBoxNouveauMotDePasse.Text) + userGuid));
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

    protected void ButtonModifierCode_Click(object sender, EventArgs e)
    {

    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        ModifierCode();
    }
}