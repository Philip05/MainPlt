using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterElements : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsPostBack)
            {
                //TypeElement
                List<TypesElement> type = ctx.TypesElements.ToList();
                type.Insert(0, new TypesElement { Id = -1, NomTypeElement = "Sélectionner un type..." });
                dropDownListTypeMachine.DataSource = type;
                dropDownListTypeMachine.DataValueField = "ID";
                dropDownListTypeMachine.DataTextField = "NomTypeElement";
                dropDownListTypeMachine.DataBind();

                //TypeEmplacement
                List<TypeEmplacement> typeEmp = ctx.TypeEmplacementSet.ToList();
                typeEmp.Insert(0, new TypeEmplacement { Id = -1, NomTypeEmplacement = "Sélectionner un type..." });
                dropDownListTypeEmplacement.DataSource = typeEmp;
                dropDownListTypeEmplacement.DataValueField = "ID";
                dropDownListTypeEmplacement.DataTextField = "NomTypeEmplacement";
                dropDownListTypeEmplacement.DataBind();

                AjouterAnneesDropDownList();
            }
            textBoxNomElement.Focus();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
    }

    private void UploadImages()
    {
        statusLabel.Text = string.Empty;
        if (fileUploadPhotoMachine.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(fileUploadPhotoMachine.FileName);
                fileUploadPhotoMachine.SaveAs(Server.MapPath("PhotosElements/") + filename);
                PhotosElement pho = new PhotosElement();
                Element ele = (from element in ctx.Elements
                               where element.NomElement == textBoxNomElement.Text && element.NumeroElement == textBoxNumero.Text && element.DescriptionElement == textBoxDescription.Text
                               select element).FirstOrDefault();
                pho.SourcePhotoElement = "PhotosElements/" + filename;
                pho.Elements = ele;
                ctx.PhotosElements.Add(pho);
                ctx.SaveChanges();
                statusLabel.Text = "Image Ajoutée.";
            }
            catch (Exception a)
            {
                Cmds.Debug(a, this, GetType());
            }
        }
    }
    private void AjouterAnneesDropDownList()
    {
        dropDownListAnneeMachine.Items.Add("");
        for (int i = 1950; i <= DateTime.Now.Year; i++)
        {
            dropDownListAnneeMachine.Items.Add(i.ToString());
        }
    }

    private void Enregistrer()
    {
        if (VerifierTextboxPleines() == false)
        {
            int typeElement = int.Parse(dropDownListTypeMachine.Text);
            int typeEmplacement = int.Parse(dropDownListTypeEmplacement.Text);
            string anneeElement = dropDownListAnneeMachine.Text;
            SqlConnection con = new SqlConnection(Cmds.connectionString);
            string query = "INSERT INTO Elements(NomElement,NumeroElement,typeEmplacements_Id, TypesElement_Id,DescriptionElement,NumeroSerieElement,AnneeElement) VALUES (@NomElement,@NumeroElement,@typeEmplacements_Id, @TypesElement_Id,@DescriptionElement,@NumeroSerieElement,@AnneeElement)";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
                cmd.Parameters.Add(new SqlParameter("@NomElement", textBoxNomElement.Text));
                cmd.Parameters.Add(new SqlParameter("@NumeroElement", textBoxNumero.Text));
                cmd.Parameters.Add(new SqlParameter("@typeEmplacements_Id", typeEmplacement));
                cmd.Parameters.Add(new SqlParameter("@TypesElement_Id", typeElement));
                if (dropDownListAnneeMachine.Text == "")
                {
                    cmd.Parameters.Add(new SqlParameter("@AnneeElement", DBNull.Value));
                }
                else if (dropDownListAnneeMachine.Text != "")
                {
                    int anneeElements = int.Parse(anneeElement);
                    cmd.Parameters.Add(new SqlParameter("@AnneeElement", anneeElements));
                }
                if (textBoxDescription.Text == "")
                {
                    cmd.Parameters.Add(new SqlParameter("@DescriptionElement", DBNull.Value));
                }
                else if (textBoxDescription.Text != "")
                {
                    cmd.Parameters.Add(new SqlParameter("@DescriptionElement", textBoxNomElement.Text));
                }
                if (textBoxNumeroSerieMachine.Text == "")
                {
                    cmd.Parameters.Add(new SqlParameter("@NumeroSerieElement", DBNull.Value));
                }
                else if (textBoxNumeroSerieMachine.Text != "")
                {
                    cmd.Parameters.Add(new SqlParameter("@NumeroSerieElement", textBoxNumeroSerieMachine.Text));
                }
                cmd.ExecuteNonQuery();
            }
            catch (Exception a)
            {
                Cmds.Debug(a, this, GetType());
            }
            con.Close();
            UploadImages();
            EffacerTextboxe();
            Cmds.Alerte("Insertion réussie", this, GetType());
        }
        else
        {
            Cmds.Alerte("Les champs 'Nom', '# Model', '# Série', 'Type de machine' et 'Emplacement' doivent être remplis.", this, GetType());
        }
    }

    private bool VerifierTextboxPleines()
    {
        bool reponse = false;
        if (textBoxNomElement.Text == "" || dropDownListTypeMachine.Text == "-1" || dropDownListTypeEmplacement.Text == "-1")
        {
            reponse = true;
        }
        return reponse;
    }

    private bool VerifierNumeroMachine(string numero)
    {
        bool reponse = false;
        IQueryable<Element> query = from ele in ctx.Elements where ele.NumeroElement == numero select ele;
        foreach (Element elem in query)
        {
            reponse = true;
        }
        return reponse;
    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        Enregistrer();
    }

    private void EffacerTextboxe()
    {
        textBoxNomElement.Text = string.Empty;
        textBoxNumeroSerieMachine.Text = string.Empty;
        textBoxDescription.Text = string.Empty;
        textBoxNumero.Text = string.Empty;
        dropDownListTypeMachine.SelectedIndex = dropDownListTypeMachine.Items.IndexOf(dropDownListTypeMachine.Items.FindByText("Sélectionner un type..."));
        dropDownListTypeEmplacement.SelectedIndex = dropDownListTypeEmplacement.Items.IndexOf(dropDownListTypeEmplacement.Items.FindByText("Sélectionner un type..."));
    }
}