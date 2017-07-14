using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterProduit : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        InitialiserBoutonDeconnexion();
        if (!Page.IsPostBack)
        {
            //TypeElement
            List<TypesProduit> type = ctx.TypesProduits.ToList();
            type.Insert(0, new TypesProduit { Id = -1, NomTypeProduit = "Sélectionner un type..." });
            dropDownListTypeProduit.DataSource = type;
            dropDownListTypeProduit.DataValueField = "ID";
            dropDownListTypeProduit.DataTextField = "NomTypeProduit";
            dropDownListTypeProduit.DataBind();
        }
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
            if (Cmds.admin == true)
            {
                liAdministrateur.Visible = true;
            }
            else
            {
                liAdministrateur.Visible = false;
            }
        }
    }

    private bool VerifierTextboxPleines()
    {
        bool reponse = false;
        if (textBoxNomProduit.Text == "" || textBoxDescriptionProduit.Text == "" || dropDownListTypeProduit.Text == "-1")
        {
            reponse = true;
        }
        return reponse;
    }

    protected void buttonEnregistrer_Click(object sender, EventArgs e)
    {
        if (VerifierTextboxPleines() == false)
        {
            int type = int.Parse(dropDownListTypeProduit.Text);
            TypesProduit ty = (from t in ctx.TypesProduits where t.Id == type select t).FirstOrDefault();
            Produit pro = new Produit();
            pro.NomProduit = textBoxNomProduit.Text;
            pro.DescriptionProduit = textBoxDescriptionProduit.Text;
            pro.TypesProduit = ty;
            ctx.Produits.Add(pro);
            ctx.SaveChanges();
            UploadImages();
            ViderTextbox();
        }
        else
        {
            Cmds.Alerte("Toutes les zones de texte doivent être pleines.", this, GetType());
        }
    }

    private void UploadImages()
    {
        statusLabel.Text = string.Empty;
        if (fileUploadPhotoProduit.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(fileUploadPhotoProduit.FileName);
                fileUploadPhotoProduit.SaveAs(Server.MapPath("PhotosProduits/") + filename);
                PhotosProduit pho = new PhotosProduit();
                Produit produit = (from pro in ctx.Produits
                                   where pro.NomProduit == textBoxNomProduit.Text && pro.DescriptionProduit == textBoxDescriptionProduit.Text
                                   select pro).FirstOrDefault();
                pho.SourcePhotoProduit = "PhotosProduits/" + filename;
                pho.Produit = produit;
                ctx.PhotosProduits.Add(pho);
                ctx.SaveChanges();
                statusLabel.Text = "Image Ajoutée.";
                Cmds.Alerte("Insertion réussie", this, GetType());
            }
            catch (Exception ex)
            {
                statusLabel.Text = "Upload status (image): The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }

    private void ViderTextbox()
    {
        textBoxDescriptionProduit.Text = string.Empty;
        textBoxNomProduit.Text = string.Empty;
        dropDownListTypeProduit.SelectedIndex = dropDownListTypeProduit.Items.IndexOf(dropDownListTypeProduit.Items.FindByText("Selectionner un type..."));
    }

    protected void buttonDeconnexionNavbar_Click(object sender, EventArgs e)
    {
        Cmds.Deconnexion();
        Response.Redirect("PageAccueilConnexion.aspx");
    }
}