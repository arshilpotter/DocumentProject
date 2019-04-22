using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace DocProject
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The following gets triggered when user hits submit 
        protected void Button1_Click(object sender, EventArgs e)
        {



            string username = "";
            string password = "";
            // SQL connection is created
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;");
            // Query to check if the entered emailId exists in the database
            SqlCommand cmd = new SqlCommand("select Username, Password from [DocProj].[dbo].[User_Info] where email=@email", con);
            //email parameter is created for query
            cmd.Parameters.AddWithValue("email", TextBox1.Text);
            con.Open();
            //Reads the data from the query
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {

                if (sdr.Read())
                {
                    // Username and Password getes stored in the variables
                    username = sdr["Username"].ToString();
                    password = sdr["Password"].ToString();

                }

            }
            con.Close();

            // If the password is not empty

            if (!string.IsNullOrEmpty(password))
            {
                // Mailmessage object is created which holds the data structure of an email 
                MailMessage msg = new MailMessage();
                // From email address is given
                msg.From = new MailAddress("arshilpotter@gmail.com");
                // To email address is taken from the textbox
                msg.To.Add(TextBox1.Text);
                //Email Subject is written
                msg.Subject = " Recover your Password";
                // Email Body is written
                msg.Body = ("Your Username is:" + username + "<br/><br/>" + "Your Password is:" + password);
                msg.IsBodyHtml = true;

                //This variable is useful for sending the email programmatically through C#
                SmtpClient smt = new SmtpClient();
                smt.UseDefaultCredentials = true;
                smt.Host = "smtp.gmail.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();

                ntwd.UserName = "arshilpotter@gmail.com"; //Email ID  
                ntwd.Password = "apeofhobbit123"; // Password  
               
                // Set the ports and network credentials for sending the message
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                //Send the email
                smt.Send(msg);
                // Populate the label tag 
                Label1.Text = "Username and Password Sent Successfully";
                Label1.ForeColor = System.Drawing.Color.ForestGreen;
            }





        }

        // Link Button for redirecting to Login Page

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}