using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accueil : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            divChangerDateEntretien.Visible = false;
        }
        InitialiserBoutonDeconnexion();
        Cmds.commandeEntretien = Cmds.CommandeEntretien.selectionnerTousLesEntretiens;
        Cmds.commandeProduit = Cmds.CommandeProduit.selectionnerTousLesProduits;
        labelNomUtilisateurConnecte.Text = Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
        AjouterLesNotifications();
        if (divChangerDateEntretien.Visible == true)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Anchor", "location.hash = '#divChangerDateEntretien';", true);
        }
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
            liAdministrateur.Style.Add("display", "block");
            labelNomUtilisateurConnecte.ForeColor = System.Drawing.Color.Black;
            labelNomUtilisateurConnecte.Font.Name = "Times New Roman";
        }
    }

    private void AjouterLesNotifications()
    {
        MainPltModelContainer ctx = new MainPltModelContainer();
        DateTime differenceDates = DateTime.Now.AddDays(30);
        IQueryable<Entretien> query = from entretien in ctx.Entretiens where entretien.DateProchainEntretien <= differenceDates select entretien;
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
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "100px");
            createDiv.Style.Add(HtmlTextWriterStyle.Color, "white");
            createDiv.Style.Add(HtmlTextWriterStyle.PaddingLeft, "20px");
            createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
            if (calculJoursRestants.Days >= 14)
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "blue");
            }
            else if (calculJoursRestants.Days > 7 && calculJoursRestants.Days <= 13)
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "green");
            }
            else if (calculJoursRestants.Days <= 7)
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
            if (calculJoursRestants.Days > 1)
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
            boutonFait.Style.Add("margin", "20px");
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
            boutonSupprimer.Style.Add("margin", "20px");
            boutonSupprimer.Text = "Supprimer";
            boutonSupprimer.BackColor = System.Drawing.Color.Red;
            boutonSupprimer.IDMachine = ent.Element.Id;
            createDiv.Controls.Add(labelNomMachine);
            createDiv.Controls.Add(labelRepNomMachine);
            createDiv.Controls.Add(labelNumeroMachine);
            createDiv.Controls.Add(labelRepNumeroMachine);
            createDiv.Controls.Add(labelNomEntretien);
            createDiv.Controls.Add(labelRepNomEntretien);
            createDiv.Controls.Add(labelDateEntretien);
            createDiv.Controls.Add(boutonSupprimer);
            createDiv.Controls.Add(boutonFait);
            ligne++;
        }
    }

    private void BoutonSupprimer_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        Cmds.idEntretienSelectionneEntretienPrecedant = b.IDEntretien;
        divChangerDateEntretien.Visible = true;
        ClientScript.RegisterStartupScript(this.GetType(), "Anchor", "location.hash = '#divChangerDateEntretien';", true);
    }

    private void BoutonFait_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        Cmds.idEntretienSelectionneEntretienPrecedant = b.IDEntretien;
        Cmds.idMachineSelectionneEntretienPrecedant = b.IDMachine;
        Response.Redirect("AjouterEntretienPrecedant.aspx");
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }

    protected void h2Machines_Click(object sender, EventArgs e)
    {

    }

    protected void calendarDate_SelectionChanged(object sender, EventArgs e)
    {
        textBoxProchaineDate.Text = calendarDate.SelectedDate.ToString();
    }

    protected void buttonOk_Click(object sender, EventArgs e)
    {
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
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void buttonCancel_Click(object sender, EventArgs e)
    {
        divChangerDateEntretien.Visible = false;
    }
}