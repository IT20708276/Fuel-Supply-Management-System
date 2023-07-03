<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
    
   <%Connection conn;


   String key = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select * from attendance where staffID = '"+key+"' ";
Statement pst1 = conn.createStatement();
    

   ResultSet result = pst1.executeQuery(sql);

	
		
	   
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="AttendanceCSS/table.css">
  <style>
     <%@ include file="AttendanceCSS/table.css"%>
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
<form action="searchdemo.jsp" method="get">

	
		<h1 style="color:white;"><center>Attendance Management</center></h1>
	<div class="add-postion">
		<button class="button button-add">
			<a href="slipinsert.jsp" class="a" > Create Slip </a>
		
		</button>
		<button class="button button-generate">
			<a href="report.jsp" class="a" > Generate Report </a>
		
		</button>
		<form action="searchdemo.jsp" method="get">
		
		    <input type="text" name="id" id="search" class="search" name="search"
			placeholder="Type Employee ID...">
	</form>
	</div>
<table class = "content-table">
<thead>
	<tr>
		<th>Employee Name</th>
		<th>Actions</th>
	</tr>
	</thead>
	<tbody>
	<%while(result.next()){ %>
	<tr>
		<td><%out.print(result.getString("staffID")); %></td>
		
		
			<td>
			&nbsp;&nbsp; 
				<button class="button button-view "><a href = "testAttendance.jsp?id=<%out.print(result.getString("staffID")); %>">View</a></button>
				<button class="button button-edit "><a href = "updateslip.jsp?id=<%out.print(result.getString("staffID")); %>">Edit</a></button>
				<button class="button button-delete"><a href = "deleteslip.jsp?id=<%out.print(result.getString("staffID")); %>">Delete</a></button>
			
			</td>
		
		
	</tr>
	<%} %>
	</tbody>
</table>

</body>
</html>