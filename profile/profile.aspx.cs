using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using myad;
public partial class profile_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        txtf_name.Focus();
        if (Page.IsPostBack == false)
        {
            clsregister obj = new clsregister();
            List<clsregistrationprp> k = obj.find_rec(Convert.ToInt32(Session["cod"]));
            if (k.Count > 0)
            {
                ViewState["regid"] = k[0].regid;
                txtf_name.Text = k[0].f_name;
                txtl_name.Text = k[0].l_name;
                contact.Text = k[0].contact;
                txtaddress.Text = k[0].address;
                txtemail.Text = k[0].email;
                txtpassword.Text = k[0].password;
                //Button1.Text = "update";
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        clsregister obj = new clsregister();
        clsregistrationprp objprp = new clsregistrationprp();

        objprp.regid = Convert.ToInt32(Session["cod"]);
        objprp.f_name = txtf_name.Text;
        objprp.l_name = txtl_name.Text;
        objprp.contact = contact.Text;
        objprp.address = txtaddress.Text;
        objprp.email = txtemail.Text;
        objprp.password = txtpassword.Text;
        obj.update_rec(objprp);
        Label1.Visible = true;
        Label1.Text = "Changes have been updated.";


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        txtf_name.Text = string.Empty;
        txtl_name.Text = string.Empty;

        contact.Text = string.Empty;
        txtaddress.Text = string.Empty;
        txtpassword.Text = string.Empty;
    }
}