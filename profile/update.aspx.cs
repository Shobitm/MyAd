using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Diagnostics;
using myad;

public partial class profile_Default : System.Web.UI.Page
{
    public void getvaljj()
    {
        string email,fname;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);

        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "SELECT email FROM register WHERE regid ='" + Session["cod"] + "';";
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            email = Convert.ToString(reader["email"]);
            reader.Close();
            cmd.CommandText = "SELECT f_name FROM register WHERE regid ='" + Session["cod"] + "';";
            reader = cmd.ExecuteReader();
            reader.Read();
            fname = Convert.ToString(reader["f_name"]);
            reader.Close();
            SendMail(email,fname);
        }
        catch (Exception exp)
        {
            Debug.Write(exp);
        }
        finally
        {
            con.Close();
        }
    }
    public void SendMail(string umail,string fname)
    {

        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "Update Requested";
        mailMessage.Body = "Hello "+fname+",\nWe have received your request to made some changes to the AD project.";
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        title.Focus();
        if (Page.IsPostBack == false)
        {
            clsdetfrm obj = new clsdetfrm();
            List<clsdetfrmprp> k = obj.find_rec_detfrm(Convert.ToInt32(Session["frmcod"]));
            if (k.Count > 0)
            {
                ViewState["frmcod"] = k[0].frmcod;
                ViewState["regcod"] = k[0].frmregcod;
                title.Text = k[0].frmtit;
                rtd.Text = Convert.ToString(k[0].frmdate.ToShortDateString());
                urls.Text = k[0].frmurl;
                requirements.Text = k[0].frmdesc;
                DropDownList1.Text = k[0].frmreqcont;
                Button1.Text = "update";
            }
        }
    }

    private void button_clear()
    {
        title.Text = string.Empty;
        rtd.Text = string.Empty;
        urls.Text = string.Empty;
        requirements.Text = string.Empty;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (rtd.Text != string.Empty)
            Calendar1.SelectedDate = Convert.ToDateTime(rtd.Text);

        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        rtd.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void rtd_TextChanged(object sender, EventArgs e)
    {
        Calendar1.SelectedDate = Convert.ToDateTime(rtd.Text);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        clsdetfrm obj = new clsdetfrm();
        clsdetfrmprp objprp = new clsdetfrmprp();
        objprp.frmtit = title.Text;
        objprp.frmcod = Convert.ToInt32(Session["frmcod"]);
        objprp.frmdate = Convert.ToDateTime(rtd.Text);
        objprp.frmurl = urls.Text;
        objprp.frmdesc = requirements.Text;
        objprp.frmreqcont = DropDownList1.SelectedValue.ToString();
        objprp.frmsubmitdate = DateTime.Now;
        obj.update_rec_detfrm(objprp);
        getvaljj();
        Session["update"] = Convert.ToInt32(Session["frmcod"]);
        Response.Redirect("default2.aspx");
        Label1.Text = "changes request send Successfully";

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        button_clear();
    }



    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        if (e.Day.Date <= DateTime.Now)
        {
            e.Cell.BackColor = ColorTranslator.FromHtml("#a9a9a9");
            e.Day.IsSelectable = false;
        }
    }

}