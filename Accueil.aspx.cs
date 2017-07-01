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
        AjouterLesNotifications();
        InitialiserBoutonDeconnexion();
    }

    private void EvenementsClique()
    {
       
    }

    private void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
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

    public void AjouterLesNotifications()
    {
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginLeft, "0px");
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginRight, "100px");
        for (int i = 0; i < 20; i++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
            new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.ID = "divNotifications" + i.ToString();
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "100px");
            createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
            if(i%2 == 0)
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
            labelRepNomMachine.Text = i.ToString();
            Label labelNumeroMachine = new Label();
            labelNumeroMachine.Text = "Numéro de la machine : ";
            labelNumeroMachine.Style.Add("margin", "20px");
            Label labelRepNumeroMachine = new Label();
            labelRepNumeroMachine.Text = i.ToString();
            Label labelNomEntretien = new Label();
            labelNomEntretien.Text = "Entretien : ";
            labelNomEntretien.Style.Add("margin", "20px");
            Label labelRepNomEntretien = new Label();
            labelRepNomEntretien.Text = i.ToString();
            Label labelDateEntretien = new Label();
            labelDateEntretien.Text = "Entretien dû pour le 2017/05/06, soit dans 10 jours.";
            labelDateEntretien.Style.Add("margin", "20px");
            ButtonNumeroMachine boutonFait = new ButtonNumeroMachine();
            boutonFait.Click += BoutonFait_Click;
            boutonFait.Text = "Terminé";
            boutonFait.Style.Add("float", "right");
            boutonFait.Style.Add("width", "100px");
            boutonFait.Style.Add("height", "40px");
            boutonFait.Style.Add("margin", "20px");
            boutonFait.BackColor = System.Drawing.Color.Green;
            boutonFait.NumeroMachine = labelRepNumeroMachine.Text;
            ButtonNumeroMachine boutonSupprimer = new ButtonNumeroMachine();
            boutonSupprimer.Click += BoutonSupprimer_Click;
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
        }
    }

    private void BoutonSupprimer_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
    }

    private void BoutonFait_Click(object sender, EventArgs e)
    {
        ButtonNumeroMachine b = new ButtonNumeroMachine();
        b = (ButtonNumeroMachine)sender;
        b.Text = b.NumeroMachine;
        Cmds.numeroMachineBoutonCliqueAccueil = b.NumeroMachine;
        Response.Redirect("AjouterEntretienPrecedant.aspx");
    }                              
    //public void test()
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
    //}

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }

    protected void h2Machines_Click(object sender, EventArgs e)
    {
     
    }
}