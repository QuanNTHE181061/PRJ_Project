<%-- 
    Document   : register
    Created on : Jun 7, 2024, 3:26:50 PM
    Author     : quanpyke
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%-- 
    Document   : login
    Created on : Jun 4, 2024, 1:50:06 PM
    Author     : quanpyke
--%>




<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="assets/css/login (1).css">
	<link rel="stylesheet" type="text/css" href="assets/css/login (2).css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
                                    <img src="assets/img/logo.png" alt="IMG">
				</div>

                            <form class="login100-form validate-form" action="register" method="post">
					<span class="login100-form-title">
						Register
					</span>

					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
                                
                                <div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="cpassword" placeholder="Confirm Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="name" placeholder="Name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
                                	<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="address" placeholder="Address">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
                               	<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div> 
                                 	<div class="wrap-input100 ">
						<input class="input100" type="text" name="phone" placeholder="Phone">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div> 
                                
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Register
						</button>
					</div>
                                <div> 
                                    <c:set var="status" value="${sessionScope.status}"> </c:set>
                                        <c:set var="reg" value="${sessionScope.reg}">     </c:set>
                                        
                                        <c:if test="${status=='new'}">
                                            <p> </p>
                                        </c:if>  
                                        
                                    <c:if test="${status=='success'}">
                                        <p style="color:green">Register Successfully</p>
                                    </c:if>
                                  <c:if test="${status=='fail'}">
                                        <p style="color:red">${reg}</p>
                                    </c:if>
                                </div>
                                
                                
                                <c:set var="rs" value="${sessionScope.rs}"> </c:set>>
                                <c:if test="${fun:length(rs)>0}">
                                    <p style="color:red"> <c:out value="${rs}"></c:out>  </p>
                                </c:if>
                                
                                
					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="login">
							Already have account?Login 
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>