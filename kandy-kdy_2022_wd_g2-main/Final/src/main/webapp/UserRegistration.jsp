<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet" href="Assets/CSS/UserRegistration.css">
<script type="text/javascript" defer src="UserReg.js"></script>
<style>
     <%@ include file="Assets/CSS/UserRegistration.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
<script>
	<%@ include file="UserReg.js"%>
</script>
</head>
<body>

<div class="center">
	<form action="UserInsert" method="post" onsubmit="return validateForm()">
	
	<h3>Registration</h3>
		<div class="text_field">
			
			<input type="text" required name="nic" id ="nic">
			
			<label>NIC</label>
		</div>
		
		<div class="text_field">
			
			<input type="text" required name="fname">
			
			<label>First Name</label>
			
		</div>
		
		<div class="text_field">
			
			<input type="text" required name="lname">
			
			<label>Last Name</label>
		</div>
		
		
		<div class="text_field">
			
			<input type="email" required name="email" id="em" >
			<br><br>
			<label>Email</label>
			<script>
			
				
				
				openPage = function() {
				var em = document.getElementById("em").value;
				location.href = "SendOtp.jsp?Key="+em;
				}
			</script>
			<button type="button" class="sendotpbtn"><a href= "javascript:openPage()" >Send OTP</a></button>
			
		</div>
		
		<style>
        
                a:link{
    text-decoration:none;
    color:white;
}
        </style>
		
		<div class="text_field">
			
			<input  type="text" required name="otp" id="otp">
			<br><br>
			<label>OTP</label>
			<button type="button" onclick="verifyOtp()" class="verifyotp"  >Verify OTP</button>
			
			
		</div>
		<div class="text_field">
			
			<input type="password" required name="password" id="password">
			
			<label for="password">Password</label>
		</div>
		
		<div class="text_field">
			
			<input type="password" required name="cpassword" id="cpassword">
			
			<label for="cpassword">Confirm Password</label>
			<p id="message"></p>
			<button type="button" onclick="checkpassword()" class="nextbtn">Next</button>
			
		</div>
		<div class="text_field">
			
			<input type="text" required name="address">
			<br><br>
			<label>Address</label>
		</div>
		
	    <input type ="submit" name="signupbtn" Value="Sign Up">
	    <br><br>
	</form>
</div>

</body>
</html>