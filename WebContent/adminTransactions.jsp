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
		UserTransactionDAO dao;
		ArrayList<TransactionBean> tdetails,outward;
		long total,outwardAmount;
	%>
	<%
		 email= (String)session.getAttribute("currUser");
		 dao=new UserTransactionDAO();
		 tdetails = dao.getAllTransactions();
		 outward=dao.getAcceptedOutwardPayments();
		 total=dao.getTotal();
		 outwardAmount=dao.getOutwardTotal();
		 request.setAttribute("tdetails",tdetails);
		 request.setAttribute("outward",outward);		
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
                <ul class="navbar-nav mr-auto">
                	 <li class="nav-item "><a class="nav-link" href="adminhome.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    <li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-exchange fa-lg"></span>  Transactions</a></li>
                    
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="insights.jsp"><span class="fa fa-bar-chart fa-lg"></span> Insights</a></li>
                                    <li class="nav-item "><a class="nav-link" href="outwardPayment.jsp"><span class="fa fa-plus fa-lg"></span> Make New Payment</a></li>
                
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
            <div class="row row-header"> 
                <div class="col-12 col-sm-6">
                     <h1><b>All Transactions </b></h1>
                </div>
              
            </div>
        </div>
    </header>
    

    <div class="container">
    <div class="row">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="adminhome.jsp">Home</a></li>
                <li class="breadcrumb-item active">All Payments</li>
            </ol>
            
        </div>
	    <ul class="nav nav-tabs">
            <li class="nav-item">
                <a href="#incoming" class="nav-link active" data-toggle="tab">
                    Inward Payments
                </a>
            </li>
            <li class="nav-item">
                <a href=#outgoing class="nav-link" data-toggle="tab">
                   Outward Payments
                </a>
            </li>
            
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="incoming">
            <div class="row">
	    	<table class="table">
	    		<thead class="thead-dark">
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Paid by</th>
		    			<th scope="col">Description</th>
		    			
		    			<th scope="col">Date</th>
		    			<th scope="col">Amount</th>
		    		</tr>
		    		<tr>
	    				<td><b> <%= tdetails.size()==0 ? "NO Transactions were found" : "" %> </b></td>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${tdetails}" var="transact">
			    			<tr>
				    			<td>${transact.tid+10000}</td>
				    			<td>${transact.temail }</td>
				    			<td>${transact.tdesc }</td>
				    			
				    			<td>${transact.tdate }</td>
				    			<td>${transact.tamount }</td>
			    			</tr>
			    	</c:forEach>
			    	<tr>
			    	<th></th>
			    	<th></th>
			    	<th></th>
			    	<th>Total :</th>
			    	<th><%= total %></th>
			    	</tr>
			    </tbody>
			 </table>
		 </div>
			</div>
			 <div class="tab-pane" id="outgoing">
			 <div class="row">
	    	<table class="table">
	    		<thead  class="thead-dark">
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Paid by</th>
		    			<th scope="col">Description</th>
		    			
		    			<th scope="col">Date</th>
		    			<th scope="col">Amount</th>
		    		</tr>
		    		<tr>
	    				<td><b> <%= outward.size()==0 ? "NO Transactions were found" : "" %></b> </td>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${outward}" var="transact">
			    			<tr>
				    			<td>${transact.tid+10000}</td>
				    			<td>${transact.temail }</td>
				    			<td>${transact.tdesc }</td>
				    			
				    			<td>${transact.tdate }</td>
				    			<td>${transact.tamount }</td>
			    			</tr>
			    	</c:forEach>
			    	<tr>
			    	<th></th>
			    	<th></th>
			    	<th></th>
			    	<th>Total :</th>
			    	<th><%= outwardAmount %></th>
			    	</tr>
			    </tbody>
			 </table>
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