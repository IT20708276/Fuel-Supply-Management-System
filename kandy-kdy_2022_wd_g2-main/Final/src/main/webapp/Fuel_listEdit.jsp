<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Insert title here</title>

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

<script type="text/javascript">
	function alertUpdate(){
		alert("Updated Successfully");
		}
</script>

<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #1e90ff ">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Fuel Supply Management </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Fuel Details</a></li>
			</ul>
		</nav>
	</header>
	<br>

 	<h3 class="text-center" style="color:white;">Edit Fuel Prices</h3>
			<hr>



				<%Connection conn;
			
						String id=request.getParameter("id");


						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
						String sql = "select * from fuel_type where FuelID='"+id+"'";
						Statement pst1 = conn.createStatement();
					
						   ResultSet result = pst1.executeQuery(sql);
						    %>
	








	<div class="container">



<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
<form action="edit1" method="post" onsubmit = "alertUpdate()">

			
					<%while(result.next()){ %>
						
	<fieldset class="form-group">
						Fuel Name<input type="text" value=" <%out.print(result.getString("Name")); %>" >
						<input type="hidden" value=" <%out.print(result.getString("FuelID")); %>" name="id">
    </fieldset>
		
	<fieldset class="form-group">
	
					Selling Price<input type="number" value="<%out.print(result.getString("sellingPrice")); %>" name="sprice">
	</fieldset>						

    <fieldset class="form-group">

					Purchasing Price<input type="number" value="<%out.print(result.getString("purchasingPrice")); %>" name="pprice">
</fieldset>
						<%} %>
						<input type="submit" value="Update" class="btn btn-success" onsubmit = "alertUpdate()">
		


</form>
</div></div></div>
</div>
</body>
</html>