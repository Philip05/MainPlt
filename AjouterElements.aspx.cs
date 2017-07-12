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

    private bool VerifierTextboxPleines()
    {
        bool reponse = false;
        if(textBoxNumero.Text == "" || textBoxNomElement.Text == "" || textBoxDescription.Text == "" || dropDownListTypeMachine.Text == "-1" || dropDownListTypeEmplacement.Text == "-1")
        {
            reponse = true;
        }
        return reponse;
    }

    private bool VerifierNumeroMachine(string numero)
    {
        bool reponse = false;
        IQueryable<Element> query = from ele in ctx.Elements where ele.NumeroElement == numero select ele;
        foreach(Element elem in query)
        {
            reponse = true;
        }
        return reponse;
    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        if (VerifierNumeroMachine(textBoxNumero.Text) == false)
        {
            if (VerifierTextboxPleines() == false)
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

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }

    private void EffacerTextboxe()
    {
        textBoxNomElement.Text = string.Empty;
        textBoxDescription.Text = string.Empty;
        textBoxNumero.Text = string.Empty;
        dropDownListTypeMachine.SelectedIndex = dropDownListTypeMachine.Items.IndexOf(dropDownListTypeMachine.Items.FindByText("Sélectionner un type..."));
        dropDownListTypeEmplacement.SelectedIndex = dropDownListTypeEmplacement.Items.IndexOf(dropDownListTypeEmplacement.Items.FindByText("Sélectionner un type..."));
    }
}