<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet" href="Assets/CSS/UserRegistration.css">
</head>
<body>

<div class="center">
	<form action="insert" method="post">
	
	<h3>Registration</h3>
		<div class="text_field">
			<label>NIC</label>
			<input type="text" required name="nic">
		</div>
		
		<div class="text_field">
			<label>First Name</label>
			<input type="text" required name="fname">
		</div>
		
		<div class="text_field">
			<label>Last Name</label>
			<input type="text" required name="lname">
		</div>
		
		<div class="text_field">
			<label>Password</label>
			<input type="password" required name="password">
		</div>
		
		<div class="text_field">
			<label>Confirm Password</label>
			<input type="password" required name="cpassword">
		</div>
		<div class="text_field">
			<label>Email</label>
			<input type="email" required name="email">
			<button type="button">Send OTP</button>
		</div>
		
		<div class="text_field">
			<label>OTP</label>
			<input  type="text" required name="otp">
			<button type="button">Verify OTP</button>
		</div>
		
		<div class="text_field">
			<label>Address</label>
			<input type="text" required name="address">
		</div>
		
	    <input type ="submit" name="signupbtn" Value="Sign Up">
	</form>
</div>

</body>
</html>