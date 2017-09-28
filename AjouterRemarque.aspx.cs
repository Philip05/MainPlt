using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        textBoxNom.Focus();
    }

    private void Labels()
    {
        try
        {
            labelResponsable.Text = "Responsable : " + Cmds.prenomUsagerConnecte + " " + Cmds.nomUsagerConnecte;
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private bool VerifierTextboxPleines()
    {
        bool reponse = false;
        if(textBoxNom.Text == "" || textBoxDescrition.Text == "")
        {
            reponse = true;
        }
        return reponse;
    }

    protected void buttonAjouterRemarque_Click(object sender, EventArgs e)
    {
        if (VerifierTextboxPleines() == false)
        {
            //if (Cmds.remarqueSansEntretien == false)
            //{
            Enregistrer();
            //}
            //else
            //{
            //    EnregistrerSansEntretien();
            //}
            Cmds.remarqueSansEntretien = false;
            Cmds.Alerte("Insertion réussie", this, GetType());
        }
        else
        {
            Cmds.Alerte("Toutes les zones de texte doivent être pleines.", this, GetType());
        }
    }

    //private void EnregistrerSansEntretien()
    //{
    //    Entretien ent = (from entretien in ctx.Entretiens
    //                     where entretien.TitreEntretien == "Remarque sans entretien"
    //                     select entretien).FirstOrDefault();
    //    Element ele = (from element in ctx.Elements
    //                   where element.Id == Cmds.idMachineSelectionne
    //                   select element).FirstOrDefault();
    //    EntretiensPrecedant entp = (from entprecedant in ctx.EntretiensPrecedants
    //                                where entprecedant.DescriptionEntretienPrecedant == "Remarque sans entretien"
    //                                select entprecedant).FirstOrDefault();
    //    Remarque rem = new Remarque();
    //    rem.DescriptionRemarque = textBoxDescrition.Text + "\n" + "***Remarque sans entretien***";
    //    rem.TitreRemarque = textBoxNom.Text;
    //    rem.Entretiens = ent;
    //    rem.Elements = ele;
    //    rem.EntretiensPrecedant = entp;
    //    ctx.Remarques.Add(rem);
    //    ctx.SaveChanges();
    //    UploadImages();
    //}

    private void Enregistrer()
    {
        AjouterLaRemarque();
        UploadImages();
    }

    private void AjouterLaRemarque()
    {
        DateTime date = DateTime.Today;
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "INSERT INTO Remarques(TitreRemarque,DescriptionRemarque,Entretiens_Id,Elements_Id,EntretiensPrecedant_Id,Afficher,DateProchainEntretien) VALUES (@TitreRemarque, @DescriptionRemarque,@Entretiens_Id,@Elements_Id,@EntretiensPrecedant_Id,@Afficher,@DateProchainEntretien)";
        int ele = (from element in ctx.Elements
                   where element.Id == Cmds.idMachineSelectionne
                   select element.Id).FirstOrDefault();

        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@TitreRemarque", textBoxNom.Text));
            cmd.Parameters.Add(new SqlParameter("@DescriptionRemarque", textBoxDescrition.Text + "\n" + "***Remarque sans entretien***"));
            cmd.Parameters.Add(new SqlParameter("@Entretiens_Id", DBNull.Value));
            cmd.Parameters.Add(new SqlParameter("@Elements_Id", ele));
            cmd.Parameters.Add(new SqlParameter("@EntretiensPrecedant_Id", DBNull.Value));
            if (checkBoxPressant.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Afficher", 1));
                cmd.Parameters.Add(new SqlParameter("@DateProchainEntretien", date.AddDays(-1)));
            }
            else if (checkBoxNonPressant.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Afficher", 2));
                cmd.Parameters.Add(new SqlParameter("@DateProchainEntretien", date.AddDays(10)));
            }
            else if (checkBoxNePasAfficher.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Afficher", 3));
                cmd.Parameters.Add(new SqlParameter("@DateProchainEntretien", date));
            }
            cmd.ExecuteNonQuery();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
        con.Close();
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
                    int id = ctx.Remarques.Max(u => (int)u.Id);
                    filename = Path.GetFileName(userPostedFile.FileName);
                    PhotosRemarque pho = new PhotosRemarque();
                    Remarque rem = (from remarque in ctx.Remarques
                                    where remarque.Id == id
                                    select remarque).FirstOrDefault();
                    pho.SourcePhotoRemarque = "PhotosRemarques/" + filename;
                    pho.Remarque = rem;
                    ctx.PhotosRemarques.Add(pho);
                    ctx.SaveChanges();

                    userPostedFile.SaveAs(Server.MapPath("PhotosRemarques/") + filename);
                    statusLabel.Text = "Images Ajoutées.";
                }
            }
            catch (Exception a)
            {
                Cmds.Debug(a, this, GetType());
            }
        }
    }

    protected void checkBoxPressant_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void checkBoxNonPressant_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void checkBoxNePasAfficher_CheckedChanged(object sender, EventArgs e)
    {

    }
}