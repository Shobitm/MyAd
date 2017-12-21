using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/profile/profile.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/profile/postreq.aspx");
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("/profile/default2.aspx");
    }
}