<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminstration.aspx.cs" Inherits="college.Adminstration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/carousel.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    
</head>
<body style =" background-color:#808080">

    <form id="form1" runat="server">

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
      <a class="navbar-brand" href="login.aspx">Logout</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Insert.aspx">Insert new student <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="Search.aspx">Search for student</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
               <li class="active"><a href="upload.aspx">Upload files</a></li>
          <li class="active"><a href="Add admin.aspx">Add new admin</a></li>
        <li class="active"><a href="Change password.aspx">Change password</a></li>
          </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
        <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="teacher.jpeg" alt="First slide" />
          <div class="container">
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="cu.JPG" alt="Second slide" />
          <div class="container">
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="kids.JPG"  alt="Third slide" />
          <div class="container">
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
        </form>
            
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script> 
</body>
</html>
