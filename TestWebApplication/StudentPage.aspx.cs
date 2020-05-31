using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TestWebApplication
{
    public partial class StudentPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand com;
        DataTable dt;
        string constr,sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
            populateGrid();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                sql = "UPDATE tbl_student SET std_name=@name,std_address=@sadd,std_email=@email,std_phone=@phone,std_dob=@dob,std_gender=@gender,std_status=@stat WHERE std_id=@sid";
                com = new SqlCommand(sql,con);
                con.Open();
                com.Parameters.Add("@sid",SqlDbType.Char,8,"std_id").Value = txtid.Text;
                com.Parameters.Add("@name", SqlDbType.VarChar, 50, "std_name").Value = txtname.Text;
                com.Parameters.Add("@sadd", SqlDbType.VarChar, 100, "std_address").Value = txtaddress.Text;
                com.Parameters.Add("@email", SqlDbType.VarChar, 50, "std_email").Value = txtemail.Text;
                com.Parameters.Add("@phone", SqlDbType.Char, 11, "std_phone").Value = txtphone.Text;
                com.Parameters.Add("@dob", SqlDbType.Date, 4, "std_dob").Value = txtdob.Text;
                int gender = -1;
                if (rdomale.Checked==true)
                {
                    gender = 1;
                }
                else
                {
                    gender = 0;
                }
                com.Parameters.Add("@gender", SqlDbType.TinyInt, 4, "std_gender").Value = gender;
                com.Parameters.Add("@stat", SqlDbType.TinyInt, 4, "std_status").Value = cmbstatus.SelectedValue;
                com.ExecuteNonQuery();
                populateGrid();
                lblmsg.Text = "Successfully Updated";
            }

            catch (Exception ex)
            {
                lblmsg.Text = ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {

        }


        private void populateGrid()
        {
            com = new SqlCommand();
            com.CommandText = "exec gerStudents";
            com.Connection = con;
            da = new SqlDataAdapter(com);
            dt = new DataTable();
            da.Fill(dt);
            dgStudent.DataSource = dt;
            dgStudent.DataMember = "tbl_login";
            dgStudent.DataBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //Codes for insert
        }

    }
}