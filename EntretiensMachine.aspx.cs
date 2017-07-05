using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntretiensMachine : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private bool rechercher;
    private bool selectionner;
    private string idEntretienSelectionne;
    protected void Page_Load(object sender, EventArgs e)
    {
        rechercher = false;
        selectionner = false;
    }

    public IQueryable gridViewEntretiensMachine_GetData()
    {
        if (rechercher == false)
        {
            var query = from ent in ctx.EntretiensPrecedants
                        where ent.Elements.Id == Cmds.idMachineSelectionne
                        select new
                        {
                            ent.Id,
                            ent.Entretien.TitreEntretien
                        };
            return query;
        }
        else
        {
            var query = from ent in ctx.EntretiensPrecedants
                        where ent.Elements.Id == Cmds.idMachineSelectionne && ent.Entretien.TitreEntretien.Contains(textBoxRechercherEntretienMachine.Text)
                        select new
                        {
                            ent.Id,
                            ent.Entretien.TitreEntretien
                        };
            rechercher = false;
            return query;
        }
    }

    protected void textBoxRechercherMachine_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        gridViewEntretiensMachine.DataBind();
    }

    private void RemplirLabels(int id)
    {
        DateTime date;
        string nomEmploye;
        string prenomEmploye;
        string description;

        date = (from ent in ctx.EntretiensPrecedants
                where ent.Id == id
                select ent.DateEntretienPrecedant).FirstOrDefault();

        nomEmploye = (from ent in ctx.EntretiensPrecedants
                      where ent.Id == id
                      select ent.NomEmploye).FirstOrDefault();

        prenomEmploye = (from ent in ctx.EntretiensPrecedants
                      where ent.Id == id
                      select ent.PrenomEmploye).FirstOrDefault();

        description = (from ent in ctx.EntretiensPrecedants
                       where ent.Id == id
                       select ent.DescriptionEntretienPrecedant).FirstOrDefault();


        labelEmploye.Text = "Fait par : " + prenomEmploye + " " + nomEmploye;
        textBoxDescriptionEntretienMachine.Text = description;
        labelDateFait.Text = "Fait le : " + date.ToString();
    }


    protected void gridViewEntretiensMachine_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            selectionner = true;
            idEntretienSelectionne = gridViewEntretiensMachine.Rows[no].Cells[1].Text;
            RemplirLabels(Convert.ToInt32(idEntretienSelectionne));
        }
    }
}