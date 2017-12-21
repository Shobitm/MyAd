using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
public partial class Default2 : System.Web.UI.Page
{
    String id;
    public void getguid()
    {
        Guid g = Guid.NewGuid();
        id = g.ToString();
    }
    public void SendMail(String umail)
    {
        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "Change Password";
        mailMessage.Body = "Please use the following one time use link to change your password :\n" + "http://pcse944-001-site1.btempurl.com/forpass1.aspx/?s=" + id;
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }
    void getdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE register SET guid = '" + id + "' WHERE email = '" + TextBox1.Text + "'";
            if (cmd.ExecuteNonQuery() == 0)
            {
                Label2.Visible = true;
                Label2.Text = "Email is not registered!";
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "A Link To Change Your Password Has Been Sent To Your Registered Email";
            }
        }
        catch (Exception exp)
        {
            Label2.Visible = true;
            Label2.Text = "Error in webpage (SQL)!";
        }
        finally
        {
            con.Close();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        Label3.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        getguid();
        getdata();

        try
        {
            SendMail(TextBox1.Text);
        }
        catch (Exception exp)
        {
            Label2.Visible = true;
            Label2.Text = "Email ID is Required!";
        }

    }

    protected void RegularExpressionValidator2_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
    }
}