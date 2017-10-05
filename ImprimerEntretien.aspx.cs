using System;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data.SqlClient;

public partial class ImprimerEntretien : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        AjouterJoursDropDownList(60);
    }

    private void AjouterJoursDropDownList(int nombreJours)
    {
        for (int i = 0; i <= nombreJours; i++)
        {
            dropDownListNombreJours.Items.Add(i.ToString());
        }
    }

    protected void buttonGenererLaliste_Click(object sender, EventArgs e)
    {
        CreerPdf();
    }

    private void CreerPdf()
    {
        try
        {
            int jours = int.Parse(dropDownListNombreJours.Text);
            DateTime addDate = DateTime.Today.AddDays(jours);
            Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            string title = @"Liste des entretiens à faire du " + DateTime.Today.ToString("yyyy/MM/dd") + " au " + addDate.ToString("yyyy/MM/dd");
            Paragraph titre = new Paragraph(title, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            titre.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
            //HTML
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            PdfPTable pdfTab = new PdfPTable(4);
            pdfTab.WidthPercentage = 100;
            pdfTab.SpacingBefore = 5f;
            pdfTab.SpacingAfter = 5f;

            pdfTab.AddCell("Numéro");
            pdfTab.AddCell("Nom de l'entretien");
            pdfTab.AddCell("Machine");
            pdfTab.AddCell("Date d'échéance");

            IQueryable<Entretien> query = from entretien in ctx.Entretiens where entretien.DateProchainEntretien <= addDate select entretien;
            foreach (Entretien ent in query)
            {
                pdfTab.AddCell(ent.Id.ToString());
                pdfTab.AddCell(ent.TitreEntretien);
                pdfTab.AddCell(ent.Element.NomElement);
                pdfTab.AddCell(ent.DateProchainEntretien.ToString("yyyy/MM/dd"));
            }

            pdfDoc.Open();
            pdfDoc.Add(titre);
            pdfDoc.Add(new Paragraph("\n"));
            pdfDoc.Add(pdfTab);
            pdfDoc.NewPage();

            //Remarques
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            string queryRemarque = "SELECT Remarques.Id, Remarques.TitreRemarque, Remarques.DescriptionRemarque, Remarques.Elements_Id, Remarques.DateProchainEntretien, Elements.NomElement, Elements.Id FROM Remarques Inner join Elements on Elements_Id = Elements.Id where Afficher != 3 order by Remarques.DateProchainEntretien";
            SqlCommand cmd = new SqlCommand(queryRemarque, con);
            SqlDataReader Reader;
            PdfPTable pdfTableRemarque = new PdfPTable(6);

            pdfTableRemarque.WidthPercentage = 100;
            pdfTableRemarque.SpacingBefore = 5f;
            pdfTableRemarque.SpacingAfter = 5f;

            pdfTableRemarque.AddCell("# Remarque");
            pdfTableRemarque.AddCell("Titre");
            pdfTableRemarque.AddCell("Description");
            pdfTableRemarque.AddCell("# Machine");
            pdfTableRemarque.AddCell("Nom machine");
            pdfTableRemarque.AddCell("Date d'échéance");

            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                pdfTableRemarque.AddCell(Reader.GetValue(0).ToString());
                pdfTableRemarque.AddCell(Reader.GetValue(1).ToString());
                pdfTableRemarque.AddCell(Reader.GetValue(2).ToString());
                pdfTableRemarque.AddCell(Reader.GetValue(3).ToString());
                pdfTableRemarque.AddCell(Reader.GetValue(5).ToString());
                pdfTableRemarque.AddCell(Reader.GetDateTime(4).ToString("yyyy/MM/dd"));
            }
            string remarque = "Remarques";
            string date = @"Imprimé le : " + DateTime.Today.ToString("yyyy/MM/dd");
            Paragraph dateJour = new Paragraph(date, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            Paragraph titreRemarque = new Paragraph(remarque, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            titreRemarque.Alignment = iTextSharp.text.Element.ALIGN_CENTER; ;
            dateJour.Alignment = iTextSharp.text.Element.ALIGN_CENTER; ;
            pdfDoc.Add(titreRemarque);
            pdfDoc.Add(dateJour);
            pdfDoc.Add(new Paragraph("\n"));
            pdfDoc.Add(pdfTableRemarque);

            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
            System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=ListedesEntretien_" + DateTime.Today.ToString("yyyy/MM/dd") + ".pdf");
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