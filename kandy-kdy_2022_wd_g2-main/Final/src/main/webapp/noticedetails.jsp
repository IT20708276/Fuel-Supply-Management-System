<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <!-- including JSTL Core libraries to use tags  -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Viewing a Notice</title>
<!-- CSS link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="noticecss/noticesdetailstyles.css" rel="stylesheet"/>
 <style>
     <%@ include file="noticecss/noticesdetailstyles.css"%>
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
<!-- header menu bar -->
<div class="header">
    	<a href="#">Home</a>
    	<a href="#">Contact Us</a>
    	<a href="#">About Us</a>
  	</div>


 
<%
	
	String id = request.getParameter("noticeid");
	String notice_title = request.getParameter("noticetitle");
	String notice_type = request.getParameter("noticetype");
	String notice_date = request.getParameter("noticedate");
	String notice_desc = request.getParameter("noticedesc");
	String notice_email = request.getParameter("noticeemail");
%>


<!-- Notice will be displayed -->
<div class="container">
		  <!-- Back Button -->
		<form action = "notbrd" method = "post">
		<a href="UserHomepage.jsp"><button class="notice-back-button"><i class="fa fa-times" aria-hidden="true"></i></button></a>
		  </form>
		 <h1 class="not-title"><%= notice_title%></h1><h2 class="not-date"><%= notice_date%></h2><br>
		 <hr>
		<h3 class="not-desc"><%= notice_desc%></h3>
		<br>
		<h5 class="notice-email"><%= notice_email%></h5><br>
</div>
</body>


</html>