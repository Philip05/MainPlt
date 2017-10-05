using iTextSharp.text;
using iTextSharp.text.pdf;
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
            string query = "SELECT Commandes.Id,Commandes.Commande,Commandes.Quantite, Produits.Id AS Numéro, Produits.NomProduit, Produits.DescriptionProduit, TypesProduits.NomTypeProduit FROM Commandes INNER JOIN Produits ON Produit_Id = Produits.Id INNER JOIN TypesProduits ON TypesProduit_Id = TypesProduits.Id";
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
                int id = Convert.ToInt32(e.Row.Cells[1].Text);
                string query = "SELECT DateCommande FROM Commandes WHERE Id = " + id;
                SqlConnection con = new SqlConnection(Cmds.connectionString);
                SqlCommand cmd = new SqlCommand(query,con);
                con.Open();
                string str = Convert.ToString(cmd.ExecuteScalar());
                e.Row.BackColor = System.Drawing.Color.LightGreen;
                e.Row.Cells[2].Text = "Commandé le " + Convert.ToDateTime(str).ToString("yyyy/MM/dd");
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
            DateTime date = DateTime.Today;
            int no = Convert.ToInt16(e.CommandArgument);
            int id =  Convert.ToInt32(GridViewCommandes.Rows[no].Cells[1].Text);
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            string query = "UPDATE Commandes SET Commande = 'True', DateCommande = '" + date + "' WHERE Id = " + id;
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

    protected void imprimerNotifications_Click(object sender, EventArgs e)
    {
        GenererPdf();
    }

    private void GenererPdf()
    {
        try
        {
            Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            string title = @"Listes des produits commandés et en commande";
            string date = "Liste imprimée en date du " + DateTime.Today.ToString("yyyy-MM-dd");
            Paragraph titre = new Paragraph(title, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            Paragraph dateJour = new Paragraph(date, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            titre.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
            dateJour.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
            //HTML
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            PdfPTable pdfTab = new PdfPTable(7);
            pdfTab.WidthPercentage = 100;
            pdfTab.SpacingBefore = 5f;
            pdfTab.SpacingAfter = 5f;

            pdfTab.AddCell("Numéro de commande");
            pdfTab.AddCell("Commandé");
            pdfTab.AddCell("Numéro du produit");
            pdfTab.AddCell("Nom du produit");
            pdfTab.AddCell("Description");
            pdfTab.AddCell("Type");
            pdfTab.AddCell("Quantité");

            string query = "SELECT Commandes.Id,Commandes.Commande,Commandes.DateCommande,Commandes.Quantite, Produits.Id AS Numéro, Produits.NomProduit, Produits.DescriptionProduit, TypesProduits.NomTypeProduit FROM Commandes INNER JOIN Produits ON Produit_Id = Produits.Id INNER JOIN TypesProduits ON TypesProduit_Id = TypesProduits.Id";
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while(dr.Read())
            {
                string str = dr.GetValue(2).ToString();
                pdfTab.AddCell(dr.GetValue(0).ToString());
                if (dr.GetValue(1).ToString() == "True")
                {
                    pdfTab.AddCell("Commandé le " + Convert.ToDateTime(str).ToString("yyyy/MM/dd"));
                }
                else
                {
                    pdfTab.AddCell("Non");
                }
                pdfTab.AddCell(dr.GetValue(4).ToString());
                pdfTab.AddCell(dr.GetValue(5).ToString());
                pdfTab.AddCell(dr.GetValue(6).ToString());
                pdfTab.AddCell(dr.GetValue(7).ToString());
                pdfTab.AddCell(dr.GetValue(3).ToString());
            }

            pdfDoc.Open();
            pdfDoc.Add(titre);
            pdfDoc.Add(dateJour);
            pdfDoc.Add(new Paragraph("\n"));
            pdfDoc.Add(pdfTab);
            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
            System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=Commandes_" + DateTime.Today.ToString("yyyy/MM/dd") + ".pdf");
            System.Web.HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            System.Web.HttpContext.Current.Response.Write(pdfDoc);
            System.Web.HttpContext.Current.Response.End();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }
}