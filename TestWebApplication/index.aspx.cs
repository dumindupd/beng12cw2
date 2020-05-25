using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace TestWebApplication
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dreader;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"]!=null)
            {
                if (Session["utype"].ToString() == "1")
                {
                    //Redirect to admin dashboard
                    Response.Redirect("admin-dashboard.aspx");
                }
                else if (Session["utype"].ToString() == "2")
                {
                    //Redirect to placement officer dashboard
                }
                else if (Session["utype"].ToString() == "3")
                {
                    //Redirect to student dashboard
                }
            }
            string constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string uname, pass;
            uname = txtuname.Text;
            pass = txtpass.Text;

            if (uname=="" || pass=="")
            {
                lblmsg.Text = "Please enter both username and password";
                return;
            }

            try
            {
                sql = "select * from tbl_login where usr_name='"+uname+"'";
                com = new SqlCommand(sql, con);
                con.Open();
                dreader = com.ExecuteReader();
                if (dreader.HasRows)
                {
                    dreader.Read();
                    if (dreader["usr_pass"].ToString()==pass)
                    {
                        if (dreader["usr_status"].ToString()=="1")
                        {
                            string utype = dreader["usr_type"].ToString();
                            Session["uname"] = uname;
                            Session["utype"] = utype;
                            if (utype=="1")
                            {
                                //Redirect to admin dashboard
                                Response.Redirect("admin-dashboard.aspx");
                            }
                            else if (utype=="2")
                            {
                                //Redirect to placement officer dashboard
                            }
                            else if (utype == "3")
                            {
                                //Redirect to student dashboard
                            }

                        }
                        else
                        {
                            lblmsg.Text = "Your account has been locked, please contact administrator";
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Invalid username or password";
                    }
                    dreader.Close();
                }
                else
                {
                    lblmsg.Text = "Invalid username or password";
                }

            }
            catch (Exception ex)
            {
                lblmsg.Text = "Error "+ex.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }
    }
}