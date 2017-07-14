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

public partial class ImprimerEntretien : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        AjouterJoursDropDownList(45);
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
        int jours = int.Parse(dropDownListNombreJours.Text);
        DateTime addDate = DateTime.Today.AddDays(jours);
        Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
        string title = @"Liste des entretiens à faire du " + DateTime.Today.ToString("yyyy/MM/dd") + " au " + addDate.ToString("yyyy/MM/dd");
        Paragraph titre = new Paragraph(title, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
        titre.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
        //HTML
        PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        PdfPTable pdfTab = new PdfPTable(4); 
        pdfTab.HorizontalAlignment = 1; 
        pdfTab.SpacingBefore = 20f;
        pdfTab.SpacingAfter = 20f;

        pdfTab.AddCell("Numéro");
        pdfTab.AddCell("Nom de l'entretien");
        pdfTab.AddCell("Machine");
        pdfTab.AddCell("Date d'échéance");

        IQueryable<Entretien> query = from entretien in ctx.Entretiens where entretien.DateProchainEntretien <= addDate  select entretien;
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
        pdfWriter.CloseStream = false;
        pdfDoc.Close();
        System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
        System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=ListedesEntretien_" + DateTime.Today.ToString("yyyy/MM/dd") + ".pdf");
        System.Web.HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        System.Web.HttpContext.Current.Response.Write(pdfDoc);
        System.Web.HttpContext.Current.Response.End();
    }


    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }

    protected void linkButtonVéhicules_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.vehicules;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonUsinage_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.usinage;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonRemorque_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.remorque;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonPontsRoulants_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.pontRoulant;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonSoudeuse_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.soudeuse;
        Response.Redirect("ListeDesMachines.aspx");
    }

    protected void linkButtonAirMakeUp_Click(object sender, EventArgs e)
    {
        Cmds.categorieListeProduits = Cmds.CategorieListeProduit.airMakeUp;
        Response.Redirect("ListeDesMachines.aspx");
    }
}