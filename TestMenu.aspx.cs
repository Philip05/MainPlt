﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class TestMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DataTable dt = this.GetData(0);
            PopulateMenu(dt, 0, null);
        }
    }

    private DataTable GetData(int parentMenuId)
    {
        string query = "SELECT [Id], [NomElement], [DescriptionElement] FROM [Elements]";
        string constr = Cmds.connectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Parameters.AddWithValue("@ParentMenuId", parentMenuId);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    private void AddButton()
    {
        
    }

    private void PopulateMenu(DataTable dt, int parentMenuId, MenuItem parentMenuItem)
    {
        string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
        foreach (DataRow row in dt.Rows)
        {
            MenuItem menuItem = new MenuItem
            {
                Value = row["Id"].ToString(),
                Text = row["NomElement"].ToString(),
                NavigateUrl = "Accueil.aspx".ToString(),
                Selected = "www.google.com".ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase)
            };
            if (parentMenuId == 0)
            {
                Menu1.Items.Add(menuItem);
                DataTable dtChild = GetData(int.Parse(menuItem.Value));
                PopulateMenu(dtChild, int.Parse(menuItem.Value), menuItem);
            }
            else
            {
                parentMenuItem.ChildItems.Add(menuItem);
            }
        }
        LinkButton b = new LinkButton();
        b.Style.Add(HtmlTextWriterStyle.Color, "blue");
        b.Text = "sdmckwdncubewcnw";
        Menu1.Controls.Add(b);
    }
}