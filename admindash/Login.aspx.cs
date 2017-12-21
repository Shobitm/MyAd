using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using admin;

public partial class admindash_Default8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void button1_OnClick(object sender, EventArgs e)
    {
        String u = u_name.Value;
        String p = p_word.Value;
        clsregister obj = new clsregister();
        clsregistrationprp objprp = new clsregistrationprp();
        objprp.email = u;
        objprp.password = p;
        Int32 a = obj.logincheck(objprp);
        if (a == -1)
        {
            Label1.Text = "Email ID/Password combination incorrect.";

        }
        else
        {
            Session["codad"] = a;

            Response.Redirect("Requests.aspx");
        }
    }


}