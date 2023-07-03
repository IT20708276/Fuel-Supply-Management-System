<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%Connection conn;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String key = request.getParameter("key");
String sql = "select * from users where fueltype like '%"+key+"%'";
Statement pst1 = conn.createStatement();
ResultSet result = pst1.executeQuery(sql);%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searched Details</title>
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
       
       	<h3 class="text-center" style="color:white;">Search Result</h3>
			<hr>

<div class="add-postion">          </div>

	<div class="container">
<form>
<table class="table table-bordered" style="color:white;">
				<thead>
					<tr>
						
						<th>Fuel Type</th>
						<th>Current Stock</th>
						<th>Refilled Amount</th>
						
					</tr>
				</thead>
										
						<tbody>
							<%while (result.next()){%>
							
							<tr>
							<td><%out.print(result.getString("fueltype")); %>  </td> 
							<td><%out.print(result.getString("cstock")); %>  </td>
							<td><%out.print(result.getString("refamount")); %>  </td> 
							
							
							</tr>
							
							<tr><td> &nbsp;&nbsp; 
							
							</td>
							</tr>
						</tbody>





</table>
</div>

<%} %>
</form>
</body>

</html>

