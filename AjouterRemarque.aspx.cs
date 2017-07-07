using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterRemarque : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        Labels();
    }

    private void Labels()
    {
        labelResponsable.Text = "Responsable : " + Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
    }

    protected void buttonAjouterRemarque_Click(object sender, EventArgs e)
    {
        Enregistrer();
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Insertion réussie');", true);
    }

    private void Enregistrer()
    {
        Entretien ent = (from entretien in ctx.Entretiens
                         where entretien.Id == Cmds.idEntretienSelectionneEntretienPrecedant
                         select entretien).FirstOrDefault();
        Element ele = (from element in ctx.Elements
                       where element.Id == Cmds.idMachineSelectionneEntretienPrecedant
                       select element).FirstOrDefault();
        EntretiensPrecedant entp = (from entprecedant in ctx.EntretiensPrecedants
                       where entprecedant.Id == Cmds.idEntretienPrecedantAjoute
                       select entprecedant).FirstOrDefault();
        Remarque rem = new Remarque();
        rem.DescriptionRemarque = textBoxDescrition.Text;
        rem.TitreRemarque = textBoxNom.Text;
        rem.Entretiens = ent;
        rem.Elements = ele;
        rem.EntretiensPrecedant = entp;
        ctx.Remarques.Add(rem);
        ctx.SaveChanges();
        UploadImages();
    }

    private void UploadImages()
    {
        if (FileUploadImages.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUploadImages.FileName);
                FileUploadImages.SaveAs(Server.MapPath("PhotosRemarques/") + filename);
                PhotosRemarque pho = new PhotosRemarque();
                Remarque rem = (from remarque in ctx.Remarques
                                 where remarque.DescriptionRemarque == textBoxDescrition.Text && remarque.TitreRemarque == textBoxNom.Text
                                 select remarque).FirstOrDefault();
                pho.SourcePhotoRemarque = "PhotosRemarques/" + filename;
                pho.Remarque = rem;
                ctx.PhotosRemarques.Add(pho);
                ctx.SaveChanges();
                statusLabel.Text = "Image Ajoutée.";
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}