using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using Microsoft.Office.Interop.Word;
using Microsoft.Office;
using System.Configuration;
using System.Text.RegularExpressions;
using DataTable = System.Data.DataTable;

namespace DocProject
{
    public partial class UserAccessPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // When the user clicks for requesting the acess for addition and deletion of docs this event gets triggered

        protected void Button1_Click(object sender, EventArgs e)
        {
            // This is a connection string variable for connevting to the database
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;");
            {
                con.Open();
                //Gets Username from Cookie
                String firstCellText = Request.Cookies["User3"].Value;
                
                // Updates the Database table of Userinfo where Request is set to 1 for the user. This means user made a request 
                using (SqlCommand command5 = new SqlCommand("UPDATE [DocProj].[dbo].[User_Info] set Request='1' where Username=@un", con))
                {
                    //un is a parameter which holds username
                    command5.Parameters.Add("@un", SqlDbType.VarChar).Value = firstCellText;
                    command5.ExecuteNonQuery();
                    // Button for requesting docs is made invisible as user made request and the Label is made visible to display Text
                    Button1.Visible = false;
                    Label1.Visible = true;
                }
            }
        }

      
        // When serach Docs button is click this event gets triggered
        protected void Button2_Click1(object sender, EventArgs e)
        {
            // Redirects to the searching Docs page
            Response.Redirect("WebForm1.aspx");
        }
    }
}