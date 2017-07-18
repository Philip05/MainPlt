using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntretienSelectionne : System.Web.UI.Page
{
    private bool rechercher;
    private bool rechercherProduits;
    private int idEntretienSelectionne;
    MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        rechercher = false;
        rechercherProduits = false;
        if (!Page.IsPostBack)
        {
            textBoxDescriptionEntretien.ReadOnly = true;
            textBoxReccurence.ReadOnly = true;
        }
    }

    public IQueryable GridViewListeProduitsEntretien_GetData()
    {
        if (Cmds.commandeEntretien == Cmds.CommandeEntretien.selectionnerLesEntretiensMachine)
        {
            if (rechercher == false)
            {
                var query = from ent in ctx.Entretiens
                            where ent.Element.Id == Cmds.idMachineSelectionne
                            select new
                            {
                                ent.Id,
                                ent.TitreEntretien,
                                ent.Recurrence,
                                ent.DateProchainEntretien
                            };
                return query;
            }
            else
            {
                var query1 = from ent in ctx.Entretiens
                             where ent.Element.Id == Cmds.idMachineSelectionne && ent.TitreEntretien.Contains(textBoxRechercherEntretienMachine.Text)
                             select new
                             {
                                 ent.Id,
                                 ent.TitreEntretien,
                                 ent.Recurrence,
                                 ent.DateProchainEntretien
                             };
                rechercher = false;
                return query1;
            }
        }
        else
        {
            if (rechercher == false)
            {
                var query = from ent in ctx.Entretiens
                            select new
                            {
                                ent.Id,
                                ent.TitreEntretien,
                                ent.Recurrence,
                                ent.DateProchainEntretien
                            };
                return query;
            }
            else
            {
                var query1 = from ent in ctx.Entretiens
                             where ent.Element.Id == Cmds.idMachineSelectionne && ent.TitreEntretien.Contains(textBoxRechercherEntretienMachine.Text)
                             select new
                             {
                                 ent.Id,
                                 ent.TitreEntretien,
                                 ent.Recurrence,
                                 ent.DateProchainEntretien
                             };
                rechercher = false;
                return query1;
            }
        }
    }

    // Le nom du paramètre id doit correspondre à la valeur DataKeyNames définie sur le contrôle
    public void GridViewListeProduitsEntretien_UpdateItem(int id)
    {
        Entretien entretienMachine = null;
        entretienMachine = ctx.Entretiens.Find(id);
        if (entretienMachine == null)
        {
            ModelState.AddModelError("",
                String.Format("Le produit # {0} n'existe pas", id));
        }
        else
        {
            TryUpdateModel(entretienMachine);
            if (ModelState.IsValid)
            {
                ctx.SaveChanges();
            }
        }
    }

    protected void dropDownListEntretiensMachine_SelectedIndexChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewListeProduitsEntretien.DataBind();
    }

    protected void GridViewListeProduitsEntretien_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int no = Convert.ToInt16(e.CommandArgument);
            int id = Convert.ToInt32(GridViewListeProduitsEntretien.Rows[no].Cells[2].Text);
            string desc = (from ent in ctx.Entretiens
                           where ent.Id == id
                           select ent.DescriptionEntretien).FirstOrDefault();
            labelTitreNomEntretien.Text = "Nom de l'entretien : " + GridViewListeProduitsEntretien.Rows[no].Cells[3].Text;
            textBoxDescriptionEntretien.Text = desc;
            textBoxReccurence.Text = GridViewListeProduitsEntretien.Rows[no].Cells[4].Text + " jours";
            DateTime date = Convert.ToDateTime(GridViewListeProduitsEntretien.Rows[no].Cells[5].Text);
            labelDateProchainEntretien1.Text = "Prochain entretien dû pour le " + date.ToString("yyyy-MM-dd");
            rechercherProduits = true;
            idEntretienSelectionne = Convert.ToInt32(GridViewListeProduitsEntretien.Rows[no].Cells[2].Text);
            GridViewProduitsEntretien.DataBind();
        }
    }

    protected void textBoxRechercherEntretienMachine_TextChanged(object sender, EventArgs e)
    {
        rechercher = true;
        GridViewListeProduitsEntretien.DataBind();
    }

    public IQueryable GridViewProduitsEntretien_GetData()
    {
        if (rechercherProduits == false)
        {
            return null;
        }
        else
        {
            var query = from ent in ctx.EntretiensProduits
                        join ma in ctx.Entretiens on ent.Entretien.Id equals ma.Id
                        join pro in ctx.Produits on ent.Produit.Id equals pro.Id
                        where ent.Entretien.Id == idEntretienSelectionne
                        select new
                        {
                            ent.Id,
                            ma.TitreEntretien,
                            pro.NomProduit
                        };
            return query;
        }
    }
}