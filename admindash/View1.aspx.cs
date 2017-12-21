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

public partial class admindash_Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label5.Visible = false;
        TextBox3.Visible = false;
        RequiredFieldValidator3.Visible = false;
        RequiredFieldValidator3.Enabled = false;
        //TextBox1.Text = Session["links"].ToString();
        //TextBox2.Text = Session["desc"].ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("Select * from [detfrm] where frmcod=@x", conn);
        command.Parameters.AddWithValue("@x", Convert.ToInt32(Request.QueryString["rid"]));
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.Read())
            {
                if (!reader[9].ToString().Equals("Accepted by Admin"))
                {
                    Response.Redirect("~/admindash/Requests.aspx");
                }
                TextBox1.Text = reader[4].ToString();
                TextBox2.Text = reader[5].ToString();
                if (reader[6].ToString().Equals("Image"))
                {
                    Label4.Visible = false;
                    FileUpload2.Visible = false;
                    RequiredFieldValidator2.Visible = false;
                    RequiredFieldValidator2.Enabled = false;
                }else if (reader[6].ToString().Equals("Video"))
                {
                    Label3.Visible = false;
                    FileUpload1.Visible = false;
                    RequiredFieldValidator1.Visible = false;
                    RequiredFieldValidator1.Enabled = false;

                }
            }
            else
            {
                Response.Redirect("~/admindash/Requests.aspx");
            }
        }
        conn.Close();
    }


    //AD id umail reteiver
    public void getvaljj()
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
            SendMail(umail, fname); //Call to mail sender
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
    public void SendMail(String umail, String fname)
    {

        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "Demo AD uploaded!!";
        mailMessage.Body = "Hello " + fname + ",\nWe just uploaded a 'Demo' image and video related to your AD with AD code " + Convert.ToInt32(Request.QueryString["rid"]) +
        ". You can choose to 'Accept AD' or 'Reject AD' or request to make some modifications in AD. Remember AD will be auto APPROVED in 7 days. Thanks for choosing us!.";
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
        if (FileUpload1.HasFile)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            con.Open();
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Data/") + FileUpload1.FileName);
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE detfrm SET frmimg = " + "'/Data/" + FileUpload1.FileName + "' WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]);
            cmd.ExecuteNonQuery();

            con.Close();
        }
        if (FileUpload2.HasFile)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            con.Open();
            FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Data/") + FileUpload2.FileName);
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "UPDATE detfrm SET frmvideo = " + "'/Data/" + FileUpload2.FileName + "' WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]);
            cmd1.ExecuteNonQuery();

            con.Close();
        }
        if (!(TextBox3.Text.Equals(""))){
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd3 = new SqlCommand("UPDATE detfrm SET frmvideo = @value WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]), con);
            cmd3.Parameters.AddWithValue("@value", TextBox3.Text);
            cmd3.ExecuteNonQuery();
            con.Close();
        }
        if (FileUpload1.HasFile || FileUpload2.HasFile || !(TextBox3.Text.Equals("")))
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd3 = new SqlCommand("UPDATE detfrm SET pdt = @value WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]), con);
            cmd3.Parameters.AddWithValue("@value", DateTime.Now);
            cmd3.ExecuteNonQuery();
            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "UPDATE detfrm SET frmstatus = '" + "Waiting Response" + "' WHERE frmcod = " + Convert.ToInt32(Request.QueryString["rid"]);
            cmd2.ExecuteNonQuery();
            con.Close();
            getvaljj();
            Response.Redirect("View3.aspx?rid=" + Convert.ToInt32(Request.QueryString["rid"]));
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label4.Visible = false;
        FileUpload2.Visible = false;
        RequiredFieldValidator2.Visible = false;
        RequiredFieldValidator2.Enabled = false;
        Label5.Visible = true;
        TextBox3.Visible = true;
        RequiredFieldValidator3.Visible = true;
        RequiredFieldValidator3.Enabled = true;
    }
}