﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterProcedure : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        Enregistrer();
    }

    private void Enregistrer()
    {
        if (fileUploadProcedure.HasFile)
        {
            try
            {
                statusLabel.Text = string.Empty;
                string filename = Path.GetFileName(fileUploadProcedure.FileName);
                string source = "FichiersPDFSProcedures/" + filename;
                fileUploadProcedure.SaveAs(Server.MapPath("FichiersPDFSProcedures/") + filename);
                Element ele = (from eleme in ctx.Elements
                               where eleme.Id == Cmds.idMachineSelectionne
                               select eleme).FirstOrDefault();
                TypesElement element = (from empl in ctx.Elements where empl.Id == Cmds.idMachineSelectionne select empl.TypesElement).FirstOrDefault();
                TypeEmplacement emp = (from empla in ctx.Elements where empla.Id == Cmds.idMachineSelectionne select empla.TypeEmplacements).FirstOrDefault();
                Procedure pro = new Procedure();
                pro.NomProcedure = textBoxNomProcedure.Text;
                pro.DescriptionProcedure = textBoxDescription.Text;
                pro.SourceProcedure = source;
                pro.TypesMachines = element;
                pro.TypeEmplacement = emp;
                ctx.Procedures.Add(pro);
                ctx.SaveChanges();
                Procedure pro1 = (from proc in ctx.Procedures where proc.SourceProcedure == source && proc.DescriptionProcedure == textBoxDescription.Text select proc).FirstOrDefault();
                ElementProcedure elep = new ElementProcedure();
                elep.Elements = ele;
                elep.Procedure = pro1;
                ctx.ElementProcedures.Add(elep);
                ctx.SaveChanges();
                statusLabel.Text = "Fichier ajouté.";
                EffacerTextbox();
                Cmds.Alerte("Procédure enregistrée.", this, GetType());
               
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }

    private void EffacerTextbox()
    {
        textBoxDescription.Text = string.Empty;
        textBoxNomProcedure.Text = string.Empty;
        statusLabel.Text = string.Empty;
        fileUploadProcedure.Dispose();
    }
}