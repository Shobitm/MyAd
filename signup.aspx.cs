using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using Google.Apis.Gmail.v1;
using Google.Apis.Gmail.v1.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
public partial class _Default : System.Web.UI.Page
{
    // If modifying these scopes, delete your previously saved credentials
    // at ~/.credentials/gmail-dotnet-quickstart.json
    static string[] Scopes = { GmailService.Scope.GmailReadonly };
    static string ApplicationName = "Gmail API .NET Quickstart";

    static void funk()
    {
        UserCredential credential;

        using (var stream =
            new FileStream("client_secret.json", FileMode.Open, FileAccess.Read))
        {
            string credPath = System.Environment.GetFolderPath(
                System.Environment.SpecialFolder.Personal);
            credPath = Path.Combine(credPath, ".credentials/gmail-dotnet-quickstart.json");

            credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                GoogleClientSecrets.Load(stream).Secrets,
                Scopes,
                "user",
                CancellationToken.None,
                new FileDataStore(credPath, true)).Result;
            Console.WriteLine("Credential file saved to: " + credPath);
        }

        // Create Gmail API service.
        var service = new GmailService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = ApplicationName,
        });

        // Define parameters of request.
        UsersResource.LabelsResource.ListRequest request = service.Users.Labels.List("me");

        // List labels.
        IList<Google.Apis.Gmail.v1.Data.Label> labels = request.Execute().Labels;
        Console.WriteLine("Labels:");
        if (labels != null && labels.Count > 0)
        {
            foreach (var labelItem in labels)
            {
                Console.WriteLine("{0}", labelItem.Name);
            }
        }
        else
        {
            Console.WriteLine("No labels found.");
        }
        Console.Read();

    }
    public static Message SendMessage(GmailService service, String userId, Message email)
    {
        try
        {
            return service.Users.Messages.Send(email, userId).Execute();
        }
        catch (Exception e)
        {
            Console.WriteLine("An error occurred: " + e.Message);
        }

        return null;
    }

    String id;
    protected void Page_Load(object sender, EventArgs e)
    {
        //funk();
        Label1.Visible = false;
        Label2.Visible = false;
    }
    public void getguid()
    {
        Guid g = Guid.NewGuid();
        id = g.ToString();
    }
    public void SendMail(String umail)
    {

        MailMessage mailMessage = new MailMessage("bkrmsohi@gmail.com", umail);
        mailMessage.Subject = "Verification Link";
        mailMessage.Body = "Please use the following link to continue :\n" + "http://pcse944-001-site1.btempurl.com/verify.aspx/?s=" + id;
        SmtpClient smtpg = new SmtpClient("smtp-pulse.com", 465);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "bkrmsohi@gmail.com",
            Password = "YCqsA4WRCeB"
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        myad.clsregister obj = new myad.clsregister();
        myad.clsregistrationprp objprp = new myad.clsregistrationprp();
        objprp.email = txtemail.Text;
        objprp.f_name = txtf_name.Text;
        objprp.l_name = txtl_name.Text;
        objprp.address = txtaddress.Text;
        objprp.password = txtpassword.Text;
        objprp.contact = countrycod.Text + "-" + contact.Text;
        objprp.verified = "Unverified";
        objprp.join_date = DateTime.Now;
        getguid();
        objprp.guid = id;


        try
        {
            obj.save_rec(objprp);
            SendMail(txtemail.Text);
            txtemail.Text = string.Empty;
            txtf_name.Text = string.Empty;
            txtl_name.Text = string.Empty;
            txtaddress.Text = string.Empty;
            contact.Text = string.Empty;
            id = "";
            Label1.Visible = true;
            Label1.Text = "A verification link has been sent to your email.";

        }
        catch (Exception exp)
        {
            //Label2.Visible = true;
            //Label2.Text = "Email Id already registered.";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        txtemail.Text = string.Empty;
        txtf_name.Text = string.Empty;
        txtl_name.Text = string.Empty;
        txtaddress.Text = string.Empty;
        contact.Text = string.Empty;
        id = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void txtaddress_TextChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int i = 0;
        string s = DropDownList1.SelectedItem.ToString();



        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("Select * from [country] where nicename=@x", conn);
        command.Parameters.AddWithValue("@x", s);
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.Read())
            {
                i = Convert.ToInt16(reader[6]);
            }
        }
        conn.Close();
        countrycod.Text = "+" + Convert.ToString(i);

    }
}