<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="college.Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script type ="text/javascript">
        function load() {
            alert("     Confirm to add the new student :)");
        }
        function imagepreview(input) {
            if(input.files && input.files[0])
            {
                var filedr = new FileReader();
                filedr.onload = function (e) {
                    $("#img").attr('src', e.target.result);
                }
                filedr.readAsDataURL(input.files[0]);

            }
        }
    </script>
</head>
<body style="background-color: #808080;">
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
      <a class="navbar-brand" href="login.aspx">HOME</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a  href="Search.aspx">Search for student <span class="sr-only">(current)</span></a></li>
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
    
&nbsp;<asp:label CssClass="label label-primary" runat="server"> Name :</asp:label>
        <asp:TextBox ID="TextBox1" runat="server" Width="300px" placeholder="Enter Name" CssClass="form-control" required ></asp:TextBox>
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> ID:</asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox2" runat="server" Width="300px" placeholder="Enter ID" CssClass="form-control" required></asp:TextBox>
        <br />
                <asp:Image ID="img" runat="server" Width="400px" Height="400px" ImageAlign="Right" />
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> GPA:</asp:label>&nbsp;&nbsp; :
        <asp:TextBox ID="TextBox3" runat="server" Width="300px" placeholder="Enter GPA" CssClass="form-control" required></asp:TextBox>
        <br />
&nbsp; <asp:label CssClass="label label-primary" runat="server"> Address :</asp:label>
        <asp:TextBox ID="TextBox4" runat="server" Width="300px" placeholder="Enter Address" CssClass="form-control" required></asp:TextBox>
        <br />
&nbsp;     <asp:Label CssClass="label label-primary" ID="Label1" runat="server" Text="Email :"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"  Width="300px" placeholder="Enter your email address" CssClass="form-control" required></asp:TextBox>
        &nbsp;<br />
        &nbsp;
         <asp:Label CssClass="label label-primary" ID="Label3" runat="server" Text="Faculty:"></asp:Label>
        &nbsp;<br />
        <asp:DropDownList ID="Drop1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drop1_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
&nbsp;<br />
&nbsp;     <asp:Label CssClass="label label-primary" ID="Label2" runat="server" Text="Department :"></asp:Label>
        &nbsp;<br />
        &nbsp;&nbsp;<asp:DropDownList ID="Drop2" runat="server">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label CssClass="label label-primary" ID="Label7" runat="server" Text="Image :"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" onchange="imagepreview(this);" />
        <br />
         <asp:Label CssClass="label label-primary" ID="Label8" runat="server" Text="File :"></asp:Label>
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="btn btn-primary" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" OnClick="Button1_Click" OnClientClick ="return load();" style="width: 60px" Text="Insert" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        <input id="Button2" type="reset"   class="btn btn-primary"  value="Cancel" />&nbsp;
        <br />
        <br />
        <br />
        <br />

      <!--  <div class="panel panel-primary"  style = "margin-right:auto; margin-left:auto">
            <div class="panel-heading"> Search Results</div>
            <div class="panel-body">

            </div>
         <asp:GridView AlternatingRowStyle-CssClass="table table-hover table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" width="800px"  HorizontalAlign ="Center">
           
              <Columns>
                  <asp:TemplateField HeaderText="StuID" Visible="false">
                      <ItemTemplate>
                          <asp:Label ID ="Label1" runat="server" Text='<% #Eval ("StuID") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Sname" >
                      <ItemTemplate>
                          <asp:Label ID ="label2" runat="server" Text='<% #Eval ("Sname") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Gpa" >
                      <ItemTemplate>
                          <asp:Label ID ="Label3" runat="server" Text='<% #Eval ("Gpa") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="adress" >
                      <ItemTemplate>
                          <asp:Label ID ="Label4" runat="server" Text='<% #Eval ("adress") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Semail" >
                      <ItemTemplate>
                          <asp:Label ID ="Label5" runat="server" Text='<% #Eval ("Semail") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="department" >
                      <ItemTemplate>
                          <asp:Label ID ="Label6" runat="server" Text='<% #Eval ("department") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Student picture" >
                      <ItemTemplate>
                          <asp:Image ID="image1" runat="server" ImageUrl='<% #"Handler1.ashx?id="+ Eval("StuID")%>' Width="200px" Height="200px" />
                      </ItemTemplate>
                  </asp:TemplateField>

              </Columns>
        </asp:GridView>
            </div> -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
