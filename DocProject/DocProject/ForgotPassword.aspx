<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="DocProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title></title>

      <%--The style tag has Css code for Navigation Bar and Buttons in the whole web page--%>
    <style type="text/css">  






        
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









.style1  
{  
width: 225px;  
}  
.style2  
{  
width: 155px;  
}  
.style6  
{  
text-align: left;  
font-size: large;  
text-decoration: underline;  
color: #0000FF;  
}  
  
        .auto-style1 {
            text-align: left;
            font-size: large;
            color: #0000FF;
        }




         .b1{
       background-color: #f4511e;
  border: 1px solid;
  color: white;
  border-radius:5px;
  padding: 7px 12px;
  text-align: center;
  font-size: 12px;

  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
  }

  .b1:hover{
      opacity:1;
  }

  
        </style>  
</head>
<body>

     <%--Actual navbar--%>
       <div class="navbar" >
                <h1 style="color:cornflowerblue">Document Project</h1>
               </div>
    <form id="form1" runat="server" style="width: 310px; margin-left: auto; margin-right:auto;">

         <%--Panel is a container for the form--%>
        
         <div class="panel panel-primary">
       <div class="panel-heading"><h1>Forgot Password</h1></div>
    <div class="panel-body">
       
            <div>  
                 <%--Table is created to structure the textboxes, buttons and labels--%>
                <table style="width:100%;">  
                    <caption class="auto-style1">  
                        
                        <br />
                    </caption>  
                    <tr>  
                        <td class="style1">  
   
EmailId:</td>  
                         <%--Textbox for emailID--%>
                        <td class="style2">  
   
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
   
                        </td>  
                        <td>  
 </td>  
                        <td>  
 </td>  
                    </tr>  
                    <tr>  
                        <td class="style1">  
   
                        </td>  
                        <td class="style2">  
&nbsp;</td>  
                        <td>  
                            &nbsp;</td>  
                        <td>  
 </td>  
                    </tr>  
                    <tr>  
                         <%--Link Button for Login page--%>
                        <td class="style1">  
   
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Login</asp:LinkButton>
   
                        </td>  
                         <%--Add submit button send email--%>
                        <td class="style2">  
   
                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="b1" OnClick="Button1_Click" />
   
                        </td>  
                        <td>  
 </td>  
                        <td>  
 </td>  
                    </tr>  
                    <tr>  
                         <%--Label is used to display success message--%>
                       <td class="style1">  
                           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td> 
                        <td class="style2">  
                            &nbsp;</td>  
                        <td>  
                            &nbsp;</td>  
                        <td>  
                            &nbsp;</td>  
                    </tr>  
                </table>  
            </div>  
        </div>
             </div>
        </form>  
   
</body>
</html>
