using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TestWebApplication
{
    public partial class showUsers : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand com;
        DataTable dt;
        string constr;

        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            //sql = "select usr_name,CASE WHEN usr_type=1 THEN 'Admin' WHEN usr_type=2 THEN 'Placement Officer' WHEN usr_type=3 THEN 'Student' END AS usr_type, CASE WHEN usr_status=1 THEN 'Active' WHEN usr_status=0 THEN 'Inactive' END AS usr_status From tbl_login";
            com = new SqlCommand();
            com.CommandText = "exec getUsers";
            com.Connection = con;
            da = new SqlDataAdapter(com);
            dt = new DataTable();
            da.Fill(dt);
            dgUsers.DataSource = dt;
            dgUsers.DataMember = "tbl_login";
            dgUsers.DataBind();
        }
    }
}