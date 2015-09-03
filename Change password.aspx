<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Change password.aspx.cs" Inherits="college.Change_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type ="text/javascript">
        function load() {
            alert("Password Changed");
        }
    </script>
</head>
<body style="background-color: #808080">
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="login.aspx">HOME</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Insert.aspx">Insert new student <span class="sr-only">(current)</span></a></li>
        <li class ="active"><a href="Search.aspx">Search for student <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="upload.aspx">Upload files</a></li>
          <li class="active"><a href="Add admin.aspx">Add new admin <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="login.aspx">Logout <span class="sr-only">(current)</span></a></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    <form id="form1" runat="server">
    <div>
    
    &nbsp;
        <br />
        &nbsp;<br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> Enter your old password</asp:label>&nbsp;&nbsp; :&nbsp;&nbsp; <asp:TextBox ID="TextBox2" Width="200px" placeholder="Enter your old password" CssClass="form-control" runat="server" TextMode ="Password"></asp:TextBox>
        <br />
&nbsp;    <asp:label CssClass="label label-primary" runat="server"> Enter new password</asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Width="200px" placeholder="Enter new password" CssClass="form-control" TextMode ="Password"></asp:TextBox>
        <br />
&nbsp;  <asp:label CssClass="label label-primary" runat="server"> Confirm new password</asp:label>&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="200px" placeholder="Enter new password again" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" OnClientClick ="return load();" Text="Change" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        <input id="Button2" type="reset"   class="btn btn-primary"  value="Cancel" /><br />
    
    </div>
    </form>
</body>
</html>
