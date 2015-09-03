<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="college.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body style="background-color:#808080; margin:auto;">
     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="login.aspx">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li class="active"><a  href="Search.aspx">Search for student <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="Insert.aspx">Insert new student <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="Add admin.aspx">Add new admin <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="login.aspx">Logout <span class="sr-only">(current)</span></a></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <form id="form1" runat="server" role="search" class="center-block">
    <div>
    
        &nbsp;<br />
        <asp:Label ID="Label2" runat="server" Text="StuID :"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="search" CssClass="form-control" Width="62px" ></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Document :"></asp:Label>
    
    </div>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" />
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Upload" />

        <br />
        <br />
&nbsp;
        <div class="panel panel-primary" >
            <div class="panel-heading"> Search Results</div>
            <div class="panel-body">

            </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Choose" ControlStyle-Font-Size="Large" >
                      <ItemTemplate  >
                         <asp:CheckBox ID="checked1" runat="server"  />
                      </ItemTemplate>
                  </asp:TemplateField>
                <asp:TemplateField HeaderText="File ID" Visible="false">
                      <ItemTemplate>
                          <asp:Label ID ="Label1" runat="server" Text='<% #Eval ("ID") %>'>

                          </asp:Label>
                      </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Documents">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClick="open" runat="server" Text='<%# Eval("name") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Extention" >
                      <ItemTemplate>
                          <asp:Label ID ="Label4" runat="server" Text='<% #Eval ("extn") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <br />
            <asp:Button OnClientClick ="return confirm ('Are you sure')"  CssClass="btn btn-primary" ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" Visible="false" /> 
            </div>
    </form>
</body>
</html>
