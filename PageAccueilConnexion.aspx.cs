using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        MainPltModelContainer ctx = new MainPltModelContainer();
        string motDePasse = TextBoxCode.Text;
      
        try
        {
            Cmds.nomUsagerConnecte = (from usager in ctx.Usagers
                                       where usager.MotDePasse == motDePasse
                                       select usager.Nom).FirstOrDefault();
            Cmds.prenomUsagerConnecte = (from usager in ctx.Usagers
                                      where usager.MotDePasse == motDePasse
                                      select usager.Prenom).FirstOrDefault();
            Cmds.usagerConnecte = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if(Cmds.nomUsagerConnecte != null && Cmds.prenomUsagerConnecte != null && Cmds.usagerConnecte == true)
            {
                Response.Redirect("Accueil.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Mauvais mot de passe.');", true);
                TextBoxCode.Text = string.Empty;
            }
        }
    }

    protected void ShowMessage()
    {
        BootstrapAlerts test = new BootstrapAlerts();
        test.ShowNotification("test", BootstrapAlerts.TypeAlertes.Avertissement);
    }
}