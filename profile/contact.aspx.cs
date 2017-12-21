using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class profile_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
    }

    public void SendMail()
    {

        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", "pcse944@gmail.com");
        mailMessage.Subject = "Contact Mail";
        mailMessage.Body = "Client Name : " + TextBox1.Text + "\nClient E-Mail : " + TextBox2.Text + "\nSubject : " + TextBox3.Text + "\nMessage :\n" + TextBox4.Text;
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBox2.Text == string.Empty ||
                TextBox1.Text == string.Empty ||
                TextBox3.Text == string.Empty ||
                TextBox4.Text == string.Empty)
            {
                Label2.Visible = true;
                Label2.Text = "All above fields are required!!";
            }
            else
            {
                SendMail();
                Label1.Visible = true;
                Label1.Text = "Your message has been successfully sent.";
            }
        }
        catch (Exception exp)
        {
            Label2.Visible = true;
            Label2.Text = "Network Error!!Check your connectivity!";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        TextBox2.Text = string.Empty;
        TextBox1.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;
    }
}