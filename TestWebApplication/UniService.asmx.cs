using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Data.SqlClient;

namespace TestWebApplication
{
    /// <summary>
    /// Summary description for UniService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class UniService : System.Web.Services.WebService
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dreader;
        string constr,sql;

        [WebMethod]
        public void getStudent(string stdid)
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            sql = "SELECT * FROM tbl_student WHERE std_id='" + stdid+"'";
            com = new SqlCommand(sql, con);
            con.Open();
            dreader = com.ExecuteReader();
            Student std = new Student();
            dreader.Read();
            std.Sid = dreader["std_id"].ToString();
            std.Sname = dreader["std_name"].ToString();
            std.Saddress = dreader["std_address"].ToString();
            std.Semail = dreader["std_email"].ToString();
            std.Sphone = dreader["std_phone"].ToString();
            std.Sdob = DateTime.Parse(dreader["std_dob"].ToString()).ToString("yyyy-MM-dd");
            std.Sgender = int.Parse(dreader["std_gender"].ToString());
            std.Status = int.Parse(dreader["std_status"].ToString());
            dreader.Close();
            con.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(std));
        }

        [WebMethod]
        public void removeStudent(string stdid)
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            sql = "Update tbl_student SET std_status=0 WHERE std_id='" + stdid + "'";
            com = new SqlCommand(sql, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            Context.Response.Write("Done");
        }

        [WebMethod]
        public void getNewStdId()
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            Student std = new Student();
            Context.Response.Write(std.getNewId());
        }

        [WebMethod]
        public void changeLoginStatus(string uname, string stat)
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            sql = "UPDATE tbl_login SET usr_status=" + stat + " WHERE usr_name='" + uname + "'";
            com = new SqlCommand(sql, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            Context.Response.Write("Done");
        }
    }
}
