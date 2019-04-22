
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
    public partial class WebForm3 : System.Web.UI.Page
    {
        // Assigning connectionstring to a variable
        string conStr = @"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;";

        // When the web page loads the following function gets executed
        protected void Page_Load(object sender, EventArgs e)
        {



            using (SqlConnection connect = new SqlConnection(conStr))
            {
                connect.Open();
                // Get a Cookie which stores UserID value
                String userid = Request.Cookies["User3"].Value;
                // Sql command for the status of an individual user
                using (SqlCommand command6 = new SqlCommand("Select [Status] from [DocProj].[dbo].[User_Info] where [Username]='" + userid + "'", connect))
                {

                    // Reader for reading the status

                    using (SqlDataReader reader = command6.ExecuteReader())
                    {
                        while (reader.Read())

                        {
                            // Checking the if status is true. The following statements are used for making few fields in the nav bar visible according to the user authorizations 
                            if (reader.GetBoolean(0) == true)
                            {
                                // These statements satisfy for Admin and Approved Users in the navbar

                                HyperLink1.Visible = true;
                                HyperLink2.Visible = true;
                                HyperLink3.Visible = false;
                                HyperLink4.Visible = false;
                                HyperLink6.Visible = false;
                            }
                            else
                            {
                                // These statements satisfy for Rejected Users in the navbar
                                String c = reader[0].ToString();
                              
                                HyperLink1.Visible = false;
                                HyperLink2.Visible = false;
                                HyperLink3.Visible = false;
                                HyperLink4.Visible = true;
                                HyperLink6.Visible = false;
                            }
                            if (userid == "Admin") {
                                // These statements satisfy for Admin in the navbar
                                HyperLink6.Visible = true;

                                HyperLink3.Visible = true;
                            }
                        }

                    }
                }

            }

            //Gets Document ID from cookie

            String firstCellText = Request.Cookies["User2"].Value;

            // Renders literal tag
            Literal2.Mode = LiteralMode.Encode;
            Literal2.Mode = LiteralMode.PassThrough;
            Literal2.Mode = LiteralMode.Transform;
            int i = 0;
            //Data variable is declared which stores the actual document contents
            String data = "<center>";
            // variables are declared for storing ranked words
            String[] word = new String[10];
            //SQL Connection is established to select the words and document contents from database
            using (SqlConnection cn = new SqlConnection(conStr))
            {
                cn.Open();

                /* The words are pulled from the WordsTable according to the corresponding DocumentID. This is the
                 reason why firstCellText variable is needed. */

                using (SqlCommand commd = new SqlCommand("SELECT word FROM WordTable where [Doc_ID]=" + firstCellText, cn))
                {

                    using (SqlDataReader reader = commd.ExecuteReader())
                    {
                        while (reader.Read())

                        {
                            /* The result is stored in a words string with size of 10*/

                            word[i] = reader[0].ToString();

                            i++;

                        }
                    }
                    data = data + "<p style=\"color: red; font-size:10px;\">" + word[0] + "</p> <p style=\"color: yellow; font-size:20px;\">" + word[1] + "</p> <p style=\"color: orange; font-size:30px;\">" + word[2] + "</p> <p style=\"color: green; font-size:40px;\">" + word[3] + "</p> <p style=\"color: aqua; font-size:50px;\">" + word[4] + "</p> <p style=\"color: pink; font-size:60px;\">" + word[5] + "</p> <p style=\"color: ivory; font-size:70px;\">" + word[6] + "</p> <p style=\"color: gainsboro; font-size:80px;\">" + word[7] + "</p> <p style=\"color: cornsilk; font-size:90px;\">" + word[8] + "</p> <p style=\"color: seashell; font-size:100px;\">" + word[9] + "</p>";
                }
                //This SqlCommand selects the actual document from the database and the ranked words in the document gets highlighted with colors due to a mark html style tag in the sql query  

            }


            /*
             *<p style="color:blue;font-size:50px;">I am big</p> 
             * 
             *
             */

            //Literal1 control gets assigned with data variable
            data = data + "</center>";
            Literal2.Text = data;


        }




       






    }
}



