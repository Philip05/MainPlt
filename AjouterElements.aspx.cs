using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjouterElements : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            List<TypesElement> type = ctx.TypesElements.ToList();
            type.Insert(0, new TypesElement { Id = -1, NomTypeElement = "Sélectionner un type..." });
            dropDownListTypeMachine.DataSource = type;
            dropDownListTypeMachine.DataValueField = "ID";
            dropDownListTypeMachine.DataTextField = "NomTypeElement";
            dropDownListTypeMachine.DataBind();
        }
    }
}