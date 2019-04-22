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
    public partial class WebForm1 : System.Web.UI.Page
    {
        String []kw = new String[4];
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
                using (SqlCommand command6 = new SqlCommand("Select [Status] from [DocProj].[dbo].[User_Info] where [Username]='"+userid+"'", connect))
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
                                Label1.Visible = true;
                                FileUpload1.Visible = true;
                                Button2.Visible = true;
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
                                Label1.Visible = false;
                                FileUpload1.Visible = false;
                                Button2.Visible = false;
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
        }

        // This function gets called when Upload button is clicked

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id = 0;
            // variables are declared for storing ranked words and their frequencies and date.

            string[] words = new string[10];
            int[] freq = new int[10];
            string text = "";
            DateTime today = DateTime.Today;
            DateTime dateTime = DateTime.UtcNow.Date;

            //Different variables are declared for storing filepaths, filenames and extensions

            string filePath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filePath);
            string ext = Path.GetExtension(filename);
            string contenttype = String.Empty;
            byte[] documentContent = null;
            byte[] titletext = System.Text.Encoding.UTF8.GetBytes(filename);

            /* Reading the document varies according to the extension. Therefore, the following condition is for 
            reading the txt file*/
            string filename2 = Path.GetFileName(FileUpload1.FileName);

            if (ext == ".txt")
            {
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                documentContent = br.ReadBytes((Int32)fs.Length);
                text = Encoding.UTF8.GetString(documentContent, 0, documentContent.Length);
            }
            Application application = new Application();

            /* This if statements are for reading word files*/
            if (ext == ".doc" || ext == ".docx")
            {
               
                FileUpload1.SaveAs(Server.MapPath("~/") + filename2);
                Document document= application.Documents.Open(Server.MapPath("~/") + filename2);

                //  Document document = application.Documents.Open("C:\\Users\\pumpk\\Desktop\\Docs\\" + filePath);
                int count = document.Words.Count;

                for (int j = 1; j <= count; j++)
                {
                    // Words from document are stored in a string
                    text = text + " " + document.Words[j].Text;

                }
                // String data content is converted to byte array

                documentContent = System.Text.Encoding.UTF8.GetBytes(text);


               


            }

            /* The processing function is called to return the top 10 words with highest frequencies where
             the byte array document content is passed as an argument*/

            IDictionary<string, int> rank = processing(documentContent);
            int i = 0;

            /* Values returned from the function are stored in the rank variable of dictionary type which is further 
            stored in two different array variables of words and frequencies. This is done because the process gets
             easier while inserting these values into database*/

            foreach (KeyValuePair<string, int> item in rank)
            {
                freq[i] = item.Value;
                words[i] = item.Key;
                i++;
            }

            //SQL Connection is established to insert the data into database

            using (SqlConnection cn = new SqlConnection(conStr))
            {
                //SAVEDOCKUMENT is stored procedure for inserting the document into the database.

                SqlCommand cmd = new SqlCommand("SAVEDOCKUMENT", cn);

                // This is a query string for inserting the top 10 words into the database with their frequency and documentID
                String query = "INSERT INTO [DocProj].[dbo].[WordTable] (word,frequency,Doc_ID) VALUES (@word,@frequency,@Doc_ID)";


                // SqlCommand cmd2 = new SqlCommand("SAVEWORD", cn);
                /*Doc, Title and Date values are passed to the stored procedure for the insertion into the database
                 and the query gets executed*/
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Doc", SqlDbType.VarBinary).Value = documentContent;
                cmd.Parameters.Add("@Title", SqlDbType.VarBinary).Value = titletext;
                cmd.Parameters.Add("@Date", SqlDbType.Date).Value = dateTime;
                cn.Open();
                cmd.ExecuteNonQuery();
                //var doci = returnParameter.Value;

                /* Document ID is pulled from the table and stored in id variable. This is done to store the
                Doc_ID(Foreign Key) variable in the WordsTable*/

                using (SqlCommand command = new SqlCommand("SELECT ID FROM Doc_Table", cn))
                {

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string var = reader[0].ToString();
                            id = Int32.Parse(var);

                        }
                    }
                }


                // Insertion of words into database happens. For loop is for top 10 variables  
                for (int j = 0; j < 10; j++)
                {
                    using (SqlCommand command2 = new SqlCommand(query, cn))
                    {

                        // Check Error


                        //command2.CommandType = CommandType.StoredProcedure;
                        command2.Parameters.Add("@word", SqlDbType.VarChar).Value = words[j];
                        command2.Parameters.Add("@frequency", SqlDbType.Int).Value = freq[j];
                        command2.Parameters.Add("@Doc_ID", SqlDbType.Int).Value = id;
                        command2.ExecuteNonQuery();

                    }
                }






            }

            application.Quit();

        }


        // This is the function which processes the data and gives the top 10 words with frequencies

        protected IDictionary<string, int> processing(byte[] documentContent)
        {
            IDictionary<string, int> Ranks = new Dictionary<string, int>();
            string inputString = Encoding.UTF8.GetString(documentContent, 0, documentContent.Length);

            // Data is converted to lower case letters so that the data is uniform.
            inputString = inputString.ToLower();

            // Some special characters are stripped from the data 

            string[] stripChars = { ";", ",", ".", "-", "_", "^", "(", ")", "[", "]",
                        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "\n", "\t", "\r" };
            foreach (string character in stripChars)
            {
                inputString = inputString.Replace(character, "");
            }

            // Split on spaces into a List of strings
            List<string> wordList = inputString.Split(' ').ToList();

            // Define and remove stopwords
            string[] stopwords = new string[] { "a", "about", "above", "after", "again", "against", "all", "am", "an", "and", "any", "are", "as", "at", "be", "because", "been", "before", "being", "below", "between", "both", "but", "by", "could", "did", "do", "does", "doing", "down", "during", "each", "few", "for", "from", "further", "had", "has", "have", "having", "he", "he'd", "he'll", "he's", "her", "here", "here's", "hers", "herself", "him", "himself", "his", "how", "how's", "i", "i'd", "i'll", "i'm", "i've", "if", "in", "into", "is", "it", "it's", "its", "itself", "let's", "me", "more", "most", "my", "myself", "nor", "of", "on", "once", "only", "or", "other", "ought", "our", "ours", "ourselves", "out", "over", "own", "same", "she", "she'd", "she'll", "she's", "should", "so", "some", "such", "than", "that", "that's", "the", "their", "theirs", "them", "themselves", "then", "there", "there's", "these", "they", "they'd", "they'll", "they're", "they've", "this", "those", "through", "to", "too", "under", "until", "up", "very", "was", "we", "we'd", "we'll", "we're", "we've", "were", "what", "what's", "when", "when's", "where", "where's", "which", "while", "who", "who's", "whom", "why", "why's", "with", "would", "you", "you'd", "you'll", "you're", "you've", "your", "yours", "yourself", "yourselves" };
            foreach (string word in stopwords)
            {
                //Stop words are removed
                while (wordList.Contains(word))
                {
                    wordList.Remove(word);
                }
            }

            // Create a new Dictionary object
            Dictionary<string, int> dictionary = new Dictionary<string, int>();

            // Loop over all over the words in our wordList...
            foreach (string word in wordList)
            {
                // If the length of the word is at least three letters...
                if (word.Length >= 3)
                {
                    // ...check if the dictionary already has the word.
                    if (dictionary.ContainsKey(word))
                    {
                        // If we already have the word in the dictionary, increment the count of how many times it appears
                        dictionary[word]++;
                    }
                    else
                    {
                        // Otherwise, if it's a new word then add it to the dictionary with an initial count of 1
                        dictionary[word] = 1;
                    }

                } // End of word length check

            } // End of loop over each word in our input

            // Create a dictionary sorted by value (i.e. how many times a word occurs)
            var sortedDict = (from entry in dictionary orderby entry.Value descending select entry).ToDictionary(pair => pair.Key, pair => pair.Value);

            // Loop through the sorted dictionary and output the top 10 most frequently occurring words
            int count = 1;

            foreach (KeyValuePair<string, int> pair in sortedDict)
            {
                // Output the most frequently occurring words and the associated word counts

                Ranks.Add(pair.Key, pair.Value);
                count++;

                // Only display the top 10 words then break out of the loop!
                if (count > 10)
                {
                    count = 1;
                    break;
                }
            }

            return Ranks;
        }


        // This function gets called when View button is clicked

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            

            /* The DocID value of a particular row is stored in firstCellText variable.*/
            var closeLink = (Control)sender;
            GridViewRow row = (GridViewRow)closeLink.NamingContainer;
            string firstCellText = row.Cells[0].Text;
        
            int i = 0;
            String[] word = new String[10];
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

                            word[i] = (i + 1) + ". " + reader[0].ToString() + "\n";

                            i++;

                        }
                    }
                }
            }

            /*labelt is a label which is present in the User Interface side. The label text is dynamically 
            populated with the top 10 words*/

            labelt.Text = "";
            for (int k = 0; k < 10; k++)
            {
                labelt.Text = labelt.Text + word[k];

            }
            /*This is for starting a javascript function on the front end*/
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            
        }
    

 // This function gets executed when user hits serach button

        protected void Button4_Click(object sender, EventArgs e)
        {
            int searchchecker = 0;
            // conection string for database connection
            string conStr2 = @"Data Source=DESKTOP-QITDMUU;Database=DocProj;Integrated Security=true;";
            // Current date is recorded in a variable
            DateTime today = DateTime.Today;
            DateTime dateTime = DateTime.UtcNow.Date;
            //The data from Textbox is converted to string
            String var = TextBox1.Text.ToString();
            int x = 0;
            // the string data from the textbox is split according to the spaces to get multiple keywords
            string[] keywords = Regex.Split(var, "\\s+", RegexOptions.IgnoreCase);
           
            string[] word = new string[keywords.Length];
            string[] frequency = new string[keywords.Length];
            //Sql connection is cretaed for using the dataabse
            using (SqlConnection cn2 = new SqlConnection(conStr2))
            {
                cn2.Open();
                for (int counter = 0; counter < keywords.Length; counter++)
                {
                    //Writing a query to get the search keyword and it's frequency  from database if it matches with the keyword typed
                    String query2 = "Select [search_word], [frequency] from [DocProj].[dbo].[SearchWord] where @sw = [search_word]";
                    // Executing SQL Command and store the values from the query in the variables word and frequency
                    using (SqlCommand command2 = new SqlCommand(query2, cn2))
                    {
                        command2.Parameters.Add("@sw", SqlDbType.VarChar).Value = keywords[counter];

                        using (SqlDataReader reader2 = command2.ExecuteReader())
                        {
                            do
                            {
                                try
                                {
                                    word[counter] = reader2[0].ToString();
                                    frequency[counter] = reader2[1].ToString();
                                }
                                catch (InvalidOperationException ee) { ee.GetType(); }


                            } while (reader2.Read());
                        }
                    }
                }
                // Storing UserID in a cookie
                HttpCookie UserCookie = new HttpCookie("Userkey");
                UserCookie.Value = var;
               
                Response.Cookies.Add(UserCookie);
                // Iterating through all the typed key words by the user
                for (int counter = 0; counter < keywords.Length; counter++)
                {
                    //Inserting the new records of keywords into the database if the word does not exist in the databse
                    if (string.IsNullOrEmpty(word[counter]))
                    {
                        using (SqlCommand command3 = new SqlCommand("INSERT INTO [DocProj].[dbo].[SearchWord] ([search_word],[frequency],[temp]) VALUES (@searchword,@frequencie,'1')", cn2))
                        {
                            command3.Parameters.Add("@searchword", SqlDbType.VarChar).Value = keywords[counter];
                            command3.Parameters.Add("@frequencie", SqlDbType.Int).Value = 1;

                            command3.ExecuteNonQuery();
                            x++;

                        }
                    }
                    //Updates the frequqncy in the database if the record exists
                    else
                    {
                        using (SqlCommand command3 = new SqlCommand("update [DocProj].[dbo].[SearchWord] set [frequency]=[frequency]+1,[temp]='1' where [search_word]=@searchword2", cn2))
                        {
                            command3.Parameters.Add("@searchword2", SqlDbType.VarChar).Value = word[counter];
                            command3.ExecuteNonQuery();
                        }

                    }
                }



                // Extracting the data from the database by checking if the word exists inside the document and rank them by the frequencies of words
                using (SqlCommand command4 = new SqlCommand())
                {
                    command4.CommandText = "SELECT A.[ID], A.[Title] FROM [Doc_Table] A,[SearchWord] B WHERE ( (B.[temp]='1') AND (B.[search_word]!='') AND (A.[Doc] LIKE '%'+' '+B.[search_word]+' '+'%') AND (A.[Active]=1)) group by A.[ID], A.[Title] order by sum(B.[frequency]) desc";
                    command4.Connection = cn2;
                    DataTable dt = new DataTable();
                    //Result is filled on Gridview which displays the output
                    using (SqlDataAdapter sda = new SqlDataAdapter(command4))
                    {
                        
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0) { searchchecker = 1; }
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }


                }

                //A temporary field is set to zero after the task completion
                using (SqlCommand command5 = new SqlCommand("UPDATE [DocProj].[dbo].[SearchWord] set temp='0' where temp='1'", cn2))
                {

                    command5.ExecuteNonQuery();
                }
                String uid = Request.Cookies["User3"].Value;

                //Inserts the current date into the database
                using (SqlCommand command6 = new SqlCommand("INSERT INTO [DocProj].[dbo].[SearchTable](Date,UserID,Search) values(@date,@uid,@search)", cn2))
                {
                  
                  command6.Parameters.Add("@search", SqlDbType.Bit).Value = searchchecker;
                    command6.Parameters.Add("@uid", SqlDbType.NChar).Value = uid;
                    command6.Parameters.Add("@date", SqlDbType.Date).Value = dateTime;
                    command6.ExecuteNonQuery();
                }

            }
        }

       
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Rowcommand 'a' is for displaying document
            if (e.CommandName == "a")
            {
                //Gets the DocID and stores it in firstCellText
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string firstCellText = row.Cells[0].Text;

                //Cookie is created and the DocID is assigned to "User"
                HttpCookie UserCookie = new HttpCookie("User");
                UserCookie.Value = firstCellText;
                UserCookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(UserCookie);



                //Now the web page directs to new page for displaying document 

                Response.Redirect("WebForm2.aspx");

            }

            // Rowcommand 'a' is for displaying Wordcloud
            if (e.CommandName == "b")
            {
                //Gets the DocID and stores it in firstCellText
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string firstCellText = row.Cells[0].Text;
                HttpCookie UserCookie = new HttpCookie("User2");
                UserCookie.Value = firstCellText;
                UserCookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(UserCookie);
                //Now the web page directs to new page for displaying wordcloud 
                Response.Redirect("WebForm3.aspx");
            }

           
               
        }

       
      
       
    }


        
}