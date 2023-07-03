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
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: 	#1e90ff ">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Fuel Supply
					Management </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Fuel Details</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Fuel details</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					Fuel</a>
			</div>
			
			
				<div class="container text-right">
			
				<input type="search" id="fueltype" name="fueltype"
   placeholder="Search..."
   >
  <button class="btn btn-success"> Search</button>
				
			</div>	
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Fuel Type</th>
						<th>Current Stock</th>
						<th>Refilled Amount</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.gid}" /></td>
							<td><c:out value="${user.fueltype}" /></td>
							<td><c:out value="${user.cstock}" /></td>
							<td><c:out value="${user.refamount}" /></td>
							<td><a href="edit?gid=<c:out value='${user.gid}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?gid=<c:out value='${user.gid}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>






<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Fuel Price Details</h3>
			<hr>
			<div class="container text-left">







				<%Connection conn;



						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/femo","root","Aashy#12*2002");
						String sql = "select * from fuel_type";
						Statement pst1 = conn.createStatement();
					
						   ResultSet result = pst1.executeQuery(sql);
						    %>
	

				
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Fuel ID</th>
						<th>Fuel Name</th>
						<th>Fuel type</th>
						<th>Selling Price</th>
						<th>Purchasing Price</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					
				
				<%while(result.next()){ %>
				
				
						<tr>
							<td> <%out.print(result.getString("FuelID")); %></td>
							<td><%out.print(result.getString("Name")); %></td>
							<td><%out.print(result.getString("fueltype")); %></td>
							<td><%out.print(result.getString("sellingPrice")); %></td>
							<td><%out.print(result.getString("purchasingPrice")); %></td>
						</tr>
						
						<%} %>
					
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>










<div class="container text-right">

				<a href="Graph.jsp"class="btn btn-success">Show Price Overview</a>
			</div>












</body>
</html>