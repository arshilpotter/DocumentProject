using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocProject
{
    public partial class ReportGen : System.Web.UI.Page
    {
        // This is a connection string variable for converting to the database
        string conStr = @"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // This button gets fired when user clicks Download button

        protected void Button1_Click(object sender, EventArgs e)
        {

            // Setting the response type as pdf which is the file that is going to download
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition","attachment;filename=report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            //  String Writer and Html Writer are used for writing html and string to the pdf Doc
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //The html content inside panelPDF loads into HTMLtextwriter 
            panelPDF.RenderControl(hw);
           
            StringReader sr = new StringReader(sw.ToString());
            //Creating a downloadable Document and setting the pagesize 
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            // PdfWriter gets the data from stream and converts to html
            PdfWriter.GetInstance(pdfDoc,Response.OutputStream);

            // Opens the document
            pdfDoc.Open();
            // Parses from String Reader
            htmlParser.Parse(sr);
            // close document
            pdfDoc.Close();

           // The output is written to PdfDoc
            Response.Write(pdfDoc);
            Response.End();

             

        }

       
        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }


        // The event gets triggered if a value in the Calendar gets selected
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            // Gets the entered date by user
            String dt = Calendar1.SelectedDate.ToShortDateString();

            //The string date is broken down to day month and year and the day is converted to integer
            String []dayscounter = dt.Split('/');
            // daystart holds the value for the first day of a week where as the current value is the last day in a week
            int daystart = Convert.ToInt32(dayscounter[dayscounter.Length - 2]) - 6;

            // SQL connection is created and opened
            using (SqlConnection cn2 = new SqlConnection(conStr))
            {
                cn2.Open();



                //SQL Query for number of individual users per day
                String query1 = " select count(UserID) from (select distinct UserID from [DocProj].[dbo].[SearchTable] where [Date]=@date) as UID;";
                // Executing SQL Command and diaplay the values from the query in the label tag
                using (SqlCommand command2 = new SqlCommand(query1, cn2))
                {
                    command2.Parameters.Add("@date", SqlDbType.Date).Value = dt;

                    using (SqlDataReader reader2 = command2.ExecuteReader())
                    {
                        while(reader2.Read())
                        {
                              Label2.Text = reader2[0].ToString();
                              


                        } 
                    }
                }



                //SQL Query for number of successful searches per day

                String query2 = " select count(Search) from [DocProj].[dbo].[SearchTable] where Search=1 and [Date]=@date";
                // Executing SQL Command and diaplay the values from the query in the label tag
                using (SqlCommand command2 = new SqlCommand(query2, cn2))
                {
                    command2.Parameters.Add("@date", SqlDbType.Date).Value = dt;

                    using (SqlDataReader reader2 = command2.ExecuteReader())
                    {
                        while (reader2.Read())
                        {
                            Label3.Text = reader2[0].ToString();



                        }
                    }
                }







                //SQL Query for number of Unsuccessful searches per day
                String query3 = "  select count(Search) from [DocProj].[dbo].[SearchTable] where Search=0 and [Date]=@date";
                // Executing SQL Command and diaplay the values from the query in the label tag
                using (SqlCommand command2 = new SqlCommand(query3, cn2))
                {
                    command2.Parameters.Add("@date", SqlDbType.Date).Value = dt;

                    using (SqlDataReader reader2 = command2.ExecuteReader())
                    {
                        while (reader2.Read())
                        {
                            Label4.Text = reader2[0].ToString();



                        }
                    }
                }

                // Labels are declared to empty string values for further string concatenations

                Label5.Text = "";
                Label6.Text = "";

                //SQL Query for the list of titles that are added to the database

                String query4 = " select Title from [DocProj].[dbo].[Doc_Table] where [Date]  between  '04/"+daystart+"/2019' and @date";
                // Executing SQL Command and diaplay the values from the query in the label tag
                using (SqlCommand command2 = new SqlCommand(query4, cn2))
                {
                    command2.Parameters.Add("@date", SqlDbType.Date).Value = dt;

                    using (SqlDataReader reader2 = command2.ExecuteReader())
                    {
                        while (reader2.Read())
                        {
                            Label5.Text = Label5.Text + " " + reader2[0].ToString();

                          

                        }
                    }
                }






                //SQL Query for the list of titles that are deleted to the database

                String query5 = " select Title from [DocProj].[dbo].[Delete_Table] where [Date]  between  '04/" + daystart + "/2019' and @date";
                // Executing SQL Command and diaplay the values from the query in the label tag
                using (SqlCommand command2 = new SqlCommand(query5, cn2))
                {
                    command2.Parameters.Add("@date", SqlDbType.Date).Value = dt;

                    using (SqlDataReader reader2 = command2.ExecuteReader())
                    {
                        while (reader2.Read())
                        {
                            Label6.Text = Label6.Text + " " + reader2[0].ToString();



                        }
                    }
                }






            }



               
            }
    }
}