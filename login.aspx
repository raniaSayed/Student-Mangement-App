<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="college.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type ="text/javascript">
        function validate() {
            var email = document.getElementById("TextBox3").value;
            var pass = document.getElementById("TextBox2").value;
            if (email == "")
                alert("Enter your email");
            else if(pass== "")
                alert("Enter your password");
        }
    </script>
</head>
<body style="background-color:lightgrey">
    <form id="form1" runat="server" role="form">
        <div>
            <div class="container-fluid">
                <div class ="jumbotron" style="border:0px solid #888; box-shadow: 0px 2px 5px #ccc; box-sizing = 10px;">
                    <h1> Adminstration System ....... </h1>
                    <p> This app help Admins to manage student information like (Search for student,update student info,insert new student ,etc...)</p>
                </div>
                 <div class="form-group">
         <asp:label CssClass="label label-primary" runat="server"> Email</asp:label>
        <asp:TextBox ID="TextBox3"  runat="server" Width="200px"  CssClass="form-control" placeholder="Enter your Email" ></asp:TextBox>
        </div>
                <div class="form-group">
         <asp:label CssClass="label label-primary" runat="server"> Password</asp:label>
        <asp:TextBox ID="TextBox2" Width="200px" position ="center"  TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter your Password" ></asp:TextBox>
                    </div>
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" OnClientClick="return validate();" Text="Login" Width="59px" />
            </div>

        </div>
   
        
    </form>
</body>
</html>
