<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "dao.UserDAO,bean.UserBean,bean.TransactionBean,dao.UserTransactionDAO" %>
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

    <title>Society Financial Management</title>
</head>

<body>
<%!
		String email;
		UserDAO userDao;
		UserBean user;
		UserTransactionDAO dao;
		ArrayList<TransactionBean> tdetails;
	%>
	<%
		 email= (String)session.getAttribute("currUser");
		 userDao = new UserDAO();
		 user = userDao.getUserDetails(email);
		 dao=new UserTransactionDAO();
		 tdetails = dao.getTransactions(email);
		 Timestamp currTime=new Timestamp(System.currentTimeMillis());
		 Calendar cal=Calendar.getInstance();
		 cal.setTimeInMillis(currTime.getTime());
		 int currMonth = cal.get(Calendar.MONTH);
		 int currDate = cal.get(Calendar.DATE);
		 int deadline=10;
		 int remaining = deadline - currDate;
		 boolean paid=false;
		 int amountTobePaid = 5000;
		 int fine=0;
		 if(remaining<0) fine=100;
		 if(tdetails.size()!=0){
		 cal.setTimeInMillis(tdetails.get(tdetails.size()-1).getTdate().getTime());
		 int finalMonth = cal.get(Calendar.MONTH);
		   paid = (finalMonth==currMonth);
		 
		 
		 
		 
		 if(!paid){
			 int nmonths = currMonth - finalMonth -1;
			 amountTobePaid += (nmonths*(5000));
			 fine += nmonths*100;
		 }
		 
		 }
		 int total= amountTobePaid+fine;
		 request.getSession().setAttribute("payment",total); 
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
                <ul class="navbar-nav mr-auto">
                	 <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="transactions.jsp"><span class="fa fa-exchange fa-lg"></span>  Transactions</a></li>
                    
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                </ul>
                <span class="navbar-text">
                    <a id="logoutButton" href="<%= request.getContextPath()%>/LogoutServlet">
                        <span class="fa fa-sign-out"></span> Logout
                    </a>
                </span>
            </div>
        </div>
    </nav>
    
    <header class="jumbotron">
        <div class="container">
            <div class="row row-header "> 
                <div class="col-12 col-sm-6">
                     <h1>Complete your payment!</h1>
                    
                </div>
              
            </div>
        </div>
    </header>

    <div class="container">
    <div class="row">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                <li class="breadcrumb-item active">Comeplete payment</li>
            </ol>
            
        </div>
    	<div class="row row-display row-edu">
    		<div class="col-6">Amount to be paid =</div>
    		<div class="col-6"><%= amountTobePaid %></div>
    	</div>
    	<div class="row row-display row-edu">
    		<div class="col-6">Fine for delayed payment =</div>
    		<div class="col-6"><%= fine %></div>
    	</div>
    	<div class="row row-display row-edu">
    		<div class="col-6">Total amount =</div>
    		<div class="col-6"><%= total %></div>
    	</div>
    	<div class="row row-edu justify-content-center">
    	<a type="button" class="btn btn-primary btn-large"  href="<%= request.getContextPath()%>/TransactServlet">
                        Complete Payment</a>
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