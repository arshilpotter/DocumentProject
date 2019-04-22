<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DocProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <%--The style tag has Css code for Navigation Bar and Buttons in the whole web page--%>
<style>

     
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
   

  .textbox { 
     width:40%;
     border:1px solid #aaa;
     border-radius:3px;
     outline:none;
     padding:5px;
     box-sizing:border-box;
     transition:.2s;
    
  }

  .textbox:focus{
      border-color:dodgerblue;
      box-shadow: 0 0 4px 0 dodgerblue;
  }

  .b1{
       background-color: #f4511e;
  border: 1px solid;
  color: white;
  border-radius:5px;
  padding: 12px 28px;
  text-align: center;
  font-size: 16px;

  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  }

  .b1:hover{
      opacity:1;
  }




   .b2{
       background-color: #f4511e;
  border: 1px solid;
  color: white;
  border-radius:5px;
  padding: 12px 28px;
  text-align: center;
  font-size: 16px;
  
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  }

  .b2:hover{
      opacity:1;
  }




    </style>

</head>
<body style="height: 595px">

 


       


    <form id="form1" runat="server">
         <%--Add Hyperlinks on the navbar--%>

         <div class="navbar" >
             <h1 style="color:cornflowerblue">Document Project</h1>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://localhost:1077/WebForm1.aspx">Add and Search Documents</asp:HyperLink>
             <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://localhost:1077/DeleteDoc.aspx">Delete Documents</asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" runat="server"  NavigateUrl="http://localhost:1077/ReportGen.aspx">Generate Reports</asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="http://localhost:1077/WebForm1.aspx" >Search Documents</asp:HyperLink>
 
             <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://localhost:1077/AdminRequestsApproval.aspx" >User Requests</asp:HyperLink>
 <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://localhost:1077/Login.aspx" >Logout</asp:HyperLink>

</div>



        <div class="container">

            <%--This is just a text label for displaying "File Location"--%>
           

            <%--FileUpload is used to upload the actual file--%>
              
  


            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
            <br />
            <br />
            <br />
           
             <%-- The text box is a search bar for user to type in --%>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>

             <%-- The Button event actually helps in displaying the data as the backend code gets triggered theough OnClick --%>
            
            <asp:Button ID="Button4" runat="server" Text="Search" CssClass="b1" OnClick="Button4_Click" />

             <%-- RequiredFieldValidator checks if the user entered the words in the textbox or not if not it displays an error message --%> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter keyword(s)"></asp:RequiredFieldValidator>
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <br />

             <%-- RequiredFieldValidator checks if the the input is one to four keywords or not. A regular expression is used to check the condition. --%> 
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="You can only enter 1-4 words" ValidationExpression="^[A-Za-z0-9_]+(\s*)$|^[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)$|^[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)$|^[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)[A-Za-z0-9_]+(\s*)$"></asp:RegularExpressionValidator>
            <br />
            <br />
             <asp:Label ID="Label1" runat="server" Text="File Location"></asp:Label>
            <p>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass=""/>
            </p>
            <p>
               <%-- Save button saves the content in the database and also calcualtes the top 10 words and saves it in 
                the database--%>
                <asp:Button ID="Button2" runat="server" CssClass="b1" OnClick="Button2_Click" Text="Save" Width="122px"/>

               <%-- Gridview  is used to populate the ID, Title and View Ranks for each Document--%>

            </p>
            <p>
                &nbsp;</p>
            <p>

                <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" DataKeyNames="ID" Width="341px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowcommand="GridView1_RowCommand" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Height="208px" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                               
                                <%--<asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="GridView1_SelectedIndexChanged"></asp:LinkButton>--%>
                              <%-- The onClick attribute calls GridView1_SelectedIndexChanged in the backend to get the words from
                                database--%>
                                <asp:Button ID="Button3" runat="server" Text="View" onClick="GridView1_SelectedIndexChanged" />
                                

                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                         <%-- Buttons for displaying Document and Word Cloud--%>
                          
                        <asp:ButtonField ButtonType="Button" CommandName="a" Text="Doc" />
                        <asp:ButtonField ButtonType="Button" CommandName="b" Text="WC" />
                               
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <%--This is the datasource to which the gridview is connected--%>
               
                &nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <%--<div id="divHtmlContent" runat="server" visible="false">
    </div>--%>
            <p>
                &nbsp;
            </p>
           <%-- Modal is a special dialog box designed to display the top 10 words. The dialog is divided to
            Header, Content and Footer. --%>
        </div>
        <div>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Words Ranked</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">

                                <%--The label ID labelt is used in the backend to populate the data with words--%> 
                                <asp:Label ID="labelt" runat="server"></asp:Label>


                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--JavaScript function for executing the modal dialog box--%>
                <script type='text/javascript'>
                    function openModal() {
                        $('[id*=myModal]').modal('show');
                    }
                </script>
            </div>
        </div>


    </form>



</body>
</html>
