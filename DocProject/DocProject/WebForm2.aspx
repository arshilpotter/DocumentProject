<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="DocProject.WebForm2" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>



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
    <%--The style tag has Css code for Navigation Bar in the whole web page--%>
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
   
    

        #l{
            position: absolute;
  left: 0px;
  top: 150px;
        }


         #lk{
            position: absolute;
  left: 0px;
  top: 600px;
        }


        ul {
    margin: 0px;
}

.input-color {
    position: relative;
}
.input-color input {
    padding-left: 20px;
}
.input-color .color-box {
    width: 10px;
    height: 10px;
    display: inline-block;
    background-color: #ccc;
    position: absolute;
    left: 5px;
    top: 5px;
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
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="http://localhost:1077/WebForm1.aspx" >Search Documents</asp:HyperLink>
 
             <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://localhost:1077/AdminRequestsApproval.aspx" >User Requests</asp:HyperLink>
 <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="http://localhost:1077/Login.aspx" >Logout</asp:HyperLink>

</div>


         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
       
     
&nbsp;&nbsp; &nbsp;
         <%--Panel for displaying the ten colors for top ten words--%>

         <div id="l">
             <h3>Colors Ranked according to words </h3>
        <ul>
    <li>
        <div class="input-color">
            <input type="text" value="Red" />
            <div class="color-box" style="background-color: red;"></div>
          
        </div>
    </li>
    <li>
        <div class="input-color">
            <input type="text" value="Yellow" />
            <div class="color-box" style="background-color: yellow;"></div>
           
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Orange" />
            <div class="color-box" style="background-color: orange;"></div>
         
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Yellow" />
            <div class="color-box" style="background-color: yellow;"></div>
      
        </div>
    </li>

   <li>
        <div class="input-color">
            <input type="text" value="Green" />
            <div class="color-box" style="background-color: green;"></div>
          
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Aqua" />
            <div class="color-box" style="background-color: aqua;"></div>
         
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Pink" />
            <div class="color-box" style="background-color: pink;"></div>
           
        </div>
    </li>
 <li>
        <div class="input-color">
            <input type="text" value="Ivory" />
            <div class="color-box" style="background-color: ivory;"></div>
        
        </div>
    </li>

            <li>
        <div class="input-color">
            <input type="text" value="Gainsboro" />
            <div class="color-box" style="background-color: gainsboro;"></div>
  
        </div>
    </li>
    <li>
        <div class="input-color">
            <input type="text" value="Cornsilk" />
            <div class="color-box" style="background-color: cornsilk;"></div>
            
        </div>
    </li>
    <li>
        <div class="input-color">
            <input type="text" value="Seashell" />
            <div class="color-box" style="background-color: seashell;"></div>
           
        </div>
    </li>




</ul>
</div>
     <%--Panel for displaying the ten colors for search words--%>

         <div id="lk">
             <h3>Colors for search words </h3>
        <ul>
    <li>
        <div class="input-color">
            <input type="text" value="Purple" />
            <div class="color-box" style="background-color: purple;"></div>
           
        </div>
    </li>
    <li>
        <div class="input-color">
            <input type="text" value="Maroon" />
            <div class="color-box" style="background-color: maroon;"></div>
           
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Olive" />
            <div class="color-box" style="background-color: olive;"></div>
           
        </div>
    </li>

     <li>
        <div class="input-color">
            <input type="text" value="Navy" />
            <div class="color-box" style="background-color: navy;"></div>
       
        </div>
    </li>
            </ul>
             </div>





    <div class="container">
 
      

  



         <%-- Bootstrap Panel layout for displaying the document --%>
  <div class="panel panel-primary">
       <div class="panel-heading"><h1>Document</h1></div>
    <div class="panel-body">
         <%-- Literal has the contents of the document --%>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
</div>
        </div>

    </form>

</body>
</html>
