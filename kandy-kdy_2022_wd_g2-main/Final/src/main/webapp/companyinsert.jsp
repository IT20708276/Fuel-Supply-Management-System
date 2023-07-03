<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
     <%@ include file="essentialservicesCSS/mystyles.css"%>
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
<div class="formdiv">

	<h1>Enter Your Company Details</h1>
	<form action="insertess" method="post">
	<table>
		<tr>
			<td>Company Name</td>
			<td><input type="text" name="Cname"></td>
		</tr>
		<tr>
			<td>Manager First Name</td>
			<td><input type="text" name="fName"></td>
		</tr>
		<tr>
			<td>Manager Last Name</td>
			<td><input type="text" name="lName"></td>
		</tr>
		<tr>
			<td>Service Type</td>
			<td><input type="text" name="type"></td>
		</tr>
		<tr>
			<td>Reason</td>
			<td><input type="text" name="reason"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>Fuel Limit</td>
			<td>
			<input list="limits" name="limits">
			  <datalist id="limits">
			    <option value=60>
			    <option value=70>
			    <option value=80>
			    <option value=100>
			  </datalist></td>
		</tr>
		<tr>
			<td>Letter</td>
			<td><input type="text" name="letter"></td>
		</tr>
		<tr>
			<td>password</td>
			<td><input type="password" name="password"></td>
		</tr>	
	</table>
	<br>
		<input type="submit" name="submit" value="Create Company">
	</form>
</div>
</body>
</html>