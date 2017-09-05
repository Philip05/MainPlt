using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DossierMachine : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private string numeroElement = Cmds.numeroMachineSelectionne;
    private string sourceImageElement = "";
    private int typeElementId;
    private int typeEmplacementId;
    private string typeElement;
    private string typeEmplacement;
    private string nomElementSelectionne;
    private int idElementSelectionne;
    private string anneeMachine;
    private string numeroSerie;
    protected void Page_Load(object sender, EventArgs e)
    {
        InformationsMachine();
    }

    protected void labelEntretiensMachine_Click(object sender, EventArgs e)
    {
        Cmds.commandeEntretien = Cmds.CommandeEntretien.selectionnerLesEntretiensMachine;
        Response.Redirect("EntretienSelectionne.aspx");
    }

    protected void labelEntretiensRecents_Click(object sender, EventArgs e)
    {
        Response.Redirect("EntretiensMachine.aspx");
    }

    protected void labelProduitsMachine_Click(object sender, EventArgs e)
    {
        //Response.Redirect("ProduitSelectionne.aspx");
        //Cmds.commandeProduit = Cmds.CommandeProduit.selectionnerLesProduitsMachine;
    }

    protected void labelRemarquesMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListeRemarqueMachine.aspx");
    }

    protected void labelProceduresMachine_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProceduresMachine.aspx");
    }

    private void AnneeNumeroSerieMachine()
    {
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "SELECT * FROM Elements WHERE Id = " + Cmds.idMachineSelectionne;
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader Reader;
        try
        {
            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                anneeMachine = Reader.GetValue(7).ToString();
                numeroSerie = Reader.GetValue(6).ToString();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
    }

    private void InformationsMachine()
    {
        string numeroMachine = (from ma in ctx.Elements
                                where ma.Id == Cmds.idMachineSelectionne
        select ma.NumeroElement).FirstOrDefault();

        nomElementSelectionne = (from ma in ctx.Elements
                                 where ma.Id == Cmds.idMachineSelectionne
                                 select ma.NomElement).FirstOrDefault();

        typeElementId = (from ty in ctx.Elements
                         where ty.Id == Cmds.idMachineSelectionne
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
                                          where ma.Id == Cmds.idMachineSelectionne
                                          select ma.DescriptionElement).FirstOrDefault();
        AnneeNumeroSerieMachine();
        labelTitreMachine.Text = nomElementSelectionne;
        labelTypeElement.Text = "Type : " + typeElement;
        labelTypeEmplacement.Text = "Emplacement : " + typeEmplacement;
        labelTitreAnneeMachine.Text = "Année : " + anneeMachine.ToString();
        labelTitreNumeroSerieMachine.Text = "# série : " + numeroSerie.ToString();
        labelNumeroMachine.Text = "# model : " + numeroMachine;

        sourceImageElement = (from ph in ctx.PhotosElements
                              where ph.Elements.Id == Cmds.idMachineSelectionne
                              select ph.SourcePhotoElement).FirstOrDefault();
        if (sourceImageElement != null)
        {
            imageElementSelectionne.Visible = true;
            imageElementSelectionne.ImageUrl = sourceImageElement;
            fileUploadAjouterPhotoMachine.Visible = false;
            labelAjouterPhotoMachine.Visible = false;
            ButtonAjouterImage.Visible = false;
        }
        else if (sourceImageElement == null)
        {
            imageElementSelectionne.Visible = false;
            fileUploadAjouterPhotoMachine.Visible = true;
            labelAjouterPhotoMachine.Visible = true;
            ButtonAjouterImage.Visible = true;
        }
    }

    private void UploadImages()
    {
        statusLabel.Text = string.Empty;
        if (fileUploadAjouterPhotoMachine.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(fileUploadAjouterPhotoMachine.FileName);
                fileUploadAjouterPhotoMachine.SaveAs(Server.MapPath("PhotosElements/") + filename);
                PhotosElement pho = new PhotosElement();
                Element ele = (from element in ctx.Elements
                               where element.Id == Cmds.idMachineSelectionne
                               select element).FirstOrDefault();
                pho.SourcePhotoElement = "PhotosElements/" + filename;
                pho.Elements = ele;
                ctx.PhotosElements.Add(pho);
                ctx.SaveChanges();
                statusLabel.Text = "Image Ajoutée.";
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
        else
        {
            Cmds.Alerte("Vous devez sélectionner une image.", this, GetType());
        }
    }

    protected void ButtonAjouterImage_Click(object sender, EventArgs e)
    {
        UploadImages();
    }
}
