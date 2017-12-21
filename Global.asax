<%@ Application Language="C#" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="System.Windows" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<script RunAt="server">

    BackgroundWorker worker;
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        worker = new BackgroundWorker();
        worker.DoWork += new DoWorkEventHandler(DoWork);
        worker.WorkerReportsProgress = false;
        worker.WorkerSupportsCancellation = true;
        worker.RunWorkerCompleted +=
               new RunWorkerCompletedEventHandler(WorkerCompleted);

        worker.RunWorkerAsync(); //we can also pass parameters to the async method....

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }



    private void DoWork(object sender, DoWorkEventArgs e)
    {
        int no = 0, no1 = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand command = new SqlCommand("Select * from [detfrm] WHERE frmstatus = 'Waiting Response'", conn);
        using (SqlDataReader reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                if (DateTime.Now > Convert.ToDateTime(reader[12]).AddDays(7))
                {
                    no = (int) reader[0];
                    no1 = (int) reader[1];
                    break;
                }
            }
        }
        SqlCommand cmd2 = conn.CreateCommand();
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = "UPDATE detfrm SET frmstatus = '" + "Accepted by Default" + "' WHERE frmcod = " + no;
        cmd2.ExecuteNonQuery();
        SqlCommand command2 = new SqlCommand("Select * from [register] WHERE regid =" + no1, conn);
        using (SqlDataReader reader2 = command2.ExecuteReader())
        {
            if (reader2.Read())
            {
                String s = reader2[1].ToString();
                SendMail(s, no);
            }
        }

        conn.Close();
    }

    public void SendMail(String umail, int no)
    {
        MailMessage mailMessage = new MailMessage("pcse944@gmail.com", umail);
        mailMessage.Subject = "Ad Accepted by Default";
        mailMessage.Body = "You didn't respond to the Ad no." + no + " we submitted within the alloted time so your request was Accepted by Default.";
        SmtpClient smtpg = new SmtpClient("smtp.gmail.com", 587);
        smtpg.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "pcse944@gmail.com",
            Password = "password1."
        };
        smtpg.EnableSsl = true;
        smtpg.Send(mailMessage);
    }

    private static void WorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
    {
        BackgroundWorker worker = sender as BackgroundWorker;
        if (worker != null)
        {
            // sleep for 20 secs and again call DoWork to get FxRates..we can increase the time to sleep and make it configurable to the needs
            //System.Threading.Thread.Sleep(20000);
            worker.RunWorkerAsync();
        }
    }
</script>
