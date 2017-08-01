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
        }
        AjouterAnneesDropDownList();
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
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
    private void AjouterAnneesDropDownList()
    {
        for (int i = 1950; i <= DateTime.Now.Year; i++)
        {
            dropDownListAnneeMachine.Items.Add(i.ToString());
        }
    }

    private void Enregistrer()
    {
        if (VerifierNumeroMachine(textBoxNumero.Text) == false)
        {
            if (VerifierTextboxPleines() == false)
            {
                int typeElement = int.Parse(dropDownListTypeMachine.Text);
                int typeEmplacement = int.Parse(dropDownListTypeEmplacement.Text);
                string anneeElement = dropDownListAnneeMachine.Text;
                int anneeElements = int.Parse(anneeElement);
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
                string query = "INSERT INTO Elements(NomElement,NumeroElement,typeEmplacements_Id, TypesElement_Id,DescriptionElement,NumeroSerieElement,AnneeElement) VALUES (@NomElement,@NumeroElement,@typeEmplacements_Id, @TypesElement_Id,@DescriptionElement,@NumeroSerieElement,@AnneeElement)";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                try
                {
                    cmd.Parameters.Add(new SqlParameter("@NomElement", textBoxNomElement.Text));
                    cmd.Parameters.Add(new SqlParameter("@NumeroElement", textBoxNumero.Text));
                    cmd.Parameters.Add(new SqlParameter("@typeEmplacements_Id", typeEmplacement));
                    cmd.Parameters.Add(new SqlParameter("@TypesElement_Id", typeElement));
                    cmd.Parameters.Add(new SqlParameter("@DescriptionElement", textBoxNomElement.Text));
                    cmd.Parameters.Add(new SqlParameter("@NumeroSerieElement", textBoxNumeroSerieMachine.Text));
                    cmd.Parameters.Add(new SqlParameter("@AnneeElement", anneeElements));
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                con.Close();
                UploadImages();
                EffacerTextboxe();
                Cmds.Alerte("Insertion réussie", this, GetType());
            }
            else
            {
                Cmds.Alerte("Toutes les zones de texte doivent être remplies.", this, GetType());
            }
        }
        else
        {
            Cmds.Alerte("Ce numéro de machine existe déjà.", this, GetType());
            textBoxNumero.Text = string.Empty;
        }
    }

    private bool VerifierTextboxPleines()
    {
        bool reponse = false;
        if (textBoxNumero.Text == "" || textBoxNomElement.Text == "" || textBoxDescription.Text == "" || dropDownListTypeMachine.Text == "-1" || dropDownListTypeEmplacement.Text == "-1")
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