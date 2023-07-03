<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--  <link rel="stylesheet" href="Assets/CSS/Userdel.css"> -->
<style>
     <%@ include file="Assets/CSS/Userdel.css"%>
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
<script>
function alertDelete(){
alert("Deleted Successfully");

}

</script>
<%
	String nic=request.getParameter("nic");
	String pswd=request.getParameter("pswd");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String address=request.getParameter("address");
%>
<div class="center">
	<form action="DeleteUserServlet" method="post" onsubmit = "alertDelete()">
	<div class="text_field">
		NIC<input type="text" name="nic" value="<%= nic %>" readonly><br>
	</div>
	<div class="text_field">
		Password<input type="password" name="pswd" value="<%= pswd %>" readonly ><br>
	</div>
	<div class="text_field">
		First Name<input type="text" name="fname" value="<%= fname %>" readonly><br>
	</div>
	<div class="text_field">
		Last Name<input type="text" name="lname" value="<%= lname %>" readonly><br>
	</div>
	<div class="text_field">
		Address<input type="text" name="address" value="<%= address %>" readonly><br>
	</div>
		<input type="submit" name="submit" value="Delete Account"><br><br><br><br>
	</form>
</div>

</body>
</html>