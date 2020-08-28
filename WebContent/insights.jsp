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
		
		UserBean user;
		UserTransactionDAO dao;
		ArrayList<UserBean> delayUsers;
		ArrayList<TransactionBean> queryDetails;
		
	%>
	<%
		 dao= new UserTransactionDAO();
		 delayUsers = dao.getDelayUsers();
		 request.setAttribute("delayed", delayUsers);
		 Timestamp currTime=new Timestamp(System.currentTimeMillis());
		 Calendar cal=Calendar.getInstance();
		 cal.setTimeInMillis(currTime.getTime());
		 int currMonth = cal.get(Calendar.MONTH)+1;
		 int currYear = cal.get(Calendar.YEAR);
		 if(request.getParameter("month") !=null && request.getParameter("year") !=null){
			 currMonth=Integer.parseInt(request.getParameter("month"));
			 currYear=Integer.parseInt(request.getParameter("year"));
			 queryDetails=dao.getMonthTransactions(currMonth, currYear);
			 request.setAttribute("tdetails",queryDetails);
		 }
		 queryDetails=dao.getMonthTransactions(currMonth, currYear);
		 request.setAttribute("tdetails",queryDetails);
		
	%>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Links">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand mr-auto" href="#">eSociety</a>
            <div class="collapse navbar-collapse" id="Links">
                <ul class="navbar-nav mr-auto">
                	 <li class="nav-item active"><a class="nav-link" href="adminhome.jsp"><span class="fa fa-home fa-lg"></span> Home</a></li>
                   <li class="nav-item "><a class="nav-link" href="adminTransactions.jsp"><span class="fa fa-exchange fa-lg"></span> Transactions</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><span class="fa fa-user fa-lg"></span> Profile</a></li>
                    <li class="nav-item"><a class="nav-link active" href="insights.jsp"><span class="fa fa-bar-chart fa-lg"></span> Insights</a></li>
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
            <div class="row row-header "> 
                <div class="col-12 col-sm-6">
                     <h1><b>Check insights! </b></h1>
                   
                </div>
              
            </div>
        </div>
    </header>
    

    <div class="container">
	    <div class="row">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="adminhome.jsp">Home</a></li>
                <li class="breadcrumb-item active">Insights</li>
            </ol>
	    </div>
        <ul class="nav nav-tabs">
        <li class="nav-item">
                <a href=#inquery class="nav-link active" data-toggle="tab">
                   Monthly payments
                </a>
            </li>
            
            <li class="nav-item">
                <a href="#delayed" class="nav-link " data-toggle="tab">
                    Delay users
                </a>
            </li>
            
        </ul>
        <div class="tab-content">
            <div class="tab-pane " id="delayed">
			    <div class="row">
			    	<div class="col-12">
			    	<h4>Frequent delayed payment users</h4>
			    	</div>
			    	<div>
			    	<button  class="btn btn-primary btn-sm ml-1" onclick="Export2()" >Download</button> 
			    	</div>
			    </div>
		    	<div class="row">
			    	<table class="table" id="document2">
			    		<thead class="thead-dark">
				    		<tr>
				    			<th scope="col">Name</th>
				    			<th scope="col">Email</th>
				    			<th scope="col">Mobile</th>
				    		</tr>
				    		<tr>
			    				<td><b> <%= delayUsers.size()==0 ? "NO users were found" : "" %> </b></td>
			    			</tr>
			    		</thead>
			    		<tbody>
					    	<c:forEach items="${delayed}" var="transact">
					    			<tr>
						    			<td>${transact.username}</td>
						    			<td><span class="fa fa-envelope"></span><a href="mailto:${transact.email }">${transact.email }</a></td>
						    			<td><span class="fa fa-phone"></span><a href="tel:${transact.mobile }">${transact.mobile }</a></td>
					    			</tr>
					    	</c:forEach>
					    	
					    </tbody>
					 </table>
				 </div>
		     </div>
     
         <div class="tab-pane active" id="inquery">
         <div class="container">
         <div class="row margin-2">
         	<form name="formQuery" method="post">
                <div class="form-row">
                     <label class="ml-3"  for="month" >Enter month</label>
                     <select class="ml-3" name="month" id="month">
					  <option value="1">January</option>
					  <option value="2">February</option>
					  <option value="3">March</option>
					  <option value="4">April</option>
					  <option value="5">May</option>
					  <option value="6">June</option>
					  <option value="7">July</option>
					  <option value="8">August</option>
					  <option value="9">September</option>
					  <option value="10">October</option>
					  <option value="11">November</option>
					  <option value="12">December</option>
					</select>
                
                     <label class="ml-3" for="year" >Enter year</label>
                     <input type="text" class="ml-3" id="year" name="year" placeholder="<%= currYear %>" maxlength="4"  required	>
                
                	<button type="submit" class="btn btn-primary btn-sm ml-1" onclick="findQuery()" >Submit</button>  
                	       
                </div>
            </form>
            <button  class="btn btn-primary btn-sm ml-1" onclick="Export()" >Download</button> 
         </div>
         </div>
            <div class="row">
	    	<table class="table" id="statement">
	    		<thead class="thead-dark">
		    		<tr>
		    			<th scope="col">Transaction Id</th>
		    			<th scope="col">Paid by</th>
		    			<th scope="col">Description</th>
		    			
		    			<th scope="col">Date</th>
		    			<th scope="col">Amount</th>
		    		</tr>
		    		<tr>
	    				<td><b> <%= queryDetails.size()==0 ? "NO Transactions were found" : "" %> </b></td>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha512-s/XK4vYVXTGeUSv4bRPOuxSDmDlTedEpMEcAQk0t/FMd9V6ft8iXdwSBxV0eD60c6w/tjotSlKu9J2AAW1ckTA==" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.66/pdfmake.min.js"></script>
 <!-- endbuild --> 
 <script>
 function findQuery()
 {
     
     formQuery.submit();
 } 
 </script>
 <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('statement'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Statement.pdf");
                }
            });
        }
        function Export2() {
            html2canvas(document.getElementById('document2'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Statement.pdf");
                }
            });
        }
    </script>
</body>

</html>