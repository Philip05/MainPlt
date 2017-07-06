using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageAdministrateur : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void buttonAjouterUsager_Click(object sender, EventArgs e)
    {

    }

    public IQueryable gridViewListeUtilisateurs_GetData()
    {
        var query = from usager in ctx.Usagers
                    select new
                    {
                        usager.Id,
                        usager.Nom,
                        usager.Prenom,
                        usager.Administrateur,
                        usager.DateInscription,
                        usager.MotDePasse
                    };
        return query;
    }



    protected void gridViewListeUtilisateurs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int no = Convert.ToInt16(e.CommandArgument);
        if (e.CommandName == "Edit")
        {
            gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "black");
        }
    }

    protected void gridViewListeUtilisateurs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridViewListeUtilisateurs.Style.Add(HtmlTextWriterStyle.Color, "white");
    }
}