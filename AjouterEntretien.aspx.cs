using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            if (Valider())
            {
                Enregistrer();
                Cmds.Alerte("Insertion réussie.", this, GetType());
            }
            else
            {
                Cmds.Alerte("La réccurence ou la date ne sont pas valides.", this, GetType());
            }
        }
        else
        {
            Cmds.Alerte("Tous les champs doivent être remplis.", this, GetType());
        }
        textBoxNomEntretien.Focus();
    }


    private bool Valider()
    {
        bool reponse = true;
        int t;
        DateTime d;
        if (int.TryParse(textBoxRecurrence.Text, out t) != true || DateTime.TryParse(textBoxDateProchainEntretien.Text, out d) != true)
        {
            reponse = false;
        }
        return reponse;
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
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "INSERT INTO Entretiens(TitreEntretien,Recurrence,DescriptionEntretien,DateProchainEntretien,Element_Id,Afficher) VALUES (@TitreEntretien,@Recurrence,@DescriptionEntretien,@DateProchainEntretien,@Element_Id,@Afficher)";

        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            int reccurrence = int.Parse(textBoxRecurrence.Text);
            DateTime date = Convert.ToDateTime(textBoxDateProchainEntretien.Text);
            Element ele = (from elem in ctx.Elements where elem.Id == Cmds.idMachineSelectionne select elem).FirstOrDefault();
            int element = ele.Id;
            cmd.Parameters.Add(new SqlParameter("@TitreEntretien", textBoxNomEntretien.Text));
            cmd.Parameters.Add(new SqlParameter("@Recurrence", reccurrence));
            cmd.Parameters.Add(new SqlParameter("@DescriptionEntretien", textBoxDescriptionEntretien.Text));
            cmd.Parameters.Add(new SqlParameter("@DateProchainEntretien", date));
            cmd.Parameters.Add(new SqlParameter("@Element_Id", element));
            cmd.Parameters.Add(new SqlParameter("@Afficher", 1));
            cmd.ExecuteNonQuery();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
        con.Close();
    }
}