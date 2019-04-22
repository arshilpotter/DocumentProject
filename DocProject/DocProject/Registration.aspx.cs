using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DocProject
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SQL Connection is established 
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;");
            {
                con.Open();
                //insert user values into database
                SqlCommand cmd = new SqlCommand("insert into [DocProj].[dbo].[User_Info] values(@un,@pwd,@age,@gender,0,0,@email)", con);
                //Parameters are declared for variables
                cmd.Parameters.AddWithValue("un", TextBox1.Text);
                cmd.Parameters.AddWithValue("pwd", TextBox5.Text);
                
                cmd.Parameters.AddWithValue("age", TextBox4.Text);
                cmd.Parameters.AddWithValue("email", Tmail.Text);
                cmd.Parameters.AddWithValue("gender", RadioButtonList1.SelectedValue);
                cmd.ExecuteNonQuery();
                //All the controls are set to empty after the button is clicked
                TextBox1.Text = "";
              
                RadioButtonList1.SelectedValue = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                Tmail.Text = "";
                TextBox1.Focus();

            }

        }
        //Login Page redirection
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}