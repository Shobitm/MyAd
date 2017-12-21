using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class profile_Default : System.Web.UI.Page
{
    public int diffInSeconds;

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);

    public void getvaljj(string stat)
    {
        string email, fname;

        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);


        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con2;
            con2.Open();
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
            SendMail(email, stat, fname);
        }
        catch (Exception exp)
        {
            Label1.Text = "Error " + exp;
        }
        finally
        {
            con2.Close();
        }
    }
    public void SendMail(String umail, String status, String fname)
    {
        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "AD Status";
        mailMessage.Body = "Hello " + fname + ",\nYou have " + status + " the AD request.";
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
        SendMail2(status);
    }
    public void SendMail2(String status)
    {
        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", "pcse944@gmail.com");
        mailMessage.Subject = "AD Status";
        mailMessage.Body = "User with id " + Session["cod"] + " has " + status + " to the AD.";
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
        if (!IsPostBack)
        {
            DateTime dateTime1 = new DateTime();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Select * from [detfrm] WHERE frmcod=" + Session["frmcod"], conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    dateTime1 = Convert.ToDateTime(reader[12]).AddDays(7);
                    DateTime dateTime2 = DateTime.Now;
                    diffInSeconds = (int)(dateTime1 - dateTime2).TotalSeconds;
                }
            }
            conn.Close();
        }


        Label1.Visible = false;
        Label2.Visible = false;

        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from detfrm where frmregcod=" + Session["cod"] + "and frmcod=" + Session["frmcod"];
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        dl.DataSource = dt;
        dl.DataBind();
        con.Close();
        Button1.Visible = true;
        Button2.Visible = true;
        Button3.Visible = true;

    }

    protected void dl_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update detfrm set frmstatus='Accepted by User' where frmcod=" + Session["frmcod"];
        cmd.ExecuteNonQuery();
        SqlCommand cmd3 = new SqlCommand("UPDATE detfrm SET rdt = @value WHERE frmcod = " + Session["frmcod"], con);
        cmd3.Parameters.AddWithValue("@value", DateTime.Now);
        cmd3.ExecuteNonQuery();
        getvaljj("Accepted");
        con.Close();
        Label1.Visible = true;
        Label1.Text = "Advertisement is Successfully Approved. Please wait for Admin Comformation. Thanks for choosing us";
        Button1.Visible = false;
        Button2.Visible = false;
        Button3.Visible = false;

        string page = Request.Url.Segments[Request.Url.Segments.Length - 1];
        HtmlMeta keywords = new HtmlMeta();
        keywords.HttpEquiv = "Refresh";
        keywords.Content = ("2;url=indexprofile.aspx").ToString();
        this.Page.Header.Controls.Add(keywords);

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update detfrm set frmstatus='Rejected by User' where frmcod=" + Session["frmcod"];
        cmd.ExecuteNonQuery();
        SqlCommand cmd3 = new SqlCommand("UPDATE detfrm SET rdt = @value WHERE frmcod = " + Session["frmcod"], con);
        cmd3.Parameters.AddWithValue("@value", DateTime.Now);
        cmd3.ExecuteNonQuery();
        getvaljj("Rejected");
        con.Close();

        Label2.Visible = true;
        Label2.Text = ("OOPS!!! We will try our best with next Advertisement.");
        Button1.Visible = false;
        Button2.Visible = false;
        Button3.Visible = false;

        string page = Request.Url.Segments[Request.Url.Segments.Length - 1];
        HtmlMeta keywords = new HtmlMeta();
        keywords.HttpEquiv = "Refresh";
        keywords.Content = ("2;url=indexprofile.aspx").ToString();
        this.Page.Header.Controls.Add(keywords);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "update detfrm set frmstatus='Request Changed' where frmcod=" + Session["frmcod"];
        cmd.ExecuteNonQuery();
        SqlCommand cmd3 = new SqlCommand("UPDATE detfrm SET rdt = @value WHERE frmcod = " + Session["frmcod"], con);
        cmd3.Parameters.AddWithValue("@value", DateTime.Now);
        cmd3.ExecuteNonQuery();
        getvaljj("requested to make some changes to");
        con.Close();
        Response.Redirect("update.aspx");


    }




}