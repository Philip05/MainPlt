using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Outlook = Microsoft.Office.Interop.Outlook;
using System.Net;

public partial class CentreDeControl : System.Web.UI.Page
{
    private MainPltModelContainer ctx = new MainPltModelContainer();
    protected void Page_Load(object sender, EventArgs e)
    {
        Commentaires();
    }

    private void Commentaires()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = "SELECT * FROM Messages ORDER BY Date DESC";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader Reader;
        try
        {
            con.Open();
            Reader = cmd.ExecuteReader();
            while (Reader.Read())
            {
                System.Web.UI.HtmlControls.HtmlGenericControl createDiv = new System.Web.UI.HtmlControls.HtmlGenericControl();
                createDiv.Attributes.Add("class", "row col-lg-offset-1 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 col-lg-8 col-md-8 col-sm-12 col-xs-12");
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
                createDiv.Controls.Add(date);
                createDiv.Controls.Add(comm);
                divCommentaires.Controls.Add(createDiv);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
    }

    protected void buttonAjouterUnCommentaire_Click(object sender, EventArgs e)
    {
        AjouterLeCommentaire();
        Response.Redirect(Request.RawUrl);
    }

    //private void EnvoyerEmail(string message)
    //{
    //    try
    //    {
    //        Outlook.Application outlookApp = new Outlook.Application();
    //        Outlook.MailItem mailItem = (Outlook.MailItem)outlookApp.CreateItem(Outlook.OlItemType.olMailItem);
    //        mailItem.To = "philipdrouin5@hotmail.com";
    //        mailItem.Subject = "Nouveau message sur MainPlt";
    //        mailItem.Body = message + "\n" + Cmds.nomUsagerConnecte + " " + Cmds.prenomUsagerConnecte;
    //        mailItem.Importance = Outlook.OlImportance.olImportanceNormal;
    //        ((Outlook.MailItem)mailItem).Send();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    //private void SendMessage(string body)
    //{
    //    MailMessage message = new MailMessage("drouin.philip@carrefour.cegepvicto.ca", "drouin.philip@carrefour.cegepvicto.ca");
    //    message.Subject = "Nouveau message sur MainPlt";
    //    message.Body = body;
    //    using (SmtpClient mailer = new SmtpClient("smtp.gmail.com", 587))
    //    {
    //        NetworkCredential user = new NetworkCredential("drouin.philip@carrefour.cegepvicto.ca", "password");
    //        mailer.Credentials = user;
    //        mailer.EnableSsl = true;
    //        mailer.Send(message);
    //    }
    //}

    private void AjouterLeCommentaire()
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=MainPltDataBase;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        string query = "INSERT INTO Messages(Commentaires, Date) VALUES (@Commentaire, @Date)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            cmd.Parameters.Add(new SqlParameter("@Commentaire", textBoxAjouterCommentaire.Text));
            cmd.Parameters.Add(new SqlParameter("@Date", DateTime.Now.ToString()));
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
        //SendMessage(textBoxAjouterCommentaire.Text);
        //EnvoyerEmail(textBoxAjouterCommentaire.Text);
    }
}