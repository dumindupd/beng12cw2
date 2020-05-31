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

namespace TestWebApplication
{
    public partial class newpost : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand com;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] == null || Session["utype"].ToString() != "1")
            {
                Response.Redirect("index.aspx");
            }
            string constr = ConfigurationManager.ConnectionStrings["constr"].ToString();
            con = new SqlConnection(constr);
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                sql = "INSERT INTO tbl_posts(pid,ptitle,pddate,pmessage,pdate,pstatus) VALUES(@pid,@ptitle,@pddt,@pmsg,@pdt,@psts)";
                con.Open();
                com = new SqlCommand(sql, con);
                com.Parameters.Add("@pid", SqlDbType.Int, 4, "pid").Value = 1;
                com.Parameters.Add("@ptitle", SqlDbType.VarChar, 100, "ptitle").Value = txttitle.Text;
                com.Parameters.Add("@pddt", SqlDbType.Date, 4, "pddate").Value = txtdate.Text;
                com.Parameters.Add("@pmsg", SqlDbType.VarChar, 500, "pmessage").Value = txtmsg.Text;
                com.Parameters.Add("@pdt", SqlDbType.Date, 4, "pdate").Value = DateTime.Now.ToShortDateString();
                com.Parameters.Add("@psts", SqlDbType.Int, 4, "pstatus").Value = 1;
                com.ExecuteNonQuery();
                sendMail(txttitle.Text, txtmsg.Text);
                lblmsg.Text = "Successfully Inserted";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

        }

        private void sendMail(string title,string msg)
        {
            try
            {
                string to,from;
                from = "lmetbeng@gmail.com";
                to = "lmetbeng@gmail.com";
                MailMessage mail = new MailMessage(from, to);
                mail.Subject = title;
                mail.Body = "Hi,\n"+msg+"\n"+"Thank you";

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential() 
                {
                    UserName = "lmetbeng@gmail.com",
                    Password = ""
                };

                client.EnableSsl = true;
                client.Send(mail);

            }
            catch (Exception ex)
            {
               Response.Write(ex.Message.ToString()); 
            }
        }
    }
}