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
		<%
		String cid = request.getParameter("cid");
		String cname= request.getParameter("cname"); 
		String fname= request.getParameter("fname");
		String lname= request.getParameter("lname");
		String sType= request.getParameter("sType");
		String reason= request.getParameter("reason");
	    String address= request.getParameter("address");
	    String email= request.getParameter("email");
	    String fLimit= request.getParameter("fLimit");
	    String letter= request.getParameter("letter");
	    String password = request.getParameter("password");
	  
	  %>
	  
	  
<div class="formdiv">
	<h1>Update Comapany Details</h1>
	<form action="updateess" method="post">
	<table>
		<tr>
			<td>Company ID</td>
			<td><input type="text" name="cId" value="<%= cid %>" readonly></td>
		</tr>
		<tr>
			<td>Company Name</td>
			<td><input type="text" name="cName" value="<%= cname %>"></td>
		</tr>
		<tr>
			<td>Manager First Name</td>
			<td><input type="text" name="fName" value="<%= fname %>"></td>
		</tr>
		<tr>
			<td>Manager Last Name</td>
			<td><input type="text" name="lName" value="<%= lname %>"></td>
		</tr>
		<tr>
			<td>Service Type</td>
			<td><input type="text" name="type" value="<%= sType %>"></td>
		</tr>
		<tr>
			<td>Reason</td>
			<td><input type="text" name="reason" value="<%= reason %>"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="text" name="address" value="<%= address %>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="<%= email %>"></td>
		</tr>
		<tr>
			<td>Fuel Limit</td>
			<td><input type="text" name="limit" value="<%= fLimit %>"></td>
		</tr>
		<tr>
			<td>Letter</td>
			<td><input type="text" name="letter" value="<%= letter %>"></td>
		</tr>
		<tr>
		<td>password</td>
			<td><input type="password" name="password" value="<%= password %>"></td>
		</tr>

	</table>
	<br>
	<input type="submit" name="submit" value="Update Data">
	</form>
</div>	
</body>
</html>