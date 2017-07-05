using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InitialiserBoutonDeconnexion();
            Cmds.commandeEntretien = Cmds.CommandeEntretien.selectionnerTousLesEntretiens;
            Cmds.commandeProduit = Cmds.CommandeProduit.selectionnerTousLesProduits;
            labelNomUtilisateurConnecte.Text = Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
            AjouterLesNotifications();
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
            dateProchainEntretien = ent.DateProchainEntretien.ToString();
            calculJoursRestants = ent.DateProchainEntretien - DateTime.Today;
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
            new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.ID = "divNotifications" + ligne.ToString();
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "100px");
            createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
            if (ligne % 2 == 0)
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "gray");
            }
            else
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "white");
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
            boutonFait.NumeroMachine = labelRepNumeroMachine.Text;
            ButtonNumeroMachine boutonSupprimer = new ButtonNumeroMachine();
            boutonSupprimer.Click += BoutonSupprimer_Click; ;
            boutonSupprimer.Style.Add("float", "right");
            boutonSupprimer.Style.Add("width", "100px");
            boutonSupprimer.Style.Add("height", "40px");
            boutonSupprimer.Style.Add("margin", "20px");
            boutonSupprimer.Text = "Supprimer";
            boutonSupprimer.BackColor = System.Drawing.Color.Red;
            boutonSupprimer.NumeroMachine = labelRepNumeroMachine.Text;
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

    private void BoutonFait_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
    }

    private void BoutonSupprimer_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        b.Text = b.NumeroMachine;
        Cmds.numeroMachineBoutonCliqueAccueil = b.NumeroMachine;
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
}