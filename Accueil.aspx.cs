using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accueil : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool choisir;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                divChangerDateEntretien.Visible = false;
                choisir = false;
            }
            Cmds.commandeEntretien = Cmds.CommandeEntretien.selectionnerTousLesEntretiens;
            Cmds.commandeProduit = Cmds.CommandeProduit.selectionnerTousLesProduits;
            if (DropDownListEntretiensOuRemarques.Text == "Entretiens")
            {
                AjouterLesNotificationsEntretiens();
            }
            else if (DropDownListEntretiensOuRemarques.Text == "Remarques")
            {
                AjouterLesNotificationsRemarques();
            }
            if (divChangerDateEntretien.Visible == true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Anchor", "location.hash = '#divChangerDateEntretien';", true);
            }
        }
        catch (Exception a)
        {
            throw a;
        }

    }

    private void AjouterLesNotificationsEntretiens()
    {
        try
        {
            DateTime differenceDates = DateTime.Now.AddDays(30);
            IQueryable<Entretien> query = from entretien in ctx.Entretiens orderby entretien.DateProchainEntretien where entretien.DateProchainEntretien <= differenceDates select entretien;
            panelNotifications.Style.Add(HtmlTextWriterStyle.MarginLeft, "0px");
            panelNotifications.Style.Add(HtmlTextWriterStyle.MarginRight, "100px");
            string dateProchainEntretien;
            TimeSpan calculJoursRestants;
            int ligne = 0;
            foreach (Entretien ent in query)
            {
                dateProchainEntretien = ent.DateProchainEntretien.ToString("yyyy/MM/dd");
                calculJoursRestants = ent.DateProchainEntretien - DateTime.Today;
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
                new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                createDiv.ID = "divNotifications" + ligne.ToString();
                createDiv.Style.Add(HtmlTextWriterStyle.Height, "115px");
                createDiv.Style.Add(HtmlTextWriterStyle.Color, "white");
                createDiv.Style.Add(HtmlTextWriterStyle.PaddingLeft, "20px");
                createDiv.Style.Add(HtmlTextWriterStyle.BorderStyle, "solid");
                createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
                if (calculJoursRestants.Days >= 14)
                {
                    createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "blue");
                }
                else if (calculJoursRestants.Days >= 0 && calculJoursRestants.Days <= 13)
                {
                    createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "green");
                }
                else if (calculJoursRestants.Days < 0)
                {
                    createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "red");
                }
                createDiv.Style.Add(HtmlTextWriterStyle.PaddingRight, "50px");
                panelNotifications.Controls.Add(createDiv);
                Label labelNomMachine = new Label();
                labelNomMachine.Text = "Nom de la machine : ";
                labelNomMachine.Style.Add("margin", "20px");
                Label labelRepNomMachine = new Label();
                labelRepNomMachine.Text = ent.Element.NomElement.ToString();
                Label labelNumeroMachine = new Label();
                labelNumeroMachine.Text = "Numéro de la machine : ";
                labelNumeroMachine.Style.Add("margin", "20px");
                Label labelRepNumeroMachine = new Label();
                labelRepNumeroMachine.Text = ent.Element.NumeroElement;
                Label labelNomEntretien = new Label();
                labelNomEntretien.Text = "Entretien : ";
                labelNomEntretien.Style.Add("margin", "20px");
                Label labelRepNomEntretien = new Label();
                labelRepNomEntretien.Text = ent.TitreEntretien;
                Label labelDateEntretien = new Label();
                if (calculJoursRestants.Days != 1 || calculJoursRestants.Days != -1)
                {
                    labelDateEntretien.Text = "Entretien dû pour le " + dateProchainEntretien + ", soit dans " + calculJoursRestants.Days + " jours.";
                }
                else
                {
                    labelDateEntretien.Text = "Entretien dû pour le " + dateProchainEntretien + ", soit dans " + calculJoursRestants.Days + " jour.";
                }
                labelDateEntretien.Style.Add("margin", "20px");
                ButtonNumeroMachine boutonFait = new ButtonNumeroMachine();
                boutonFait.Click += BoutonFait_Click; ;
                boutonFait.Text = "Terminé";
                boutonFait.Style.Add("float", "right");
                boutonFait.Style.Add("width", "100px");
                boutonFait.Style.Add("height", "40px");
                boutonFait.CssClass = "col-lg-3 col-md-3 col-sm-3 col-xs-12";
                boutonFait.BackColor = System.Drawing.Color.Green;
                boutonFait.IDMachine = ent.Element.Id;
                boutonFait.IDEntretien = ent.Id;
                ButtonNumeroMachine boutonSupprimer = new ButtonNumeroMachine();
                boutonFait.Click += BoutonFait_Click;
                boutonSupprimer.Click += BoutonSupprimer_Click;
                boutonSupprimer.IDEntretien = ent.Id;
                boutonSupprimer.Style.Add("float", "right");
                boutonSupprimer.Style.Add("width", "100px");
                boutonSupprimer.Style.Add("height", "40px");
                boutonSupprimer.Style.Add("margin-left", "20px");
                boutonSupprimer.Text = "Supprimer";
                boutonSupprimer.CssClass = "col-lg-3 col-md-3 col-sm-3 col-xs-12";
                boutonSupprimer.BackColor = System.Drawing.Color.Red;
                boutonSupprimer.IDMachine = ent.Element.Id;
                createDiv.Controls.Add(labelNomMachine);
                createDiv.Controls.Add(labelRepNomMachine);
                createDiv.Controls.Add(labelNumeroMachine);
                createDiv.Controls.Add(labelRepNumeroMachine);
                createDiv.Controls.Add(labelNomEntretien);
                createDiv.Controls.Add(labelRepNomEntretien);
                createDiv.Controls.Add(labelDateEntretien);
                createDiv.Controls.Add(new LiteralControl("<br />"));
                createDiv.Controls.Add(boutonSupprimer);
                createDiv.Controls.Add(boutonFait);
                createDiv.Controls.Add(new LiteralControl("<br />"));
                ligne++;
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void AjouterLesNotificationsRemarques()
    {
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "SELECT Remarques.Id, Remarques.TitreRemarque, Remarques.DescriptionRemarque, Remarques.Elements_Id, Remarques.DateProchainEntretien, Elements.NomElement, Elements.Id FROM Remarques Inner join Elements on Elements_Id = Elements.Id where Afficher != 3 order by Remarques.DateProchainEntretien";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader Reader;
        DateTime differenceDates = DateTime.Now.AddDays(30);
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginLeft, "0px");
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginRight, "100px");
        string dateProchainEntretien;
        TimeSpan calculJoursRestants;
        int ligne = 0;
        int numeroRemarque;
        int numeroMachine;

        try
        {
            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                numeroMachine = Convert.ToInt32(Reader.GetValue(3));
                numeroRemarque = Convert.ToInt32(Reader.GetValue(0));
                dateProchainEntretien = Reader.GetDateTime(4).ToString("yyyy/MM/dd");
                DateTime dateProchainEntretienCalcul = Convert.ToDateTime(dateProchainEntretien);
                calculJoursRestants = dateProchainEntretienCalcul - DateTime.Today;
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
                new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                createDiv.ID = "divNotifications" + ligne.ToString();
                createDiv.Style.Add(HtmlTextWriterStyle.Height, "115px");
                createDiv.Style.Add(HtmlTextWriterStyle.Color, "white");
                createDiv.Style.Add(HtmlTextWriterStyle.PaddingLeft, "20px");
                createDiv.Style.Add(HtmlTextWriterStyle.BorderStyle, "solid");
                createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
                if (calculJoursRestants.Days < 0)
                {
                    createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "red");
                }
                else if (calculJoursRestants.Days >= 0)
                {
                    createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "green");
                }
                createDiv.Style.Add(HtmlTextWriterStyle.PaddingRight, "50px");
                panelNotifications.Controls.Add(createDiv);
                Label labelNomRemarque = new Label();
                labelNomRemarque.Text = "Nom de la remarque : ";
                labelNomRemarque.Style.Add("margin", "20px");
                Label labelRepNomRemarque = new Label();
                labelRepNomRemarque.Text = Reader.GetValue(1).ToString();
                Label labelNumeroRemarque = new Label();
                labelNumeroRemarque.Text = "Numéro de la remarque : ";
                labelNumeroRemarque.Style.Add("margin", "20px");
                Label labelRepNumeroRemarque = new Label();
                labelRepNumeroRemarque.Text = numeroRemarque.ToString();
                Label labelNomMachine = new Label();
                labelNomMachine.Text = "À faire sur: ";
                labelNomMachine.Style.Add("margin", "20px");
                Label labelRepNomEntretien = new Label();
                labelRepNomEntretien.Text = Reader.GetValue(1).ToString();
                Label labelNumeroMachine = new Label();
                labelNumeroMachine.Text = "Numéro de la machine : ";
                labelNumeroMachine.Style.Add("margin", "20px");
                Label labelRepNumeroMachine = new Label();
                labelRepNumeroMachine.Text = Reader.GetValue(6).ToString();
                Label labelRepNomMachine = new Label();
                labelRepNomMachine.Text = Reader.GetValue(5).ToString();
                Label labelDateEntretien = new Label();
                if (calculJoursRestants.Days != 1 || calculJoursRestants.Days != -1)
                {
                    labelDateEntretien.Text = "Remarque dûe pour le " + dateProchainEntretien.ToString() + ", soit dans " + calculJoursRestants.Days + " jours.";
                }
                else
                {
                    labelDateEntretien.Text = "Remarque dûe pour le " + dateProchainEntretien + ", soit dans " + calculJoursRestants.Days + " jour.";
                }
                labelDateEntretien.Style.Add("margin", "20px");
                ButtonNumeroMachine boutonFaitRemarques = new ButtonNumeroMachine();
                boutonFaitRemarques.Click += BoutonFaitRemarques_Click;
                boutonFaitRemarques.OnClientClick = "javascript:return confirm('Reporter cette remarque de 10 jours ?');";
                boutonFaitRemarques.CausesValidation = true;
                boutonFaitRemarques.Text = "Reporter";
                boutonFaitRemarques.Style.Add("float", "right");
                boutonFaitRemarques.Style.Add("width", "100px");
                boutonFaitRemarques.Style.Add("height", "40px");
                boutonFaitRemarques.CssClass = "col-lg-3 col-md-3 col-sm-3 col-xs-12";
                boutonFaitRemarques.BackColor = System.Drawing.Color.Green;
                //Numéro de la remarque.
                boutonFaitRemarques.IDMachine = numeroRemarque;
                //boutonFait.IDEntretien = ent.Id;
                ButtonNumeroMachine boutonSupprimerRemarques = new ButtonNumeroMachine();
                boutonFaitRemarques.Click += BoutonFait_Click;
                boutonSupprimerRemarques.Click += BoutonSupprimerRemarques_Click;

                //Numéro de la machine.
                boutonSupprimerRemarques.IDEntretien = numeroMachine;
                boutonSupprimerRemarques.Style.Add("float", "right");
                boutonSupprimerRemarques.OnClientClick = "javascript:return confirm('Supprimer cette remarque?');";
                boutonSupprimerRemarques.CausesValidation = true;
                boutonSupprimerRemarques.Style.Add("width", "100px");
                boutonSupprimerRemarques.Style.Add("height", "40px");
                boutonSupprimerRemarques.Style.Add("margin-left", "20px");
                boutonSupprimerRemarques.Text = "Supprimer";
                boutonSupprimerRemarques.CssClass = "col-lg-3 col-md-3 col-sm-3 col-xs-12";
                boutonSupprimerRemarques.BackColor = System.Drawing.Color.Red;
                boutonSupprimerRemarques.IDMachine = numeroRemarque;
                createDiv.Controls.Add(labelNumeroRemarque);
                createDiv.Controls.Add(labelRepNumeroRemarque);
                createDiv.Controls.Add(labelNomRemarque);
                createDiv.Controls.Add(labelRepNomRemarque);
                createDiv.Controls.Add(labelNomMachine);
                createDiv.Controls.Add(labelRepNomMachine);
                createDiv.Controls.Add(labelNumeroMachine);
                createDiv.Controls.Add(labelRepNumeroMachine);
                createDiv.Controls.Add(labelDateEntretien);
                createDiv.Controls.Add(new LiteralControl("<br />"));
                createDiv.Controls.Add(boutonSupprimerRemarques);
                createDiv.Controls.Add(boutonFaitRemarques);
                createDiv.Controls.Add(new LiteralControl("<br />"));
                ligne++;
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void BoutonSupprimerRemarques_Click(object sender, EventArgs e)
    {
        try
        {
            Page.Validate();
            if (Page.IsValid)
            {
                ButtonNumeroMachine b = new ButtonNumeroMachine();
                b = (ButtonNumeroMachine)sender;

                SqlConnection con = new SqlConnection(Cmds.connectionString);
                string query = "UPDATE Remarques SET Afficher = 3 WHERE Id = " + b.IDMachine;
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteReader();
                Response.Redirect(Request.RawUrl);
            }
        }
        catch(Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void BoutonFaitRemarques_Click(object sender, EventArgs e)
    {
        try
        {
            Page.Validate();
            if (Page.IsValid)
            {
                DateTime date = DateTime.Today;
                ButtonNumeroMachine b = new ButtonNumeroMachine();
                b = (ButtonNumeroMachine)sender;

                SqlConnection con = new SqlConnection(Cmds.connectionString);
                string query = "UPDATE Remarques SET Afficher = 2, DateProchainEntretien = '" + date.AddDays(10) + "' WHERE Id = " + b.IDMachine;
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteReader();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void BoutonSupprimer_Click(object sender, EventArgs e)
    {
        try
        {
            ButtonNumeroMachine b = new ButtonNumeroMachine();
            b = (ButtonNumeroMachine)sender;
            Cmds.idEntretienSelectionneEntretienPrecedant = b.IDEntretien;
            divChangerDateEntretien.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "Anchor", "location.hash = '#divChangerDateEntretien';", true);
        }
        catch (Exception a)
        {
            throw a;
        }
    }

    private void BoutonFait_Click(object sender, EventArgs e)
    {
        try
        {
            ButtonNumeroMachine b = new ButtonNumeroMachine();
            b = (ButtonNumeroMachine)sender;
            Cmds.idEntretienSelectionneEntretienPrecedant = b.IDEntretien;
            Cmds.idMachineSelectionneEntretienPrecedant = b.IDMachine;
            Response.Redirect("AjouterEntretienPrecedant.aspx");
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    protected void calendarDate_SelectionChanged(object sender, EventArgs e)
    {
        textBoxProchaineDate.Text = calendarDate.SelectedDate.ToString();
    }

    protected void buttonOk_Click(object sender, EventArgs e)
    {
        MainPltModelContainer ctx = new MainPltModelContainer();
        DateTime date = Convert.ToDateTime(textBoxProchaineDate.Text);
        try
        {
            var ent = ctx.Entretiens.Where(s => s.Id == Cmds.idEntretienSelectionneEntretienPrecedant).First();
            ent.DateProchainEntretien = date;
            ctx.SaveChanges();
            divChangerDateEntretien.Visible = false;
            Cmds.Alerte("Changement réussi.", this, GetType());
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    protected void buttonCancel_Click(object sender, EventArgs e)
    {
        divChangerDateEntretien.Visible = false;
    }

    protected void imprimerNotifications_Click(object sender, EventArgs e)
    {
        CreerPdf();
    }

    private void CreerPdf()
    {
        try
        {
            MainPltModelContainer ctx = new MainPltModelContainer();
            DateTime differenceDates = DateTime.Now.AddDays(30);
            Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            string title = @"Liste des prochains entretiens à faire";
            string date = "Liste imprimée en date du " + DateTime.Today.ToString("yyyy-MM-dd");
            Paragraph titre = new Paragraph(title, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            Paragraph dateJour = new Paragraph(date, FontFactory.GetFont("Times New Roman", 16, Font.BOLD));
            titre.Alignment = iTextSharp.text.Element.ALIGN_CENTER;
            //HTML
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            PdfPTable pdfTab = new PdfPTable(5);
            pdfTab.HorizontalAlignment = 1;
            pdfTab.SpacingBefore = 20f;
            pdfTab.SpacingAfter = 20f;

            pdfTab.AddCell("Machine");
            pdfTab.AddCell("Numéro de la machine");
            pdfTab.AddCell("Entretien");
            pdfTab.AddCell("Numéro de l'entretien");
            pdfTab.AddCell("Date d'échéance");

            IQueryable<Entretien> query = from entretien in ctx.Entretiens where entretien.DateProchainEntretien <= differenceDates select entretien;
            foreach (Entretien ent in query)
            {
                pdfTab.AddCell(ent.Element.NomElement);
                pdfTab.AddCell(ent.Element.Id.ToString());
                pdfTab.AddCell(ent.TitreEntretien);
                pdfTab.AddCell(ent.Id.ToString());
                pdfTab.AddCell(ent.DateProchainEntretien.ToString("yyyy/MM/dd"));
            }

            pdfDoc.Open();
            pdfDoc.Add(titre);
            pdfDoc.Add(dateJour);
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
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    protected void DropDownListEntretiensOuRemarques_SelectedIndexChanged(object sender, EventArgs e)
    {
        choisir = true;
    }
}

