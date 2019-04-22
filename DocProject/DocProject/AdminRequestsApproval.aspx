<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRequestsApproval.aspx.cs" Inherits="DocProject.AdminRequestsApproval" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="365px" Height="196px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                  <%--Datafields for displaying Usernames and Status--%>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                     <%--EditItemTemplate is activated when user clicks edit button--%>
                    <EditItemTemplate>

                         <%--Dropdowns for displaying the status--%>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Status2" DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                        </asp:DropDownList>
                          <%--Data source which is the result of a query that gives the list of status--%>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DocProjConnectionString %>" SelectCommand="SELECT DISTINCT [Status], CASE [Status] WHEN 0 THEN 'Reject' WHEN 1 THEN 'Approve' END AS [Status2]
FROM [User_Info]"></asp:SqlDataSource>
                    </EditItemTemplate>
                      <%--Checkboxes are bound to status. This means approved gets checked and rejected does not--%>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Status") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
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
           </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DocProjConnectionString %>" DeleteCommand="DELETE FROM [User_Info] WHERE [Username] = @Username" InsertCommand="INSERT INTO [User_Info] ([Username], [Status]) VALUES (@Username, @Status)" SelectCommand="SELECT [Username], [Status] FROM [User_Info] WHERE ([Request] = '1')" UpdateCommand="UPDATE [User_Info] SET [Status] = @Status  WHERE [Username] = @Username">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Status" Type="Boolean" />
                <asp:Parameter Name="Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
       
    </form>
</body>
</html>
