<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@page import="java.io.PrintWriter , java.sql.*"%>
	
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
		        
<style>
     <%@ include file="assetSalary/css/mystyles.css"%>
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

<%Connection conn;
ResultSet result=null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select * from staff";
Statement pst1 = conn.createStatement();
    
//session.setAttribute("name",uname );




        



   result = pst1.executeQuery(sql);



   
    %>    


<!-- 
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: green">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> SALARY </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header> -->
	<br>
	
	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center"  style = "color:white;">Updated Salary Detail</h3>
			<hr>
			<button> <a href = "SalaryReport.jsp"> Generate Report </a></button> 
			<div class="container text-left">

			
			</div>
			
			<table class="table table-bordered"  style = "color:white;">
				<thead>
					<tr>
						<th>ID</th>
						<th>Date</th>
						<th>Deducted Amount</th>
						<th>Reason for Deduction</th>
						<th>Final Salary</th>
						<th>Actions</th>
						
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.date}" /></td>
							<td><c:out value="${user.amount}" /></td>
							<td><c:out value="${user.reason}" /></td>
							<td><c:out value="${user.finalsalary}" /></td>
							<td><a href="editSalary?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteSalary?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>