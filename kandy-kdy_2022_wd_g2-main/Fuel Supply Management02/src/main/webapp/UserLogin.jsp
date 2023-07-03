<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="stylesheet" href="Assets/CSS/Userlogin.css">

</head>
<body>
<div class="center">
	<form action="log" method="post">
	<h3>Login</h3>
		<div class="text_field">
		
			<input type="text" name="nic" required/>
			<span></span>
			<label>NIC</label>
			
		</div>
		
		<div class="text_field">
			<input type="password" name="pswd" required/>
			<span></span>
			<label>Password</label>
			
		</div>
		
		
		
	    <input type ="submit" name="Loginbtn" Value="Login"><br>
	    <br><br>
	    <div class="fpass">
	    	<a href="#">Forgot password?</a>
	    </div>
	    <div class="signup">
	    Not a member?<a href="UserRegistration.jsp">Sign Up</a>
	    </div>
	</form>
</div>



</body>
</html>