using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace myad
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
    public interface register

    {
        Int32 regid
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

        string f_name
        {
            get;
            set;
        }

        string l_name
        {
            get;
            set;
        }
        string address
        {
            get;
            set;
        }
        string contact
        {
            get;set;
        }
        string guid
        {
            get;set;
        }
        string verified
        {
            get; set;
        }

        DateTime join_date
        {
            get; set;
        }

    }

    public class clsregistrationprp : register
    {
        private Int32 prvregid;
        private string prvemail, prvpassword, prvf_name, prvl_name, prvaddress,prvcontact,prvguid;
        private string prvverified;
        private DateTime prvdate;

        public int regid
        {
            get
            {
                return prvregid;
            }

            set
            {
                prvregid = value;
            }
        }

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

        public string f_name
        {
            get
            {
                return prvf_name;
            }

            set
            {
                prvf_name = value;
            }
        }

        public string l_name
        {
            get
            {
                return prvl_name;
            }

            set
            {
                prvl_name = value;
            }
        }

        public string address
        {
            get
            {
                return prvaddress;
            }

            set
            {
                prvaddress = value;
            }
        }

        public string contact
        {
            get
            {
                return prvcontact;
            }
            set
            {
                prvcontact = value;
            }
        }
        public string guid
        {
            get
            {
                return prvguid;
            }
            set
            {
                prvguid = value;
            }
        }
        public string verified
        {
            get
            {
                return prvverified;
            }
            set
            {
                prvverified = value;
            }
        }

        public DateTime join_date
        {
            get
            {
                return prvdate;
            }
            set
            {
                prvdate = value;
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
            SqlCommand cmd = new SqlCommand("logincheck", con);
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
        public void save_rec(clsregistrationprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("insreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = p.email;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = p.password;
            cmd.Parameters.Add("@f_name", SqlDbType.VarChar, 50).Value = p.f_name;
            cmd.Parameters.Add("@l_name", SqlDbType.VarChar, 50).Value = p.l_name;
            cmd.Parameters.Add("@contact", SqlDbType.VarChar,20).Value = p.contact;
            cmd.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = p.address;
            cmd.Parameters.Add("@guid", SqlDbType.VarChar, 100).Value = p.guid;
            cmd.Parameters.Add("@verified", SqlDbType.VarChar, 50).Value = p.verified;
            cmd.Parameters.Add("@join_date", SqlDbType.DateTime).Value = p.join_date;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

        }

        public void update_rec(clsregistrationprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("updreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@regid", SqlDbType.Int).Value = p.regid;
            cmd.Parameters.Add("@f_name", SqlDbType.VarChar, 50).Value = p.f_name;
            cmd.Parameters.Add("@l_name", SqlDbType.VarChar, 50).Value = p.l_name;
            cmd.Parameters.Add("@contact", SqlDbType.VarChar, 20).Value = p.contact;
            cmd.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = p.address;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = p.email;
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = p.password;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

        }

        public void delete_rec(clsregistrationprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("delreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@regid", SqlDbType.Int).Value = p.regid;

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }

        public List<clsregistrationprp> disp_rec()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("dispreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsregistrationprp> obj = new List<clsregistrationprp>();
            while (dr.Read())
            {
                clsregistrationprp k = new clsregistrationprp();
                k.regid = Convert.ToInt32(dr[0]);
                k.email = dr[1].ToString();
                k.password = dr[2].ToString();
                k.f_name = dr[3].ToString();
                k.l_name = dr[4].ToString();
                k.address = dr[5].ToString();
                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;

        }

        public List<clsregistrationprp> find_rec(Int32 regid)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("findreg", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@regid", SqlDbType.Int).Value = regid;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsregistrationprp> obj = new List<clsregistrationprp>();
            if (dr.HasRows)
            {
                dr.Read();
                clsregistrationprp k = new clsregistrationprp();
                k.regid = Convert.ToInt32(dr[0]);
                k.email = dr[1].ToString();
                k.password = dr[5].ToString();
                k.contact = dr[6].ToString();
                k.f_name = dr[2].ToString();
                k.l_name = dr[3].ToString();
                k.address = dr[4].ToString();
                obj.Add(k);

            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;


        }
    }

    //complete tbreg......

    //starting tb detfrm

    public interface detfrm
    {
        string frmtit { set; get; }
        DateTime frmdate
        {
            set; get;
        }
        string frmurl
        {
            set;
            get;
        }
        string frmdesc
        {
            set;
            get;
        }
        Int32 frmregcod
        {
            set; get;
        }
        Int32 frmcod
        {
            set;get;
        }
        string frmimg { set; get; }
        string frmvideo { set; get; }
        string frmstatus { set; get; }
        DateTime frmsubmitdate { set; get; }
        DateTime pdt { set; get; }
        DateTime rdt { set; get; }
        string frmreqcont { set; get; }

        string frmpayment { set; get; }

    }

    public class clsdetfrmprp : detfrm
    {
        private Int32 prvfrmcod;
        private Int32 prvfrmregcod;    
        
        private string prvurl, prvdescription, prvtitle,prvfrmimg,prvfrmvideo,prvfrmstatus,prvfrmpayment,prvfrmreqcont;
        private DateTime prvdate,prvpdt,prvrdt;
        private DateTime prvsubmitdate;
        public int frmcod
        {
            get
            {
                return prvfrmcod;
            }
            set
            {
                prvfrmcod = value;
            }
        }
        public int frmregcod
        {
            get
            {
                return prvfrmregcod;
            }
            set
            {
                prvfrmregcod = value;
            }
        }
        public DateTime frmdate
        {
            get
            {
                return prvdate;
            }

            set
            {
                prvdate = value;
            }
        }
        public string frmdesc
        {
            get
            {
                return prvdescription;
            }

            set
            {
                prvdescription = value;
            }
        }
        public string frmtit
        {
            get
            {
                return prvtitle;
            }

            set
            {
                prvtitle = value;
            }
        }
        public string frmurl
        {
            get
            {
                return prvurl;
            }

            set
            {
                prvurl = value;
            }
        }
        public string frmvideo
        {
            get
            {
                return prvfrmvideo;
            }

            set
            {
                prvfrmvideo = value;
            }
        }
        public string frmstatus
        {
            get
            {
                return prvfrmstatus;
            }

            set
            {
                prvfrmstatus = value;
            }
        }

        public string frmimg
        {
            get
            {
                return prvfrmimg;
            }

            set
            {
                prvfrmimg = value;
            }
        }

        public DateTime frmsubmitdate
        {
            get
            {
                return prvsubmitdate;
            }

            set
            {
                prvsubmitdate = value;
            }
        }

        public string frmpayment
        {
            get
            {
                return prvfrmpayment;
            }

            set
            {
                prvfrmpayment = value;
            }
        }

        public DateTime pdt
        {
            get
            {
                return prvpdt;
            }

            set
            {
                prvpdt = value;
            }
        }

        public DateTime rdt
        {
            get
            {
                return prvrdt;
            }

            set
            {
                prvrdt  = value;
            }
        }
        public string frmreqcont
        {
            get
            {
                return prvfrmreqcont;
            }

            set
            {
                prvfrmreqcont = value;
            }
        }
    }

    public class clsdetfrm:clscon
    {
        public void save_rec_detfrm(clsdetfrmprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("insdetfrm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@frmregcod", SqlDbType.Int).Value = p.frmregcod;
            cmd.Parameters.Add("@frmtit", SqlDbType.VarChar,50).Value = p.frmtit;
            cmd.Parameters.Add("@frmdate", SqlDbType.DateTime).Value = p.frmdate;
            cmd.Parameters.Add("@frmurl", SqlDbType.VarChar,100).Value = p.frmurl;
            cmd.Parameters.Add("@frmdesc", SqlDbType.VarChar,100).Value = p.frmdesc;
            cmd.Parameters.Add("@frmreqcont", SqlDbType.VarChar, 50).Value = p.frmreqcont;

            cmd.Parameters.Add("@frmimg", SqlDbType.VarChar, 200).Value = DBNull.Value;
            cmd.Parameters.Add("@frmvideo", SqlDbType.VarChar, 200).Value = DBNull.Value;
            cmd.Parameters.Add("@frmstatus", SqlDbType.VarChar, 200).Value = "New";
            cmd.Parameters.Add("@frmsubmitdate", SqlDbType.DateTime).Value = p.frmsubmitdate;
            cmd.Parameters.Add("@frmpayment", SqlDbType.VarChar, 1000).Value = p.frmpayment;
            cmd.Parameters.Add("@pdt", SqlDbType.DateTime).Value = DBNull.Value;
            cmd.Parameters.Add("@rdt", SqlDbType.DateTime).Value = DBNull.Value;
            cmd.Parameters.Add("@r", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            cmd.ExecuteNonQuery();
            Int32 a = Convert.ToInt32(cmd.Parameters["@r"].Value);
            cmd.Dispose();
            con.Close();

        }

        public void update_rec_detfrm(clsdetfrmprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("upddetfrm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@frmcod", SqlDbType.Int).Value = p.frmcod;
            cmd.Parameters.Add("@frmregcod", SqlDbType.Int).Value = p.frmregcod;
            cmd.Parameters.Add("@frmtit", SqlDbType.VarChar, 50).Value = p.frmtit;
            cmd.Parameters.Add("@frmdate", SqlDbType.DateTime).Value = p.frmdate;
            cmd.Parameters.Add("@frmurl", SqlDbType.VarChar, 100).Value = p.frmurl;
            cmd.Parameters.Add("@frmdesc", SqlDbType.VarChar, 100).Value = p.frmdesc;
            cmd.Parameters.Add("@frmreqcont", SqlDbType.VarChar, 50).Value = p.frmreqcont;
            cmd.Parameters.Add("@frmsubmitdate", SqlDbType.DateTime).Value = p.frmsubmitdate;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

        }

        public void delete_rec_detfrm(clsdetfrmprp p)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("deldetfrm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@frmcod", SqlDbType.Int).Value = p.frmcod;

            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }

        public List<clsdetfrmprp> disp_rec_detfrm()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("dispdetfrm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsdetfrmprp> obj = new List<clsdetfrmprp>();
            while (dr.Read())
            {
                clsdetfrmprp k = new clsdetfrmprp();
                k.frmcod = Convert.ToInt32(dr[0]);
                k.frmtit = dr[2].ToString();
                k.frmdate = Convert.ToDateTime(dr[3]);
                k.frmurl = dr[4].ToString();
                k.frmdesc = dr[5].ToString();
                k.frmreqcont = dr[6].ToString();

                obj.Add(k);
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;

        }

        public List<clsdetfrmprp>   find_rec_detfrm(Int32 frmcod)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();

            }
            SqlCommand cmd = new SqlCommand("finddetfrm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@frmcod", SqlDbType.Int).Value = frmcod;
            SqlDataReader dr = cmd.ExecuteReader();
            List<clsdetfrmprp> obj = new List<clsdetfrmprp>();
            if (dr.HasRows)
            {
                dr.Read();
                clsdetfrmprp k = new clsdetfrmprp();
                k.frmcod = Convert.ToInt32(dr[0]);
                k.frmregcod = Convert.ToInt32(dr[1]);           
                k.frmtit = dr[2].ToString();
                k.frmdate = Convert.ToDateTime(dr[3]);
                k.frmurl = dr[4].ToString();
                k.frmdesc = dr[5].ToString();
                k.frmreqcont = dr[6].ToString();

                obj.Add(k);

            }
            dr.Close();
            cmd.Dispose();
            con.Close();
            return obj;


        }
    }

}