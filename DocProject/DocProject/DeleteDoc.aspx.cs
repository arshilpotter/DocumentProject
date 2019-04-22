using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocProject
{
    public partial class DeleteDoc : System.Web.UI.Page
    {
        // This is a connection string variable for connevting to the database
        string conStr = @"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;";
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
                              
                                HyperLink6.Visible = false;
                            }
                            else
                            {
                                // These statements satisfy for Rejected Users in the navbar
                                String c = reader[0].ToString();
                              
                                HyperLink1.Visible = false;
                                HyperLink2.Visible = false;
                                HyperLink3.Visible = false;
                                
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




        }

        //If the delete button is clicked the following function gets called

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           // Gets DocID from Gridview
            var closeLink = (Control)sender;
            GridViewRow row = (GridViewRow)closeLink.NamingContainer;
            string firstCellText = row.Cells[0].Text;

            // Get CurrentDate
            DateTime today = DateTime.Today;
            DateTime dateTime = DateTime.UtcNow.Date;
           

            String title = "";

            using (SqlConnection cn2 = new SqlConnection(conStr))
            {
                cn2.Open();
                // Deactivate the document in the database
                using (SqlCommand command6 = new SqlCommand("Update [DocProj].[dbo].[Doc_Table] set [Active]=0 where [ID]= " + firstCellText, cn2))
                {


                    command6.ExecuteNonQuery();
                }

                // The deleted document title is stored in title
                using (SqlCommand command8 = new SqlCommand("select [Title] from [DocProj].[dbo].[Doc_Table] where [ID]= " + firstCellText, cn2))
                {

                    using (SqlDataReader reader = command8.ExecuteReader())
                    {
                        while (reader.Read())

                        {
                            title = reader[0].ToString();

                        }
                    }

                }

                // The date and Title is inserted into the Delete Table database
                using (SqlCommand command7 = new SqlCommand("insert into [DocProj].[dbo].[Delete_Table] ([Title],[Date]) values (@title,@date)", cn2))
                {

                    command7.Parameters.Add("@date", SqlDbType.Date).Value = dateTime;
                    command7.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
                    command7.ExecuteNonQuery();
                }

            }

            // Reload the page to show the changes
            Response.Redirect("DeleteDoc.aspx");



        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }
    }
}