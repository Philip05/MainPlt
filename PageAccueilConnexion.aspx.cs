using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageAccueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cmds.InitialiserLesValeurs();
        System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
        new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        createDiv.ID = "divNotifications";
        createDiv.InnerHtml = " I'm a div, from code behind ";
        this.Controls.Add(createDiv);
        ButtonConnexionAccueil.Click += ButtonConnexionAccueil_Click;
    }

    private void ButtonConnexionAccueil_Click(object sender, EventArgs e)
    {
        Cmds.nomUsagerConnecte = "Drouin";
        Cmds.prenomUsagerConnecte = "Philip";
        Cmds.usagerConnecte = true;
        Response.Redirect("Accueil.aspx");
    }
}