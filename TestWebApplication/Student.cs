using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace TestWebApplication
{
    public class Student
    {
        private string sid;
        private string sname;
        private string saddress;
        private string semail;
        private string sphone;
        private string sdob;
        private int sgender;
        private int status;

        private SqlConnection con;
        private SqlCommand com;
        private SqlDataReader dreader;
        private string constr, sql;

        public string Sid
        {
            get { return sid; }
            set { sid = value; }
        }

        public string Sname
        {
            get { return sname; }
            set { sname = value; }
        }

        public string Saddress
        {
            get { return saddress; }
            set { saddress = value; }
        }

        public string Semail
        {
            get { return semail; }
            set { semail = value; }
        }

        public string Sphone
        {
            get { return sphone; }
            set { sphone = value; }
        }

        public string Sdob
        {
            get { return sdob; }
            set { sdob = value; }
        }

        public int Sgender
        {
            get { return sgender; }
            set { sgender = value; }
        }

        public int Status
        {
            get { return status; }
            set { status = value; }
        }

        public Student()
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
        }

        public string getNewId()
        {
            sql = " select top 1 std_id from tbl_student order by std_id desc";
            com = new SqlCommand(sql, con);
            con.Open();
            dreader = com.ExecuteReader();
            dreader.Read();
            string stdid = dreader["std_id"].ToString();
            dreader.Close();
            //STD00002
            int num = int.Parse(stdid.Substring(3));
            num++;
            string newid = num.ToString();
            con.Close();
            return "STD" + newid.PadLeft(5, '0');
        }
    }
}