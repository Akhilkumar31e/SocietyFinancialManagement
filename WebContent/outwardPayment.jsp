<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		ArrayList<TransactionBean> pendingPayments,acceptedPayments,rejectedPayments;
	%>
	<%
		 email= (String)session.getAttribute("currUser");
		 userDao = new UserDAO();
		 user = userDao.getUserDetails(email);
		 dao=new UserTransactionDAO();
		 pendingPayments = dao.getStatusPayments(email, "pending");
		 request.setAttribute("pending",pendingPayments);
		 acceptedPayments= dao.getStatusPayments(email,"accepted");
		 request.setAttribute("accepted",acceptedPayments);
		 rejectedPayments= dao.getStatusPayments(email,"rejected");
		 request.setAttribute("rejected",rejectedPayments);
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
                <ul class="navbar-nav mr-auto">
                	 <li class="nav-item"><a class="nav-link" href="adminhome.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminTransactions.jsp"><span class="fa fa-exchange fa-lg"></span>  Transactions</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                                    <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-plus fa-lg"></span>  Make New Payment</a></li>
                
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
                     <h1>Make new outward payment here!</h1>
                    
                </div>
              
            </div>
        </div>
    </header>
    

    <div class="container">
    <div class="row">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="adminhome.jsp">Home</a></li>
                <li class="breadcrumb-item active">Make new payment</li>
            </ol>
           
        </div>
     <div class="row row-display row-edu">
     	<p><b>Your payment is successful only when it is approved by higher authority. Until then,it would be pending.</b></p>
     </div>
     <div class="row row-display row-edu">
     <div class="col-12">
    	 <form action="./OutwardServlet" method="post">
                        <div class="form-group row">
                            <label for="desc" class="col-md-2 col-form-label">Purpose of payment</label>
                           <div class="col-md-10">
                            <input type="text" class="form-control" id="desc" name="desc" placeholder="Ex : Security, Salaries etc" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="amount" class="col-md-2 col-form-label">Amount(In Ruppes)</label>
                           <div class="col-md-10">
                            <input type="tel" class="form-control" id="amount" name="amount" placeholder="Enter the amount required to pay" required>
                            </div>
                        </div>
                  
                        <div class="form-row">
                           
                            <button type="submit" class="btn btn-primary btn-lg mr-1">Pay</button>        
                        </div>
                    </form>
                    </div>
                   </div>
     </div>
     <div class="container">
     <div class="row row-display row-edu">
     <div class="col-12">
               <h5>Check status of your outward payments here</h5>
               <hr>
            </div>
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a href="#pending" class="nav-link active" data-toggle="tab">
                    Pending payments
                </a>
            </li>
            <li class="nav-item">
                <a href=#accepted class="nav-link" data-toggle="tab">
                   Accepted payments
                </a>
            </li>
            <li class="nav-item">
                <a href=#rejected class="nav-link" data-toggle="tab">
                   Rejected payments
                </a>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="pending">
				<div class="row">
	    		<table class="table">
	    		<thead>
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Description</th>
		    			<th scope="col">Amount</th>
		    			<th scope="col">Date</th>
		    			<th scope="col">Status</th>
		    		</tr>
		    		<tr>
	    				<th> <%= pendingPayments.size()==0 ? "NO pending Transactions were found" : "" %> </th>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${pending}" var="pending">
			    			<tr>
				    			<td>${pending.tid+10000}</td>
				    			<td>${pending.tdesc }</td>
				    			<td>${pending.tamount }</td>
				    			<td>${pending.tdate }</td>
				    			<td><span class="badge badge-warning">${pending.status }</span></td>
			    			</tr>
			    	</c:forEach>
			    </tbody>
			 </table>
		 </div>
                

            </div>
            <div class="tab-pane" id="accepted">
                <div class="row">
	    		<table class="table">
	    		<thead>
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Description</th>
		    			<th scope="col">Amount</th>
		    			<th scope="col">Date</th>
		    			<th scope="col">Status</th>
		    		</tr>
		    		<tr>
	    				<th> <%= acceptedPayments.size()==0 ? "NO accepted payments were found" : "" %> </th>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${accepted}" var="pending">
			    			<tr>
				    			<td>${pending.tid+10000}</td>
				    			<td>${pending.tdesc }</td>
				    			<td>${pending.tamount }</td>
				    			<td>${pending.tdate }</td>
				    			<td><span class="badge badge-success">${pending.status }</span></td>
			    			</tr>
			    	</c:forEach>
			    </tbody>
			 </table>
		 </div>
            </div>
            <div class="tab-pane" id="rejected">
                <div class="row">
	    		<table class="table">
	    		<thead>
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Description</th>
		    			<th scope="col">Amount</th>
		    			<th scope="col">Date</th>
		    			<th scope="col">Status</th>
		    		</tr>
		    		<tr>
	    				<th> <%= rejectedPayments.size()==0 ? "NO rejected payments were found" : "" %> </th>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${rejected}" var="pending">
			    			<tr>
				    			<td>${pending.tid+10000}</td>
				    			<td>${pending.tdesc }</td>
				    			<td>${pending.tamount }</td>
				    			<td>${pending.tdate }</td>
				    			<td><span class="badge badge-danger">${pending.status }</span></td>
			    			</tr>
			    	</c:forEach>
			    </tbody>
			 </table>
		 </div>
            </div>
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