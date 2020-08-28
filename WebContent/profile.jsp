<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "dao.UserDAO,bean.UserBean" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <!-- build:css css/main.css -->
    <link href="CSS/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">   
    <link rel="stylesheet" href="CSS/styles.css">
    <!-- endbuild -->

    <title>eSociety | PROFILE</title>
</head>

<body>
	<%!
		String email;
		UserDAO userDao;
		UserBean user;
	%>
	<%
		 email= (String)session.getAttribute("currUser");
		 userDao = new UserDAO();
		 user = userDao.getUserDetails(email);
		 boolean isAdmin = user.isAdmin();
		
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
            <%if(!isAdmin){ %>
                <ul class="navbar-nav mr-auto">
                
                	 <li class="nav-item "><a class="nav-link" href="home.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="transactions.jsp"><span class="fa fa-exchange fa-lg"></span>  Transactions</a></li>
                    
                    <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                </ul>
                <%} else{ %>
                <ul class="navbar-nav mr-auto">
                
                	 <li class="nav-item "><a class="nav-link" href="adminhome.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminTransactions.jsp"><span class="fa fa-exchange fa-lg"></span>  Transactions</a></li>
                    
                    <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="insights.jsp"><span class="fa fa-bar-chart fa-lg"></span> Insights</a></li>
                    <li class="nav-item "><a class="nav-link" href="outwardPayment.jsp"><span class="fa fa-plus fa-lg"></span> Make New Payment</a></li>
                
                </ul>
                <%} %>
                <span class="navbar-text">
                    <a id="logoutButton" href="<%= request.getContextPath()%>/LogoutServlet">
                        <span class="fa fa-sign-out"></span> Logout
                    </a>
                </span>
            </div>
        </div>
    </nav>
    <header class="jumbotron"> 
                 <div class="row row-header"> 
                <div class="col-12 col-sm-2">
                    <img class="img-fluid img-thumbnail"  src="./images/profile_pic.png" alt="Profile pic" />
                </div>
                <div class="col-12 col-sm-3 ">
                    <h1><%= user.getUsername() %></h1>
                    <p><%= user.getEmail() %></p>
                </div>
            </div>
    </header>

    <div class="container">
    <div class="row">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                <li class="breadcrumb-item active">My Profile</li>
            </ol>
            
        </div>
                    <div class="row row-display row-edu">
                        <div class="col-12 col-sm-2">
                            <h4>Mobile  : </h4>
                        </div>
                        <div class="col-12 col-sm-6">
                            <h4> <%= user.getMobile() %></h4>
                        </div>
                    </div>
                    <div class="row row-display row-edu">
                        <div class="col-12 col-sm-2">
                            <h4>Email  : </h4>
                        </div>
                        <div class="col-12 col-sm-6">
                            <h4> <%= user.getEmail() %></h4>
                        </div>
                    </div>
                    <div class="row row-display row-edu">
                        <div class="col-12 col-sm-4">
                            <a id="logoutButton" href="<%= request.getContextPath()%>/LogoutServlet" type="button" class="btn btn-block btn-primary">
                        <span class="fa fa-sign-out"></span> Logout
                    </a>
                            
                        </div>
                    </div>
     </div>

    <footer class=" footer">
        <div class="container">
           <div class="row justify-content-center">             
                <div class="col-auto">
                    <p>© Copyright eSociety</p>
                </div>
           </div>
        </div>
    </footer>
    
 <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
 <!-- build:js js/main.js -->
    <script src="js/jquery-3.4.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="https://use.fontawesome.com/f5cf23ddbf.js"></script>
 <!-- endbuild --> 
</body>

</html>