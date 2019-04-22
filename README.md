# DocumentProject
CSC 7135 Software Engineering Project




CSC 7135 Software Engineering final project. Web application for uploading and parsing text and word documents, find frequent words and color code alongside creating word cloud for those words. Also Implemented a search bar to search the documents. The User "Admin" has more properties than the regular user. If you are running this project register with user name :"Admin" to access adminstrator previligies.

This is an ASP.NET Web Forms project. Inorder to run this application on the cloud, you need to use paid Microsoft Azure account. Also, keep in mind that we used SQL database. The database consists of Doc_Table, SearchTable, Delete_Table, SearchWord, User_Info and WordTable tables. Doc_Table has {(ID,int) PK,(Doc,varchar(MAX)),(Title,varchar(MAX)),(Date,date),(Active,bit)} fields, Delete_Table has {(DocID,int) PK,(Title,varchar(MAX)),(Date,date)} fields, User_Info has {(Username,varchar(MAX)) PK,(Password,varchar(MAX)),(Age,int),(Gender,bit),(Status,bit),(Request,bit),(email,email)}, SearchTable has {(SearchID,int) PK,(Date,date),(Search,bit),(UserID,varchar(MAX)) FK [REFERENCE to User_Info table with Username column] }, WordTable has {(word,varchar(MAX)),(frequency,int),(Doc_Id, int) FK [REFERENCE to Doc_Table with ID column],(WID,int) PK}, SearchWord has{(search_word,varchar(MAX)) PK,(frequency,int),(temp,bit)} fields.
