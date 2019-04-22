<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="DocProject.Registration" %>

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

        .auto-style1 {
            width: 449px;
        }

    </style>

</head>
<body>
    <%-- Form and tables are created for entering user credentials--%>


       <div class="navbar" >
                <h1 style="color:cornflowerblue">Document Project</h1>
               </div>


    
         <%-- Bootstrap Panel layout for displaying the document --%>
 

     <form id="form1" runat="server"  style="width: 400px; margin-left: auto; margin-right:auto;">  

         <div class="panel panel-primary">
       <div class="panel-heading"><h1>Registration Page</h1></div>
    <div class="panel-body">


        <div>  
            <table class="auto-style1">  
                   <%-- Username has textbox  --%>
                <tr>  
                    <td>Username :</td>  
                    <td>  
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  
                    </td>  
  
               </tr>  
                
               
                     <%-- Username has Password and the textmode is set to password to hide the entered data  --%>

                <tr>  
                    <td>Password</td>  
                    <td>  
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>  
                    </td>  
                </tr>  

                <%-- Gender radio button holds Male and Female  --%>
                <tr>  
                    <td>Gender</td>  
                    <td>  
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">  
                            <asp:ListItem Value="0">Male</asp:ListItem>  
                            <asp:ListItem Value="1">Female</asp:ListItem>  
                        </asp:RadioButtonList>  
                    </td>  
               </tr>
                    <%-- Age field has a an input textbox  --%>
                <tr>  
                    <td>Age</td>  
                    <td>  
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>  
                    </td>  
                </tr> 

                <tr>  
                    <td>email</td>  
                    <td>  
                        <asp:TextBox ID="Tmail" runat="server"></asp:TextBox>  
                    </td>  
                </tr> 
                    <%--  Register fires the event to insert the data into database and Login button redirectes to loginpage  --%>
                <tr>  
                    <td>  
                        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" CssClass="b1" />  
                    </td>  
             
                 
                    <td>  
                        <asp:Button ID="Button2" runat="server" Text="Loginpage" OnClick="Button2_Click" CssClass="b1" />  
                    </td>  
                   </tr> 
            </table>  
        </div>  
        </div>
      </div>
    </form>  
        


</body>
</html>
