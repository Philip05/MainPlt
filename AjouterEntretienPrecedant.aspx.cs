using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterEntretienPrecedant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        buttonAjouterRemarqueEntretien.Click += ButtonAjouterRemarqueEntretien_Click;
        labelTitreAjouterEntretien.Text = "Compléter un entretien sur " + Cmds.numeroMachineBoutonCliqueAccueil;
    }

    private void ButtonAjouterRemarqueEntretien_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterRemarque.aspx");
    }
}