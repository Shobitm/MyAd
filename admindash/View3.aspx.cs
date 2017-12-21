using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admindash_Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = null;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("Select * from [detfrm] where frmcod=@x", conn);
        command.Parameters.AddWithValue("@x", Convert.ToInt32(Request.QueryString["rid"]));
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.Read())
            {
                s = reader[8].ToString();
                if (!(reader[9].ToString().Equals("Accepted by User") || reader[9].ToString().Equals("Rejected by User") || reader[9].ToString().Equals("Waiting Response") || reader[9].ToString().Equals("Accepted by Default")))
                {
                    Response.Redirect("~/admindash/Requests.aspx");
                }
                TextBox1.Text = reader[4].ToString();
                TextBox2.Text = reader[5].ToString();
                if(reader[9].ToString().Equals("Waiting Response"))
                {
                    Button1.Visible = false;
                    Button1.Enabled = false;
                }
                if (reader[6].ToString().Equals("Image"))
                {
                    dl2.Visible = false;
                    dl2.Enabled = false;
                    Label4.Text = "This request didn't require video.";
                }
                else if ((reader[6].ToString().Equals("Video")) && (s[0]=='/'))
                {
                    dl.Visible = false;
                    dl.Enabled = false;
                    Label3.Text = "This request didn't require image.";
                }
                else if ((reader[6].ToString().Equals("Video")) && !(s[0] == '/'))
                {
                    dl2.Visible = false;
                    dl2.Enabled = false;
                    Label4.Text = "This request has External video URL.";
                    dl.Visible = false;
                    dl.Enabled = false;
                    Label3.Text = "This request didn't require image.";
                }
                reader.Close();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(dt);
                dl.DataSource = dt;
                dl.DataBind();
                dl2.DataSource = dt;
                dl2.DataBind();
                

            }
            else
            {
                Response.Redirect("~/admindash/Requests.aspx");
            }
        }
        conn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
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