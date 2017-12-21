using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
        string v = Request.QueryString["s"];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE register SET acc_stat = 'Active' WHERE guid = '" + v + "'";
            //    cmd.CommandText = "UPDATE register SET guid = NULL WHERE guid = '" + v + "'";
            if (cmd.ExecuteNonQuery() != 0)
            {
                Label1.Visible = true;
                Label1.Text = "Your Account has been Verified.";
                v = string.Empty;
                string page = Request.Url.Segments[Request.Url.Segments.Length - 1];
                HtmlMeta keywords = new HtmlMeta();
                keywords.HttpEquiv = "Refresh";
                keywords.Content = ("1;url=/login.aspx").ToString();
                this.Page.Header.Controls.Add(keywords);
                con.Close();
            }
            else
            {
                con.Close();
                Label2.Visible = true;
                Label2.Text = "Wrong verification page!!";
            }
        }
        catch (Exception exp)
        {
            Label2.Visible = true;
            Label2.Text = "ERROR in webpage! ";
        }
    }
}