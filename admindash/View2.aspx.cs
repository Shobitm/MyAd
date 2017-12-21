using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Diagnostics;


public partial class admindash_Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("Select * from [detfrm] where frmcod=@x", conn);
        command.Parameters.AddWithValue("@x", Convert.ToInt32(Request.QueryString["rid"]));
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.Read())
            {
                if (!reader[9].ToString().Equals("New") && !reader[9].ToString().Equals("Request Changed"))
                {
                    Response.Redirect("~/admindash/Requests.aspx");
                }
                TextBox1.Text = reader[4].ToString();
                TextBox2.Text = reader[5].ToString();
            }
            else
            {
                Response.Redirect("~/admindash/Requests.aspx");
            }
        }
        conn.Close();
    }
    //AD id umail reteiver
    public void getvaljj(int stat)
    {
        string id = Request.QueryString["rid"];
        Int32 val;
        string umail, fname;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "SELECT frmregcod FROM detfrm WHERE frmcod = '" + id + "'";
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            val = Convert.ToInt32(reader["frmregcod"]);
            reader.Close();
            cmd.CommandText = "SELECT email FROM register WHERE regid = '" + val + "';";
            reader = cmd.ExecuteReader();
            reader.Read();
            umail = Convert.ToString(reader["email"]);
            reader.Close();
            cmd.CommandText = "SELECT f_name FROM register WHERE regid = '" + val + "';";
            reader = cmd.ExecuteReader();
            reader.Read();
            fname = Convert.ToString(reader["f_name"]);
            reader.Close();
            SendMail(umail, fname, stat); //Call to mail sender
        }
        catch (Exception exp)
        {
            Debug.WriteLine("error " + exp);
        }
        finally
        {
            con.Close();
        }
    }
    //End AD id umail Retriever
    //Mail Sender
    public void SendMail(String umail, String fname, int stat)
    {

        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        if (stat == 1)
        {
            mailMessage.Subject = "AD requested Accepted!!";
            mailMessage.Body = "Hello " + fname + ",\nYour AD request with AD code " + Convert.ToInt32(Request.QueryString["rid"]) + " has been accepted. We will soon upload a 'demo' image and video related to your AD requirement. Thanks for choosing us!.";
        }
        else
        {
            mailMessage.Subject = "AD request Rejected!!";
            mailMessage.Body = "Hello " + fname + ",\nYour AD request with AD code " + Convert.ToInt32(Request.QueryString["rid"]) + " has been rejected. Please use 'Contact Us' for further details.";
        }
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

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE detfrm SET frmstatus = '" + "Accepted by Admin" + "' WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        getvaljj(1);
        Response.Redirect("View1.aspx?rid=" + Convert.ToInt32(Request.QueryString["rid"]));
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE detfrm SET frmstatus = '" + "Rejected by Admin" + "' WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        getvaljj(0);
        SqlParameter sp1 = new SqlParameter();
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("deldetfrm", con);
        cmd.CommandType = CommandType.StoredProcedure;
        sp1 = cmd.Parameters.Add("@frmcod", SqlDbType.Int);
        sp1.Value = Convert.ToInt32(Request.QueryString["rid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Requests.aspx");
    }
}