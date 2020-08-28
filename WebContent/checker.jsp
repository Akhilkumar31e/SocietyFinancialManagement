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
		ArrayList<TransactionBean> tdetails;
	%>
	<%
		 email= (String)session.getAttribute("currUser");
		 
		 dao=new UserTransactionDAO();
		 tdetails = dao.getPendingOutwardPayments();
		 request.setAttribute("pending",tdetails);
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
                <ul class="navbar-nav mr-auto">
                	 
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
                     <h1>Welcome to eSociety</h1>
                    <h4>Approve or Reject the outward payments!</h4>
                </div>
              
            </div>
        </div>
    </header>
    

    <div class="container">
    	 <div class="row">
	    	<table class="table">
	    		<thead class="thead-dark">
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Description</th>
		    			<th scope="col">Amount</th>
		    			<th scope="col">Date</th>
		    			<th scope="col">User</th>
		    			<th scope="col">Action</th>
		    		</tr>
		    		<tr>
	    				<td><b> <%= tdetails.size()==0 ? "NO Transactions were found" : "" %> </b></td>
	    			</tr>
	    		</thead>
	    		<tbody>
			    	<c:forEach items="${pending}" var="transact">
			    			<tr>
				    			<td scope="col">${transact.tid+10000}</td>
				    			<td scope="col">${transact.tdesc }</td>
				    			<td scope="col">${transact.tamount }</td>
				    			<td scope="col">${transact.tdate }</td>
				    			<td scope="col">${transact.temail }</td>
				    			<td scope="col">
				    			<div class="btn-group" role="group">
		    						<form action="./CheckerServlet" method="post">
		    							<input type="hidden" name="tid" value=${transact.tid } />
		    							<input type="hidden" name="status" value="accepted" />
				                    	<button type="submit"  class="btn btn-success"> Accept</button>
				                    </form>
				                    <form action="./CheckerServlet" method="post">
		    							<input type="hidden" name="tid" value=${transact.tid } />
		    							<input type="hidden" name="status" value="rejected" />
				                    	<button type="submit"  class="btn btn-danger"> Reject</button>
				                    </form>
				                    </div>
				    			</td>
			    			</tr>
			    	</c:forEach>
			    </tbody>
			 </table>
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