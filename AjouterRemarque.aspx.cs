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
        InitialiserBoutonDeconnexion();
    }

    private void InitialiserBoutonDeconnexion()
    {
        if (Cmds.nomUsagerConnecte == null && Cmds.prenomUsagerConnecte == null && Cmds.usagerConnecte == false)
        {
            Response.Redirect("PageAccueilConnexion.aspx");
        }
        else
        {
            //Hide li ou block au lieu de none pour afficher.
            //Initialise le label permettant de voir qui est connecté lorsque la souris est placée au-dessus du glyphicon deconnexion de la navbar.
            labelNomUtilisateurConnecte.Text = Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
            liAdministrateur.Style.Add("display", "block");
            labelNomUtilisateurConnecte.ForeColor = System.Drawing.Color.Black;
            labelNomUtilisateurConnecte.Font.Name = "Times New Roman";
        }
    }

    private void Labels()
    {
        labelResponsable.Text = "Responsable : " + Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
    }

    protected void buttonAjouterRemarque_Click(object sender, EventArgs e)
    {
        Enregistrer();
        Cmds.Alerte("Insertion réussie", this, GetType());
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
        string filename = "";
        HttpFileCollection uploadedFiles = Request.Files;
        statusLabel.Text = string.Empty;

        for (int i = 0; i < uploadedFiles.Count; i++)
        {
            HttpPostedFile userPostedFile = uploadedFiles[i];

            try
            {
                if (userPostedFile.ContentLength > 0)
                {
                    filename = Path.GetFileName(userPostedFile.FileName);
                    PhotosRemarque pho = new PhotosRemarque();
                    Remarque rem = (from remarque in ctx.Remarques
                                    where remarque.DescriptionRemarque == textBoxDescrition.Text && remarque.TitreRemarque == textBoxNom.Text
                                    select remarque).FirstOrDefault();
                    pho.SourcePhotoRemarque = "PhotosRemarques/" + filename;
                    pho.Remarque = rem;
                    ctx.PhotosRemarques.Add(pho);
                    ctx.SaveChanges();

                    userPostedFile.SaveAs(Server.MapPath("PhotosRemarques/") + filename);
                    statusLabel.Text = "Images Ajoutées.";
                }
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }

    private void Test()
    {
       
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }
}