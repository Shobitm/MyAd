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

public partial class admindash_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand command = new SqlCommand("Select * from [register] where regid=@x", conn);
            command.Parameters.AddWithValue("@x", Convert.ToInt32(Request.QueryString["uid"]));
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {

                    TextBox1.Text = reader[2].ToString();
                    TextBox2.Text = reader[3].ToString();
                    TextBox3.Text = reader[1].ToString();
                    TextBox4.Text = reader[6].ToString();
                    TextBox5.Text = reader[4].ToString();
                    TextBox6.Text = reader[5].ToString();
                    String s = reader[9].ToString();
                    if (s.Equals("Active"))
                    {
                        DropDownList1.SelectedIndex = 0;
                    }
                    else if (s.Equals("Blocked"))
                    {
                        DropDownList1.SelectedIndex = 1;
                    }
                }
                else
                {
                    Response.Redirect("~/admindash/Requests.aspx");
                }
            }
            conn.Close();
            lockdiv();
        }
    }

    //Mail Sender
    public void SendMail(String state, String umail)
    {


        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "Profile updated!";
        mailMessage.Body = "Your account has been " + state + " by admin. Please use the following link for furthur enquiry:\n http://pcse944-001-site1.btempurl.com/contact.aspx ";
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
    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        string req_id = GridView1.SelectedRow.Cells[0].Text;

        if (GridView1.SelectedRow.Cells[8].Text == "Accepted by Admin")
        {
            Response.Redirect("View1.aspx?rid=" + req_id);
        }
        else if (GridView1.SelectedRow.Cells[8].Text == "New" || GridView1.SelectedRow.Cells[8].Text == "Request Changed")
        {
            Response.Redirect("View2.aspx?rid=" + req_id);
        }
        else
        {
            Response.Redirect("View3.aspx?rid=" + req_id);
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        String s = DropDownList1.SelectedItem.Value.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE register SET f_name ='" + TextBox1.Text + "',l_name='" + TextBox2.Text + "',contact='" + TextBox4.Text + "',address='" + TextBox5.Text + "',password='" + TextBox6.Text + "',acc_stat='" + s + "' WHERE regid = " + Convert.ToInt32(Request.QueryString["uid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        //SendMail();
        if (DropDownList1.SelectedIndex == 0)
        {
            SendMail("Unbocked", TextBox3.Text);
        }
        else
        {
            SendMail("Blocked", TextBox3.Text);
        }
        Response.Redirect(Request.RawUrl);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        SqlParameter sp1 = new SqlParameter();
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("delreg", con);
        cmd.CommandType = CommandType.StoredProcedure;
        sp1 = cmd.Parameters.Add("@regid", SqlDbType.Int);
        sp1.Value = Convert.ToInt32(Request.QueryString["uid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Users.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        SqlParameter sp1 = new SqlParameter();
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("delregad", con);
        cmd.CommandType = CommandType.StoredProcedure;
        sp1 = cmd.Parameters.Add("@regid", SqlDbType.Int);
        sp1.Value = Convert.ToInt32(Request.QueryString["uid"]);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Users.aspx");
    }

    protected void lk1_Click(object sender, EventArgs e)
    {
        unlockdiv();
    }

    void lockdiv()
    {
        TextBox1.ReadOnly = true;
        TextBox2.ReadOnly = true;
        TextBox3.ReadOnly = true;
        TextBox4.ReadOnly = true;
        TextBox5.ReadOnly = true;
        TextBox6.ReadOnly = true;
        DropDownList1.Enabled = false;
        Button1.Enabled = false;
        Button2.Enabled = false;
    }

    void unlockdiv()
    {
        TextBox1.ReadOnly = false;
        TextBox1.Focus();
        TextBox2.ReadOnly = false;
        TextBox3.ReadOnly = false;
        TextBox4.ReadOnly = false;
        TextBox5.ReadOnly = false;
        TextBox6.ReadOnly = false;
        DropDownList1.Enabled = true;
        Button1.Enabled = true;
        Button2.Enabled = true;
    }
}