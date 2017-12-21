using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    String v;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Visible = false;
        Label4.Visible = false;
        v = Request.QueryString["s"];
    }

    void getdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);

        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE register SET password = '" + TextBox1.Text + "' WHERE guid = '" + v + "'"; /*Response.Redirect("login.aspx");*/
            if (cmd.ExecuteNonQuery() != 0)
            {
                cmd.CommandText = "UPDATE register SET guid = 'NULL' WHERE guid = '" + v + "'"; /*Response.Redirect("login.aspx");*/
                cmd.ExecuteNonQuery();
                Label3.Visible = true;
                Label3.Text = "Your Account's Password Has Been Changed.";
                string page = Request.Url.Segments[Request.Url.Segments.Length - 1];
                HtmlMeta keywords = new HtmlMeta();
                keywords.HttpEquiv = "Refresh";
                keywords.Content = ("1;url=/login.aspx").ToString();
                this.Page.Header.Controls.Add(keywords);
            }

        }
        catch (Exception exp)

        {
            Label4.Visible = true;
            Label4.Text = "ERROR in webpage! " + exp;
        }
        finally
        {
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        getdata();



    }
}