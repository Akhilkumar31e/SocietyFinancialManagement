<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                    <a id="loginButton">
                        <span class="fa fa-sign-in"></span> Login
                    </a>
                </span>
            </div>
        </div>
    </nav>
    <div id="reserve" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Register Here</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>
                <div class="modal-body">
                    <form action="./RegisterServlet" method="post">
                        <div class="form-group row">
                            <label for="username" class="col-md-2 col-form-label">Name</label>
                           <div class="col-md-10">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Name" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="mobile" class="col-md-2 col-form-label">Mobile</label>
                           <div class="col-md-10">
                            <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Mobile Number" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-md-2 col-form-label">Email</label>
                           <div class="col-md-10">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-md-2 col-form-label">Password</label>
                           <div class="col-md-10">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="cpassword" class="col-md-2 col-form-label">Confirm Password</label>
                           <div class="col-md-10">
                            <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm Password" required>
                            </div>
                        </div>
                    
                        <div class="form-row">
                            <button type="button" class="btn btn-secondary btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Register</button>        
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>

                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>
                <div class="modal-body">
                    <form action="./LoginServlet" method="post">
                        <div class="form-row">
                            <div class="form-group col-sm-4">
                                    <label class="sr-only" for="loginEmail">Email address</label>
                                    <input type="email" class="form-control form-control-sm mr-1" id="loginEmail" name="loginEmail" placeholder="Enter email">
                            </div>
                            <div class="form-group col-sm-4">
                                <label class="sr-only" for="loginPassword">Password</label>
                                <input type="password" class="form-control form-control-sm mr-1" id="loginPassword" name="loginPassword" placeholder="Password">
                            </div>
                            
                        </div>
                        <div class="form-row">
                            <button type="button" class="btn btn-secondary btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Sign in</button>        
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <header class="jumbotron">
        <div class="container">
            <div class="row row-header"> 
                <div class="col-12 col-sm-6">
                    <h1>eSociety</h1>
                    <p>Finance made easy!!!</p>
                </div>
                <div class="col-12 col-sm-6 align-self-center">
                    <a class="btn btn-warning btn-large btn-block"
                    id="reserveButton"><b>Register Now</b></a>
                </div>
            </div>
            
        </div>
    </header>

    
    <div class="display">
                    <div class="jumbotron">
                        <div class="container">
                            <div class="row">
                               <div class="col-12 col-sm-6 justify-content-center title">
                                   <h2 class="display-4">Society Financial Management</h2>
                               </div>
                               <div class="col-12 col-sm-6 taglines">
                                   <div class="container">
                                      <div>
                     					<div class="row tagline-row justify-content-center">
                         					<span ></span><h3>Transparency in  Making Payments</h3>
                         					
                    					</div>
                    					<div class="row tagline-row justify-content-center">
                         					
                         					<span ></span><h3>Financial Operations</h3>
                    					</div>
                    					<div class="row tagline-row justify-content-center">
                         					<span ></span><h3>Tracking Inward/Outward payments</h3>
                    					</div>
                					</div>
                                   </div>
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
 <script>
 var password = document.getElementById("password")
 , confirm_password = document.getElementById("cpassword");

function validatePassword(){
 if(password.value != confirm_password.value) {
   confirm_password.setCustomValidity("Passwords Don't Match");
 } else {
   confirm_password.setCustomValidity('');
 }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
 </script>
</body>

</html>