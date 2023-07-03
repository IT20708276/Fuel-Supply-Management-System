<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%Connection conn;

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FMS","root","1234");
String sql = "select * from vehicle";
Statement pst1 = conn.createStatement();

String uid = "U0000";

session = request.getSession();
session.setAttribute("uid",uid );
	

	

	ResultSet result = pst1.executeQuery(sql); 
	%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vehicle Management DashBoard</title>

 <link rel="stylesheet" href="assets/CSS/maicons.css">

  <link rel="stylesheet" href="assets/CSS/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/CSS/theme.css">
  <link rel="stylesheet" type="text/css" href="assets/CSS/dashboard.css">
</head>
<body>

<div class="add-postion">
	<button class="btn button-view btn-act-pos"><a href="VMS-CR.jsp" class="a">Add Vehicle</a></button>
	<form action="Search.jsp" method="get">
	<input type="text" name="key" id="search" class="search " name="search" placeholder="search vehicle..." autocomplete="off">
	
</form>
</div>

<form>
<table class="content-table" >
<thead>
	<tr>
		<th>Plate Number</th>
		<th>Actions</th>
	</tr>
</thead>
<tbody>
		<%
			while (result.next()){
				%>
				
				<tr>
				
				 <td><%out.print(result.getString("plateNumber")); %>  </td>  
				
					<td> &nbsp;&nbsp; <button class="button button-view "><a class="a" href="VMS-Vw.jsp?np=<%out.print(result.getString("plateNumber"));%>"> View</a></button>
					
						&nbsp;&nbsp; <button class="button button-edit "><a class="a" href="VMS-ED.jsp?np=<%out.print(result.getString("plateNumber"));%>"> Edit</a></button>
						
						 &nbsp;&nbsp; <button class="button button-delete"><a class="a" href="VMS-DEL.jsp?np=<%out.print(result.getString("plateNumber"));%>" onclick="return confirm('Are you sure want to delete vehicle <% out.print(result.getString("plateNumber"));  %>?')" id="link"> Delete</a></button>
					</td>		
				</tr>
				
				
				<%
			}
		
		%>	
	</tbody>	
	</table>
</form>
</body>
<script type="text/javascript" src = "assets/JS/validations.js"></script>
</html>