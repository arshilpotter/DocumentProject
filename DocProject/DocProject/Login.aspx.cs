using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DocProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SQL Connection is established 
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;");
            {
                
                Label3.Text = "";
                con.Open();
                //This SQL command compares the log in credentials with the values in database for authentication
                SqlCommand cmd = new SqlCommand("select * from [DocProj].[dbo].[User_Info] where [Username]=@un and [Password]=@pwd", con);
                cmd.Parameters.AddWithValue("un", TextBox1.Text);
                cmd.Parameters.AddWithValue("pwd", TextBox2.Text);
                /* If the match exists then data readers holds the record of userinfo which indicates that login is sucessful otherwise 
                it displays error message*/
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    HttpCookie UserCookie = new HttpCookie("User3");
                    UserCookie.Value = TextBox1.Text;
                    Response.Cookies.Add(UserCookie);
                    rd.Read();
                    Label3.Text = "Login successful.";
                    Label3.Visible = true;
                    Boolean var = rd.GetBoolean(5);
                    // If the user is an admin or approved user he gets directed to add and search page
                    if (TextBox1.Text == "Admin" ||var==true) {
                        Response.Redirect("WebForm1.aspx"); }
                    // If it is a new user then he gets redirected to a page to make the acess request to Admin
                    else { Response.Redirect("UserAccessPage.aspx"); }
                }
                else
                {
                    Label3.Text = "Invalid username or password.";
                    Label3.Visible = true;
                }
                

            }


            
        }
        // Button for redirecting to Registration Page
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        // Button for redirecting to ForgotPassword Page
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}