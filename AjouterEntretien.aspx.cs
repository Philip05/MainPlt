using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterEntretien : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();

    

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        if (textBoxDateProchainEntretien.Text != string.Empty && textBoxDescriptionEntretien.Text != string.Empty && textBoxRecurrence.Text != string.Empty && textBoxNomEntretien.Text != string.Empty)
        {
            Enregistrer();
            Cmds.Alerte("Insertion réussie.", this, GetType());
        }
        else
        {
            Cmds.Alerte("Tous les champs doivent être remplis.", this, GetType());
        }
        textBoxNomEntretien.Focus();
    }

    private void ViderTextbox()
    {
        textBoxNomEntretien.Text = string.Empty;
        textBoxRecurrence.Text = string.Empty;
        textBoxDescriptionEntretien.Text = string.Empty;
        textBoxDateProchainEntretien.Text = string.Empty;
    }

    private void Enregistrer()
    {
        try
        {
            DateTime date = Convert.ToDateTime(textBoxDateProchainEntretien.Text);
            Element ele = (from elem in ctx.Elements where elem.Id == Cmds.idMachineSelectionne select elem).FirstOrDefault();
            Entretien ent = new Entretien();
            ent.TitreEntretien = textBoxNomEntretien.Text;
            ent.Recurrence = int.Parse(textBoxRecurrence.Text);
            ent.DescriptionEntretien = textBoxDescriptionEntretien.Text;
            ent.DateProchainEntretien = date;
            ent.Element = ele;
            ctx.Entretiens.Add(ent);
            ctx.SaveChanges();
            ViderTextbox();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }
}