<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportGen.aspx.cs" Inherits="DocProject.ReportGen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>


     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>


  <%--The style tag has Css code for Navigation Bar and centering the Calendar--%>

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
   

.p1{
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
                <asp:HyperLink ID="HyperLink3" runat="server">Generate Reports</asp:HyperLink>
                
 
             <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://localhost:1077/AdminRequestsApproval.aspx" >User Requests</asp:HyperLink>
 <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://localhost:1077/Login.aspx" >Logout</asp:HyperLink>

</div>


           <%--Add Calendar control--%>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" CssClass="p1" Height="143px" Width="211px"></asp:Calendar>
        
        
        <div class="d1">
           
             <%--panelPDF is created to read its contents in the backend--%>

            <asp:Panel ID="panelPDF" runat="server">

<h1>Report</h1>
       
                
                 <%-- Table is created for displaying report--%>
 <table border="1">
  <tr>
    <th>Individual Users Per Day</th>
    <th>Successful Searches per Day</th>
    <th>Un-Successful Searches per Day</th>
      <th>Weekly Documents Added</th>
      <th>Weekly Documents Deleted</th>
  </tr>

      <%--Labels holds the values which gets from the backend--%>
  <tr>
    <td>  <asp:Label ID="Label2" runat="server"></asp:Label></td>
    <td> <asp:Label ID="Label3" runat="server"></asp:Label></td>
    <td>  <asp:Label ID="Label4" runat="server"></asp:Label></td>
      <td> <asp:Label ID="Label5" runat="server"></asp:Label></td>
      <td>  <asp:Label ID="Label6" runat="server"></asp:Label></td>
  </tr>
  
</table>      
          
            </asp:Panel>
        </div>
         <%--Download Button is created--%>
        <asp:Button ID="Button1" runat="server" Text="Download" OnClick="Button1_Click" />
    </form>
</body>
</html>
