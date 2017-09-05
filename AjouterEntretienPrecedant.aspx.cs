using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterEntretienPrecedant : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private DateTime date;
    private int recurrence;
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserLesLabels();
        buttonAjouterRemarqueEntretien.Click += ButtonAjouterRemarqueEntretien_Click;
        textBoxDescriptionAjouterEntretien.Focus();
    }


    private void InitialiserLesLabels()
    {
        IQueryable<Entretien> query = from ent in ctx.Entretiens where ent.Id == Cmds.idEntretienSelectionneEntretienPrecedant select ent;
        foreach (Entretien ent in query)
        {
            recurrence = Convert.ToInt32(ent.Recurrence);
            labelTitreAjouterEntretien.Text = "Compléter un entretien sur " + ent.Element.NomElement + " (" + ent.Element.NumeroElement + ")";
            labelTypeEntretien.Text = "Entretien : " + ent.TitreEntretien;
            DateTime date = DateTime.Now;
            labelDateEntretien.Text = "Date : " + date.ToString("yyyy-MM-dd");
            labelResponsableEntretien.Text = "Fait par : " + Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
            labelRecurrenceEntretien.Text = "Recurrence : " + ent.Recurrence + " jours";
            labelDateProchainEntretien1.Text = "Date du prochain entretien : " + DateTime.Now.AddDays(recurrence).ToString("yyyy-MM-dd");
        }
    }

    private void ButtonAjouterRemarqueEntretien_Click(object sender, EventArgs e)
    {
        Response.Redirect("AjouterRemarque.aspx");
    }

    protected void buttonAjouterEntretien_Click(object sender, EventArgs e)
    {
        Enregistrer();
        SetValue();
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Insertion réussie');", true);
    }

    private void SetValue()
    {
        int ele = (from element in ctx.Elements
                   where element.Id == Cmds.idMachineSelectionneEntretienPrecedant
                   select element.Id).FirstOrDefault();
        int ent = (from entretien in ctx.Entretiens
                   where entretien.Id == Cmds.idEntretienSelectionneEntretienPrecedant
                   select entretien.Id).FirstOrDefault();
        Cmds.idEntretienPrecedantAjoute = (from entprId in ctx.EntretiensPrecedants
                                           where entprId.DateEntretienPrecedant == date && entprId.Elements.Id == ele && entprId.Entretien.Id == ent && entprId.DescriptionEntretienPrecedant == textBoxDescriptionAjouterEntretien.Text
                                           select entprId.Id).FirstOrDefault();
    }

    private void ModifierDateProchainEntretien()
    {
        try
        {
            var ent = ctx.Entretiens.Where(s => s.Id == Cmds.idEntretienSelectionneEntretienPrecedant).First();
            ent.DateProchainEntretien = DateTime.Now.AddDays(recurrence);
            ctx.SaveChanges(); 
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void Enregistrer()
    {
        date = DateTime.Today;
        try
        {
            Entretien ent = (from entretien in ctx.Entretiens
                             where entretien.Id == Cmds.idEntretienSelectionneEntretienPrecedant
                             select entretien).FirstOrDefault();
            Element ele = (from element in ctx.Elements
                           where element.Id == Cmds.idMachineSelectionneEntretienPrecedant
                           select element).FirstOrDefault();
            EntretiensPrecedant entp = new EntretiensPrecedant();
            entp.PrenomEmploye = Cmds.prenomUsagerConnecte;
            entp.NomEmploye = Cmds.nomUsagerConnecte;
            entp.DateEntretienPrecedant = date;
            entp.DescriptionEntretienPrecedant = textBoxDescriptionAjouterEntretien.Text;
            entp.Elements = ele;
            entp.Entretien = ent;
            ctx.EntretiensPrecedants.Add(entp);
            ctx.SaveChanges();
            ModifierDateProchainEntretien();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}