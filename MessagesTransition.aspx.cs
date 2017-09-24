using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessagesTransition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Messages();
    }

    protected void buttonAjouterUnMessage_Click(object sender, EventArgs e)
    {
        AjouterLeMessage();
        Response.Redirect(Request.RawUrl);
    }

    private void Messages()
    {
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "SELECT * FROM MessagesTransition ORDER BY DateMessage DESC";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader Reader;
        try
        {
            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl();
                createDiv.Attributes.Add("class", "row col-lg-offset-1 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 col-lg-10 col-md-11 col-sm-12 col-xs-12");
                createDiv.Style.Add(HtmlTextWriterStyle.MarginTop, "50px");
                Label date = new Label();
                date.Text = Reader.GetValue(2).ToString();
                date.Style.Add(HtmlTextWriterStyle.Color, "black");
                date.Style.Add(HtmlTextWriterStyle.FontSize, "20px");
                TextBox comm = new TextBox();
                comm.ReadOnly = true;
                comm.TextMode = TextBoxMode.MultiLine;
                comm.Text = Reader.GetValue(1).ToString();
                comm.CssClass = "form-control";
                comm.Style.Add(HtmlTextWriterStyle.Height, "90px");
                createDiv.Controls.Add(date);
                createDiv.Controls.Add(comm);
                divCommentaires.Controls.Add(createDiv);
            }
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
        con.Close();
    }

    private void AjouterLeMessage()
    {
        SqlConnection con = new SqlConnection(Cmds.connectionString);
        string query = "INSERT INTO MessagesTransition(Message,DateMessage,NomEmploye,PrenomEmploye) VALUES (@Message, @DateMessage,@NomEmploye,@PrenomEmploye)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@Message", textBoxAjouterMessage.Text));
            cmd.Parameters.Add(new SqlParameter("@DateMessage", DateTime.Now.ToString()));
            cmd.Parameters.Add(new SqlParameter("@NomEmploye", Cmds.nomUsagerConnecte));
            cmd.Parameters.Add(new SqlParameter("@PrenomEmploye", Cmds.prenomUsagerConnecte));
            cmd.ExecuteNonQuery();
        }
        catch (Exception a)
        {
            Cmds.Debug(a, this, GetType());
        }
        con.Close();
    }
}