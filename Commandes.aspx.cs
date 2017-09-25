using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Commandes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Afficher();
    }

    public void Afficher()
    {
        using (SqlConnection con = new SqlConnection(Cmds.connectionString))
        {
            string query = "SELECT Commandes.Id,Commandes.Commande,Commandes.Quantite, Produits.NomProduit, Produits.DescriptionProduit, TypesProduits.NomTypeProduit FROM Commandes INNER JOIN Produits ON Produit_Id = Produits.Id INNER JOIN TypesProduits ON TypesProduit_Id = TypesProduits.Id";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            GridViewCommandes.DataSource = dr;
            GridViewCommandes.DataBind();
            con.Close();
        }
    }

    protected void GridViewCommandes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[2].Text == "True")
            {
                e.Row.BackColor = System.Drawing.Color.LightGreen;
                e.Row.Cells[2].Text = "Oui";
            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.White;
                e.Row.Cells[2].Text = "Non";
            }
        }
    }

    protected void GridViewCommandes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "Select")
        {
            int no = Convert.ToInt16(e.CommandArgument);
            int id =  Convert.ToInt32(GridViewCommandes.Rows[no].Cells[1].Text);
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            string query = "UPDATE Commandes SET Commande = 'True' WHERE Id = " + id;
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
        else if(e.CommandName == "Delete")
        {
            int no = Convert.ToInt16(e.CommandArgument);
            int id = Convert.ToInt32(GridViewCommandes.Rows[no].Cells[1].Text);
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            string query = "DELETE FROM Commandes WHERE Id = " + id;
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}