﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterEntretienPrecedant : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    private DateTime date;
    private int recurrence;
    private bool ajouterRemarque;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                textBoxDescriptionAjouterEntretien.Focus();
                divRemarque.Visible = false;
                ajouterRemarque = false;
                Cmds.isCheck = false;
            }
            InitialiserLesLabels();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
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
    }

    private void SetValue()
    {
        try
        {
            int ele = (from element in ctx.Elements
                       where element.Id == Cmds.idMachineSelectionneEntretienPrecedant
                       select element.Id).FirstOrDefault();
            int ent = (from entretien in ctx.Entretiens
                       where entretien.Id == Cmds.idEntretienSelectionneEntretienPrecedant
                       select entretien.Id).FirstOrDefault();
            Cmds.idEntretienPrecedantAjoute = ctx.EntretiensPrecedants.Max(u => (int)u.Id);
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void ModifierDateProchainEntretien()
    {
        try
        {
            var ent = ctx.Entretiens.Where(s => s.Id == Cmds.idEntretienSelectionneEntretienPrecedant).First();
            ent.DateProchainEntretien = DateTime.Now.AddDays(recurrence);
            ctx.SaveChanges();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
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
            SetValue();
            if (Cmds.isCheck == true)
            {
                EnregistrerRemarque();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Insertion réussie');", true);
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private bool VerifierTextboxPleines()
    {
        bool reponse = true;
        if ((textBoxNom.Text == "" || textBoxDescrition.Text == "") || checkBoxNonPressant.Checked == false && checkBoxPressant.Checked == false && checkBoxNePasAfficher.Checked == false)
        {
            reponse = false;
        }
        return reponse;
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

    private void EnregistrerRemarque()
    {
        try
        {
            if (VerifierTextboxPleines() == true)
            {

                AjouterRemarque();
                UploadImages();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Insertion réussie');", true);
            }
            else
            {
                Cmds.Alerte("Vous devez compléter tous les champs.", this, GetType());
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void AjouterRemarque()
    {
        DateTime date = DateTime.Today;
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "INSERT INTO Remarques(TitreRemarque,DescriptionRemarque,Entretiens_Id,Elements_Id,EntretiensPrecedant_Id,Afficher,DateProchainEntretien) VALUES (@TitreRemarque, @DescriptionRemarque,@Entretiens_Id,@Elements_Id,@EntretiensPrecedant_Id,@Afficher,@DateProchainEntretien)";
        int ent = (from entretien in ctx.Entretiens
                   where entretien.Id == Cmds.idEntretienSelectionneEntretienPrecedant
                   select entretien.Id).FirstOrDefault();
        int ele = (from element in ctx.Elements
                   where element.Id == Cmds.idMachineSelectionneEntretienPrecedant
                   select element.Id).FirstOrDefault();
        int entp = (from entprecedant in ctx.EntretiensPrecedants
                    where entprecedant.Id == Cmds.idEntretienPrecedantAjoute
                    select entprecedant.Id).FirstOrDefault();
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@TitreRemarque", textBoxNom.Text));
            cmd.Parameters.Add(new SqlParameter("@DescriptionRemarque", textBoxDescrition.Text));
            cmd.Parameters.Add(new SqlParameter("@Entretiens_Id", ent));
            cmd.Parameters.Add(new SqlParameter("@Elements_Id", ele));
            cmd.Parameters.Add(new SqlParameter("@EntretiensPrecedant_Id", entp));
            if (checkBoxPressant.Checked == true)
            {
                cmd.Parameters.Add(new SqlParameter("@Afficher", 1));
                cmd.Parameters.Add(new SqlParameter("@DateProchainEntretien",date.AddDays(-1)));
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
            catch (Exception a)
            {
                Cmds.Debug(a, this, GetType());
            }
        }
    }

    protected void buttonAjouterRemarqueEntretien_CheckedChanged(object sender, EventArgs e)
    {
        if (Cmds.isCheck == false)
        {
            Cmds.isCheck = true;
            divRemarque.Visible = true;
            buttonAjouterRemarqueEntretien.Text = "Décochez si vous ne désirez plus ajouter une remarque à cet entretien";
        }
        else
        {
            Cmds.isCheck = false;
            divRemarque.Visible = false;
            buttonAjouterRemarqueEntretien.Text = "Cochez si vous désirez ajouter une remarque à cet entretien";
        }
    }

    protected void checkBoxPressant_CheckedChanged(object sender, EventArgs e)
    {
        checkBoxNonPressant.Checked = false;
        checkBoxNePasAfficher.Checked = false;
    }

    protected void checkBoxNonPressant_CheckedChanged(object sender, EventArgs e)
    {
        checkBoxNePasAfficher.Checked = false;
        checkBoxPressant.Checked = false;
    }

    protected void checkBoxNePasAfficher_CheckedChanged(object sender, EventArgs e)
    {
        checkBoxPressant.Checked = false;
        checkBoxNonPressant.Checked = false;
    }
}