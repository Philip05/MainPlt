using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DossierMachine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void labelEntretiensMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("EntretienSelectionne.aspx");
    }

    protected void labelEntretiensRecents_Click(object sender, EventArgs e)
    {
        Response.Redirect("EntretiensMachine.aspx");
    }

    protected void labelProduitsMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProduitSelectionne.aspx");
    }

    protected void labelRemarquesMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListeRemarqueMachine.aspx");
    }

    protected void labelProceduresMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProceduresMachine.aspx");
    }
}