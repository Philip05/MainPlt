using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageAccueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
        new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
        createDiv.ID = "divNotifications";
        createDiv.InnerHtml = " I'm a div, from code behind ";
        this.Controls.Add(createDiv);
    }
}