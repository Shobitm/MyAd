using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using myad;
using System.Drawing;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
public partial class profile_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        title.Focus();

    }
    //button clear
    private void button_clear()
    {
        title.Text = string.Empty;
        rtd.Text = string.Empty;
        urls.Text = string.Empty;
        requirements.Text = string.Empty;
    }
    //end button clear
    //AD id Retriever
    public void getvaljj()
    {
        Int32 val;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("SELECT frmcod FROM detfrm WHERE frmregcod ='" + Session["cod"] + "' AND frmstatus ='New';", con);
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            val = Convert.ToInt32(reader["frmcod"]);
            SendMail(val); //Call to mail sender
        }
        catch (Exception exp)
        {
            // Console.Write = "Error ";
        }
        finally
        {
            con.Close();
        }
    }
    //End AD id Retriever
    //Mail Sender
    public void SendMail(Int32 code)
    {

        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", "pcse944@gmail.com");
        mailMessage.Subject = "New AD Request";
        mailMessage.Body = "A new AD request with AD Code " + code + " has been generated.";
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }
    //End mail sender
    //calender
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
    //calender ending
    protected void Button1_Click(object sender, EventArgs e)
    {
        clsdetfrm obj = new clsdetfrm();
        clsdetfrmprp objprp = new clsdetfrmprp();
        objprp.frmtit = title.Text;
        objprp.frmregcod = Convert.ToInt32(Session["cod"]);
        objprp.frmdate = Convert.ToDateTime(rtd.Text);
        objprp.frmurl = urls.Text;
        objprp.frmdesc = requirements.Text;
        objprp.frmreqcont = DropDownList1.SelectedValue.ToString();
        objprp.frmsubmitdate = DateTime.Now;
        objprp.frmpayment = "none";
        objprp.pdt = default(DateTime);
        objprp.rdt = default(DateTime);
        //  if (Button1.Text == "send details")
        //  {
        obj.save_rec_detfrm(objprp);
        getvaljj();
        Response.Redirect("default2.aspx");
        button_clear();



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