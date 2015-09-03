<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add admin.aspx.cs" Inherits="college.Add_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type ="text/javascript">
        function load() {
            alert("     Confirm to add the new student :)");
        }
    </script>
</head>
<body style="background-color: #808080;">
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
        <li class="active"><a  href="Search.aspx">Search for student <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="Insert.aspx">Insert new student <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
           <li class="active"><a href="upload.aspx">Upload files</a></li>
        <li class="active"><a href="login.aspx">Logout <span class="sr-only">(current)</span></a></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <form id="form1" runat="server" >
    <div>
     <asp:label CssClass="label label-primary" runat="server"> Enter Admin data :</asp:label>
        <br />
           <asp:Label CssClass="label label-primary" ID="Label1" runat="server" Text="Email :"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"  Width="300px" placeholder="Enter your email address" CssClass="form-control"></asp:TextBox>
        <br />
&nbsp;<asp:label CssClass="label label-primary" runat="server"> Name :</asp:label>
        <asp:TextBox ID="TextBox1" runat="server" Width="300px" placeholder="Enter Name" CssClass="form-control" ></asp:TextBox>
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> Password:</asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox2" runat="server" Width="300px" placeholder="Enter ID" CssClass="form-control"></asp:TextBox>
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> Phone number:</asp:label>&nbsp;&nbsp; :
        <asp:TextBox ID="TextBox3" runat="server" Width="300px" placeholder="Enter phone number" CssClass="form-control"></asp:TextBox>
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> Address :</asp:label>
        <asp:TextBox ID="TextBox4" runat="server" Width="300px" placeholder="Enter Address" CssClass="form-control"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" OnClick="Button1_Click" OnClientClick ="return load();" style="width: 60px" Text="Insert" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        <input id="Button2" type="reset"   class="btn btn-primary"  value="Cancel" />&nbsp;
        <br />
    
    </div>
    </form>
</body>
</html>
