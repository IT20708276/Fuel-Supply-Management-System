<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">

<style>
     <%@ include file="css/style.css"%>
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
	<div class="header">
    <a href="#">Home</a>
    <a href="#contactus">Contact Us</a>
    <a href="#aboutus">About Us</a>
  </div>
  <div class="homediv">
    <h1>Fuel Supply Management</h1>
    <div class="btnclass">
      <a class="userbtn" href="UserLogin.jsp">Login</a>
      <a class="userbtn" href="UserRegistration.jsp">Sign Up</a>
    </div>
  </div>
</body>
</html>