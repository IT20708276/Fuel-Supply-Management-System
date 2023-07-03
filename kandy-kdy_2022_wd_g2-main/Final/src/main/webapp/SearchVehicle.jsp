<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%Connection conn;

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String key = request.getParameter("key");
String uid = (String)session.getAttribute("userID1");
String sql = "select * from vehicle where plateNumber like '%"+key+"%' and userID = '"+uid+"'";
Statement pst1 = conn.createStatement();
	
//session.setAttribute("name",uname );


	

	ResultSet result = pst1.executeQuery(sql); 
	%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searched Details</title>

 <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
 
  	<style>
  	 <%@ include file="assetsVehicle/CSS/dashboard.css"%>
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
            style="background-color: #00008B">
     			<h1 class="text-center wow fadeInUp" style="color:white;">Searched Results</h1>
        </nav>
    </header>
    
	<div class="header-top">
    <a href="#" class="head-a btn button-view">Home</a>
    <a href="#contactus" class="head-a btn button-view">Contact Us</a>
    <a href="#aboutus" class="head-a btn button-view">About Us</a>
  </div>

<div class="add-postion">
	<button class="button  button-add add-search"><a href="VMS-CR.jsp" class="a">Add Vehicle</a></button>
	<button class="button  button-add add-vwAll"><a href="indexVehicle.jsp" class="a">View All Vehicles</a></button>
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