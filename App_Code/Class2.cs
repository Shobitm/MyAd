using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace admin
{
    //connection
    public abstract class clscon
    {
        protected SqlConnection con = new SqlConnection();


        public clscon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["myad5ConnectionString"].ConnectionString;
        }
    }
    //end connection

    //start tb register
    public interface admin

    {
        Int32 rid
        {
            get;
            set;
        }

        string email
        {
            get;
            set;
        }
        string password
        {
            get;
            set;
        }


    }

    public class clsregistrationprp : admin
    {
        private Int32 prvid;
        private string prvemail, prvpassword;     

        public string email
        {
            get
            {
                return prvemail;
            }

            set
            {
                prvemail = value;
            }
        }

        public string password
        {
            get
            {
                return prvpassword;
            }

            set
            {
                prvpassword = value;
            }
        }

     

        public int rid
        {
            get
            {
                return prvid;
            }

            set
            {
                prvid = value;
            }
        }
    }

    public class clsregister : clscon
    {
        public Int32 logincheck(clsregistrationprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("getAdm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 100).Value = p.email;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 100).Value = p.password;
            cmd.Parameters.Add("@cod", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            Int32 a = Convert.ToInt32(cmd.Parameters["@cod"].Value);
            cmd.Dispose();
            con.Close();
            return a;
        }
     
    }

}