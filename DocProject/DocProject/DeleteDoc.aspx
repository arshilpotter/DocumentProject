<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteDoc.aspx.cs" Inherits="DocProject.DeleteDoc" %>

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
       <%--The style tag has Css code for Navigation Bar--%>

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
   




#div1{
    width:600px;
    margin-left:auto;
    margin-right:auto;
}

    </style>







</head>
<body>
    <form id="form1" runat="server">

         <%--Add Hyperlinks on the navbar--%>
       
         <div class="navbar" >
             <h1 style="color:cornflowerblue">Document Project</h1>
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://localhost:1077/WebForm1.aspx">Add and Search Documents</asp:HyperLink>
             <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="http://localhost:1077/DeleteDoc.aspx">Delete Documents</asp:HyperLink>
                   <asp:HyperLink ID="HyperLink3" runat="server"  NavigateUrl="http://localhost:1077/ReportGen.aspx">Generate Reports</asp:HyperLink>
             
  
             <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://localhost:1077/AdminRequestsApproval.aspx" >User Requests</asp:HyperLink>
             <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://localhost:1077/Login.aspx" >Logout</asp:HyperLink>

</div>


<div id="div1">

     <%--GridView holds the actual list of data. It is bound to a sql data source--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" Width="420px" Height="233px">
            <Columns>
                <%--Datafields for displaying the Document titles and ID--%>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                 <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
              
                 <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                      <%--Delete Button for Documents--%>
                            <ItemTemplate>
                                  <asp:Button ID="Button3" runat="server" Text="Delete" onClick="GridView1_SelectedIndexChanged" />
                                

                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                                
            </Columns>
             <%--Styling the gridview with brown sugar color--%>
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
    </div>
         <%--Datasource is a result of SQL from the database which consists of the list of Documents--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DocProjConnectionString %>" SelectCommand="SELECT [ID],[Title] FROM [Doc_Table] WHERE ([Active] = 1)"></asp:SqlDataSource>
    
    
    </form>
</body>
</html>
