using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImprimerEntretien : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AjouterJoursDropDownList(45);
    }

    private void AjouterJoursDropDownList(int nombreJours)
    {
        for (int i = 0; i <= nombreJours; i++)
        {
            dropDownListNombreJours.Items.Add(i.ToString());
        }
    }
}