using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DossierMachine : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private string numeroElement = Cmds.numeroMachineSelectionne;
    private string sourceImageElement;
    private int typeElementId;
    private int typeEmplacementId;
    private string typeElement;
    private string typeEmplacement;
    private string nomElementSelectionne;
    private int idElementSelectionne;
    protected void Page_Load(object sender, EventArgs e)
    {
        InformationsMachine();
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

    private void InformationsMachine()
    {
        nomElementSelectionne = (from ma in ctx.Elements
                                 where ma.NumeroElement == numeroElement
                                 select ma.NomElement).FirstOrDefault();

        typeElementId = (from ty in ctx.Elements
                         where ty.NumeroElement == numeroElement
                         select ty.TypesElement.Id).FirstOrDefault();

        typeEmplacementId = (from ty in ctx.Elements
                             where ty.NumeroElement == numeroElement
                             select ty.TypeEmplacements.Id).FirstOrDefault();

        typeElement = (from ty in ctx.TypesElements
                       where ty.Id == typeElementId
                       select ty.NomTypeElement).FirstOrDefault();

        typeEmplacement = (from ty in ctx.TypeEmplacementSet
                           where ty.Id == typeEmplacementId
                           select ty.NomTypeEmplacement).FirstOrDefault();

        textBoxDescriptionMachine.Text = (from ma in ctx.Elements
                                          where ma.NumeroElement == numeroElement
                                          select ma.DescriptionElement).FirstOrDefault();

        labelTitreMachine.Text = nomElementSelectionne;
        labelTypeElement.Text = "Type : " + typeElement;
        labelTypeEmplacement.Text = "Emplacement : " + typeEmplacement;

        Cmds.idMachineSelectionne = (from ma in ctx.Elements
                                where ma.NumeroElement == numeroElement
                                select ma.Id).FirstOrDefault();

        sourceImageElement = (from ph in ctx.PhotosElements
                              where ph.Elements.Id == Cmds.idMachineSelectionne
                              select ph.SourcePhotoElement).FirstOrDefault();

        imageElementSelectionne.ImageUrl = sourceImageElement;
    }
}