<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- including JSTL Core libraries to use tags  -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<!-- CSS link -->
 <link href="noticecss/prioritynoticepage.css" rel="stylesheet"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
     <%@ include file="noticecss/prioritynoticepage.css"%>
       body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
<body>
<!-- header menu bar -->
<div class="header">
    	<a href="#">Home</a>
    	<a href="#">Contact Us</a>
    	<a href="#">About Us</a>
  	</div>

<!-- View Notice board button-->
<form action="notbrd" method="post">
		<button type="submit" name="submit" class="noticeboard-btn" value="NoticeBoard">NoticeBoard</button>
</form>

<!-- view priority notices button -->
<form action="show" method="post">
	<button type="submit" name="submit" class="not-inst-delete" value="Show Notices" ><i class="fa fa-bell" aria-hidden="true"></i></button>
</form>
<!-- middle banner -->
<div class = "homediv">

</div>

<!-- priority notice window -->
<table>

<c:forEach var="prnotic" items="${prionot}">
<tr>
	<td><c:out value="${prnotic.id}"/></td>
	<td><c:out value="${prnotic.title}"/></td>
	<td><c:out value="${prnotic.date}"/></td>
	<td><c:out value="${prnotic.email}"/></td>
</tr>
				

		
</c:forEach>
</table>

</body>

</html>