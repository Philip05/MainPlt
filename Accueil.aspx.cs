using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginLeft, "627px");
        panelNotifications.Style.Add(HtmlTextWriterStyle.MarginRight, "50px");
        for (int i = 0; i < 20; i++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
          new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.ID = "divNotifications";
            createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "White");
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "100px");
            createDiv.Style.Add(HtmlTextWriterStyle.Width, "'" + panelNotifications.Width + "px'");
            createDiv.Style.Add(HtmlTextWriterStyle.BorderStyle, "groove");
            createDiv.Style.Add(HtmlTextWriterStyle.PaddingRight, "50px");
            panelNotifications.Controls.Add(createDiv);
            Label labelNomMachine = new Label();
            labelNomMachine.Text = "Nom de la machine : ";
            labelNomMachine.Style.Add("margin", "20px");
            Label labelNumeroMachine = new Label();
            labelNumeroMachine.Text = "Numéro de la machine : ";
            labelNumeroMachine.Style.Add("margin", "20px");
            Label labelNomEntretien = new Label();
            labelNomEntretien.Text = "Entretien : ";
            labelNomEntretien.Style.Add("margin", "20px");
            Label labelDateEntretien = new Label();
            labelDateEntretien.Text = "Entretien dû pour le 2017/05/06, soit dans 10 jours.";
            labelDateEntretien.Style.Add("margin", "20px");
            Button boutonFait = new Button();
            boutonFait.Text = "Terminé";
            boutonFait.Style.Add("margin", "20px");
            boutonFait.BackColor = System.Drawing.Color.Green;
            createDiv.Controls.Add(labelNomMachine);

            createDiv.Controls.Add(labelNumeroMachine);
            createDiv.Controls.Add(labelNomEntretien);
            createDiv.Controls.Add(labelDateEntretien);
            createDiv.Controls.Add(boutonFait);
        }

    }
}