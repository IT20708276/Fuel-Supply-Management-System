<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<!--  <link rel="stylesheet" href="Assets/CSS/Userlogin.css">-->
<style>
     <%@ include file="Assets/CSS/Userlogin.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
</head>
<body>
<div class="center">
	<form action="LoginServlet" method="post">
	<h3>Login</h3>
		<div class="text_field">
		
			<input type="text" name="username" required/>
			<span></span>
			<label>Username</label>
			
		</div>
		
		<div class="text_field">
			<input type="password" name="pswd" required/>
			<span></span>
			<label>Password</label>
			
		</div>
		
		
		
	    <input type ="submit" name="Loginbtn" Value="Login"><br>
	    <br><br>
	    <div class="fpass">
	    	<a href="forgot1.jsp">Forgot password?</a>
	    </div>
	    <div class="signup">
	    Not a member?<a href="UserRegistration.jsp">Sign Up</a>
	    </div>
	    <div class="signup">
	    <a href="companyinsert.jsp">Essential Service</a>
	    </div>
	</form>
</div>


</body>
</html>