using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Procedures : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void AjouterLesProcedures()
    {
        panelProcedures.Style.Add(HtmlTextWriterStyle.MarginLeft, "0px");
        panelProcedures.Style.Add(HtmlTextWriterStyle.MarginRight, "100px");
        for (int i = 0; i < 20; i++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl createDiv =
            new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            createDiv.ID = "divNotifications" + i.ToString();
            createDiv.Style.Add(HtmlTextWriterStyle.Height, "100px");
            createDiv.Style.Add(HtmlTextWriterStyle.Width, "100px");
            Button test = new Button();
            test.Text = "hdhwedg";
            if (i % 2 == 0)
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "gray");
            }
            else
            {
                createDiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, "white");
            }
            createDiv.Style.Add(HtmlTextWriterStyle.PaddingRight, "50px");
            createDiv.Controls.Add(test);
            panelProcedures.Controls.Add(createDiv);
        }
    }
}