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
    public partial class WebForm2 : System.Web.UI.Page
    {
        // Assigning connectionstring to a variable
        string conStr1 = @"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;";
      

       
        // When the web page loads the following function gets executed
        protected void Page_Load(object sender, EventArgs e)
        {




            using (SqlConnection connect = new SqlConnection(conStr1))
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



            //Get the DocID from Cookie
            String firstCellText = Request.Cookies["User"].Value;
            //Get Keywords from Cookie
            String kw = Request.Cookies["UserKey"].Value;
            //Creating keywords for storing the words by splitting the string on space
            string[] keywords = Regex.Split(kw, "\\s+", RegexOptions.IgnoreCase);
            //Creating a dummy array with max length 
            string[] kwords = new string[4];

            // Assigning the keywords to kwords array
            for (int temporary = 0; temporary < 4; temporary++)
            {
                kwords[temporary] = "";
            }
            for (int temporary2 = 0; temporary2 < keywords.Length; temporary2++)
            {
                kwords[temporary2] = keywords[temporary2];
            }

                
            //Literal control is rendered
            Literal1.Mode = LiteralMode.Encode;
            Literal1.Mode = LiteralMode.PassThrough;
            Literal1.Mode = LiteralMode.Transform;
            int i = 0;
            //Data variable is declared which stores the actual document contents
            String data="";
            // variables are declared for storing ranked words
            String[] word = new String[10];
            //SQL Connection is established to select the words and document contents from database
            using (SqlConnection cn = new SqlConnection(conStr1))
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
                    data = data + "";
                }
                //This SqlCommand selects the actual document from the database and the ranked words in the document gets highlighted with colors due to a mark html style tag in the sql query  
                using (SqlCommand command3 = new SqlCommand("select REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((Select Doc from [DocProj].[dbo].[Doc_Table] where ID=@id) , @key1 , '<mark style=\"background-color:'+@color1+'\">'+@key1+'</mark>' ), @key2 , '<mark style=\"background-color:'+@color2+'\">'+@key2+'</mark>' ), @key3 , '<mark style=\"background-color:'+@color3+'\">'+@key3+'</mark>' ),  @key4 , '<mark style=\"background-color:'+@color4+'\">'+@key4+'</mark>' ),  @key5 , '<mark style=\"background-color:'+@color5+'\">'+@key5+'</mark>' ),  @key6 , '<mark style=\"background-color:'+@color6+'\">'+@key6+'</mark>' ),  @key7 , '<mark style=\"background-color:'+@color7+'\">'+@key7+'</mark>' ),  @key8 , '<mark style=\"background-color:'+@color8+'\">'+@key8+'</mark>' ), @key9 , '<mark style=\"background-color:'+@color9+'\">'+@key9+'</mark>' ), @key10 , '<mark style=\"background-color:'+@color10+'\">'+@key10+'</mark>' ), @key11 , '<mark style=\"background-color:'+@color11+'\">'+@key11+'</mark>' ), @key12 , '<mark style=\"background-color:'+@color12+'\">'+@key12+'</mark>' ), @key13 , '<mark style=\"background-color:'+@color13+'\">'+@key13+'</mark>' ), @key14 , '<mark style=\"background-color:'+@color14+'\">'+@key14+'</mark>' )", cn))
                {   //Assigns DOCID and words to parameters
                    command3.Parameters.Add("@id", SqlDbType.VarChar).Value = firstCellText;
                    command3.Parameters.Add("@key1", SqlDbType.VarChar).Value = word[0];
                    command3.Parameters.Add("@key2", SqlDbType.VarChar).Value = word[1];
                    command3.Parameters.Add("@key3", SqlDbType.VarChar).Value = word[2];
                    command3.Parameters.Add("@key4", SqlDbType.VarChar).Value = word[3];
                    command3.Parameters.Add("@key5", SqlDbType.VarChar).Value = word[4];
                    command3.Parameters.Add("@key6", SqlDbType.VarChar).Value = word[5];
                    command3.Parameters.Add("@key7", SqlDbType.VarChar).Value = word[6];
                    command3.Parameters.Add("@key8", SqlDbType.VarChar).Value = word[7];
                    command3.Parameters.Add("@key9", SqlDbType.VarChar).Value = word[8];
                    command3.Parameters.Add("@key10", SqlDbType.VarChar).Value = word[9];
                    command3.Parameters.Add("@key11", SqlDbType.VarChar).Value = kwords[0];
                    command3.Parameters.Add("@key12", SqlDbType.VarChar).Value = kwords[1];
                    command3.Parameters.Add("@key13", SqlDbType.VarChar).Value = kwords[2];
                    command3.Parameters.Add("@key14", SqlDbType.VarChar).Value = kwords[3];

                    //Assigns colors to parameters
                    command3.Parameters.Add("@color1", SqlDbType.VarChar).Value = "red";
                    command3.Parameters.Add("@color2", SqlDbType.VarChar).Value = "yellow";
                    command3.Parameters.Add("@color3", SqlDbType.VarChar).Value = "orange";
                    command3.Parameters.Add("@color4", SqlDbType.VarChar).Value = "green";
                    command3.Parameters.Add("@color5", SqlDbType.VarChar).Value = "aqua";
                    command3.Parameters.Add("@color6", SqlDbType.VarChar).Value = "pink";
                    command3.Parameters.Add("@color7", SqlDbType.VarChar).Value = "ivory";
                    command3.Parameters.Add("@color8", SqlDbType.VarChar).Value = "gainsboro";
                    command3.Parameters.Add("@color9", SqlDbType.VarChar).Value = "cornsilk";
                    command3.Parameters.Add("@color10", SqlDbType.VarChar).Value = "seashell";
                    command3.Parameters.Add("@color11", SqlDbType.VarChar).Value = "purple";
                    command3.Parameters.Add("@color12", SqlDbType.VarChar).Value = "maroon";
                    command3.Parameters.Add("@color13", SqlDbType.VarChar).Value = "olive";
                    command3.Parameters.Add("@color14", SqlDbType.VarChar).Value = "navy";



                    //The data read from query execution is stored in data variable
                   // try
                    //{
                        using (SqlDataReader reader = command3.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                data = data + reader[0].ToString();

                            }
                        }
                    //}
                   // catch(Exception e) { e.GetType(); }




                }
            }



            //Literal1 control gets assigned with data variable
            data = data + "\"";
            Literal1.Text = data;

        
        }

  
      
    }
}