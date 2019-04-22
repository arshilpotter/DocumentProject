<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccessPage.aspx.cs" Inherits="DocProject.UserAccessPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <%--The style tag has Css code for Buttons--%>
    <style type="text/css">
        .B1   
        { 
           color: white;
	background-color:dimgrey;
	height: 100px;
	width: 600px;
	padding:10px;
	border:none 0px transparent;
	font-size: 25px;
	font-weight: lighter;
	webkit-border-radius: 2px 2px 2px 2px;
	-moz-border-radius:  2px 2px 2px 2px;
	border-radius:  2px 2px 2px 2px;
        }

        .B1:hover
{
	background-color:orangered;
	border:solid 1px #fff;
}

        
    </style>
</head>
<body>
     <form id="form1" runat="server"> 
        <div>
                 
            <%--Label Request Sent is only visible when the user clicks on request button--%>
            <asp:Label ID="Label1" runat="server" Text="Request Sent!" Visible="false"></asp:Label>
                <%--Button for User Requests--%>
            <asp:Button ID="Button1" CssClass="B1" runat="server" Text="Request for Adding Docs" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
           <%--Button to nagivate to the Search Page--%>
            <asp:Button ID="Button2" CssClass="B1" runat="server" Text="Search Docs" OnClick="Button2_Click1" />
        </div>
  </form>
</body>
</html>
