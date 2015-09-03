<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="college.Search" %>

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
        <li class="active"><a href="Insert.aspx">Insert new student <span class="sr-only">(current)</span></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="upload.aspx">Upload files</a></li>
          <li class="active"><a href="Add admin.aspx">Add new admin <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="login.aspx">Logout <span class="sr-only">(current)</span></a></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <form id="form1" runat="server" role="search" class="center-block">
    <div class="form-group">
         <asp:Label runat="server" CssClass="label label-primary">Enter the student name: </asp:Label> &nbsp;
         <asp:TextBox ID="TextBox1" runat="server" Width="158px" placeholder="search" CssClass="form-control">  </asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="ByID" runat="server" Checked="True" GroupName="group1" />
          <asp:Label runat="server" CssClass="label label-primary">By ID: </asp:Label>&nbsp; &nbsp;&nbsp;&nbsp;<asp:RadioButton ID="ByName" runat="server" GroupName="group1" />
         <asp:Label runat="server" CssClass="label label-primary">By Name: </asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="ByGpa" runat="server" GroupName="group1" />
         <asp:Label runat="server" CssClass="label label-primary">By Gpa: </asp:Label><br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Height="25px" OnClick="Button1_Click" Text="View" Width="62px" />
            
        <br />
        <br />
        <br />
    
    </div>
        <div class="panel panel-primary" >
            <div class="panel-heading"> Search Results</div>
            <div class="panel-body">

            </div>
      <asp:GridView AlternatingRowStyle-CssClass="table table-hover table-striped" ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" width="1000px" HorizontalAlign="Center" >
           
              <Columns>
                  <asp:TemplateField HeaderText="Choose" ControlStyle-Font-Size="Large" >
                      <ItemTemplate  >
                         <asp:CheckBox ID="checked1" runat="server"  />
                      </ItemTemplate>
                  </asp:TemplateField>
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
                 
                   <asp:TemplateField HeaderText="Student picture" >
                      <ItemTemplate>
                          <asp:Image ID="image1" runat="server" ImageUrl='<% #"Handler1.ashx?id="+ Eval("StuID")%>' Width="200px" Height="200px" />
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Faculty name" >
                      <ItemTemplate>
                          <asp:Label ID ="Label6" runat="server" Text='<% #Eval ("fname") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Department id" >
                      <ItemTemplate>
                          <asp:Label ID ="Label7" runat="server" Text='<% #Eval ("Did") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
        </asp:GridView>
            </div>
            <br />
            <br />
            <br />
        <asp:Button ID="Button5"  CssClass="btn btn-primary" runat="server" OnClick="Button5_Click" Text="Update" Visible="false" />
        <asp:Button OnClientClick ="return confirm ('Are you sure')"  CssClass="btn btn-primary" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" Visible="false" />  
        <br />
        <br />
        <br />
        <div class="panel panel-primary">
            <div class="panel-heading">Student data</div>
            <div class="panel-body">

            </div>
         <table runat ="server" id="table1" class="table" visible ="false">
                <tr>
                    <td>
                        ID :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Gpa :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    &nbsp;
                    </td>
                </tr>
             <tr>
                    <td>
                        Address :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                    </td>
           
                </tr>
             <tr>
                    <td>
                        Email :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    &nbsp;
                    </td>
                </tr>
             <tr>
                    <td>
                        Department :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    &nbsp;
                    </td>
                </tr>
                   <tr>
                    <td>
                        Student photo :
                    </td>
                    <td>
                          <asp:FileUpload ID="FileUpload1" runat="server"  />
                    &nbsp;
                    </td>
                </tr>
            </table>  
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Choose" ControlStyle-Font-Size="Large" >
                      <ItemTemplate  >
                         <asp:CheckBox ID="checked1" runat="server"  />
                      </ItemTemplate>
                  </asp:TemplateField>
                <asp:TemplateField HeaderText="File ID" Visible="false">
                      <ItemTemplate>
                          <asp:Label ID ="Label9" runat="server" Text='<% #Eval ("ID") %>'>

                          </asp:Label>
                      </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText=" Student Documents">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClick="open" runat="server" Text='<%# Eval("name") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Extention" >
                      <ItemTemplate>
                          <asp:Label ID ="Label10" runat="server" Text='<% #Eval ("extn") %>'>

                          </asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
         <asp:Button ID="Button6" runat="server"  CssClass="btn btn-primary" OnClick="Button6_Click" Text="Confirm updating" Visible ="false" />
                    
    </form>
</body>
</html>
