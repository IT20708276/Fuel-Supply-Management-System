<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="Assets/CSS/forgotpass1.css">-->
<!-- <script type="text/javascript" defer src="UserReg.js"> </script>  -->
<style>
	<%@ include file="Assets/CSS/forgotpass1.css"%>
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
	<form action="ForgotPass1" method="post">
	<h3>Forgot Password</h3>
		<div class="text_field">
			
			<input type="email" required name="email" id="em" >
			<br><br>
			<label>Email</label>
			<script>
			
				
				
				openPage = function() {
				var em = document.getElementById("em").value;
				location.href = "SendOtp2.jsp?Key="+em;
				}
			</script>
			<button type="button" class="sendotpbtn" ><a href= "javascript:openPage()" >Send OTP</a></button>
			
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
		
		
		
	    <input type ="submit" name="forgotnext" Value="Next"><br>
	    <br><br>
	   
	</form>
</div>
</body>
</html>