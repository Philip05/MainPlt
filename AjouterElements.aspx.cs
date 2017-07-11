using System;
using System.Collections.Generic;
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

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        int typeElement = int.Parse(dropDownListTypeMachine.Text);
        int typeEmplacement = int.Parse(dropDownListTypeEmplacement.Text);
        TypesElement typeele = (from type in ctx.TypesElements where type.Id == typeElement select type).FirstOrDefault();
        TypeEmplacement emp = (from emplacement in ctx.TypeEmplacementSet where emplacement.Id == typeEmplacement select emplacement).FirstOrDefault();
        Element ele = new Element();
        ele.DescriptionElement = textBoxDescription.Text;
        ele.NomElement = textBoxNomElement.Text;
        ele.NumeroElement = textBoxNumero.Text;
        ele.TypesElement = typeele;
        ele.TypeEmplacements = emp;
        ctx.Elements.Add(ele);
        ctx.SaveChanges();
        UploadImages();
        Cmds.Alerte("Insertion réussie", this, GetType());
    }
}