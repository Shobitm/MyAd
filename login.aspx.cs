using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using myad;

public partial class preview_dotnet_templates_akshara_multi_master_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        if (Page.IsPostBack == false)
        {
            if (Request.Cookies["email"] != null && Request.Cookies["password"] != null)
            {
                username.Text = Request.Cookies["email"].Value;
                password.Attributes["value"] = Request.Cookies["password"].Value;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        clsregister obj = new clsregister();
        clsregistrationprp objprp = new clsregistrationprp();
        objprp.email = username.Text;
        objprp.password = password.Text;
        Int32 a = obj.logincheck(objprp);
        if (a == -1)
        {
            Label1.Visible = true;
            Label1.Text = "Invalid Email Id or Password";

        }
        else if (a == -2)
        {
            Label1.Visible = true;
            Label1.Text = "Your account is Blocked";

        }
        else if (a == -3)
        {
            Label1.Visible = true;
            Label1.Text = "Your account is not Verified";

        }
        else
        {
            Session["cod"] = a;
            Response.Redirect("profile/indexprofile.aspx");
        }

    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            Response.Cookies["email"].Expires = DateTime.Now.AddDays(30);
            Response.Cookies["password"].Expires = DateTime.Now.AddDays(30);
        }
        else
        {
            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);

        }
        Response.Cookies["email"].Value = username.Text.Trim();
        Response.Cookies["password"].Value = password.Text.Trim();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/forget.aspx");
    }
}