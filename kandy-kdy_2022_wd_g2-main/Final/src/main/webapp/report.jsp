<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
    
   <%Connection conn;



Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "SELECT avg(totalOT),avg(totalLeave),avg(totalDaysWorked) from fuelstaff.attendance ";
String sql1 = "SELECT max(totalOT), max(totalLeave), max(totalDaysWorked) from  fuelstaff.attendance ";
Statement pst1 = conn.createStatement();
Statement pst2 = conn.createStatement();

    

   ResultSet result = pst1.executeQuery(sql);
   ResultSet result1 = pst2.executeQuery(sql1);
	
		
	   
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Report</title>
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
  
  #reportbtn
{
	background-color: rgba(0,0,0,0.5);
	color: #FFFFFF;
	border: solid 2px #FFFFFF;
	width:15%;
	padding:15px;
	font-size:20px;
	transition-duration: 200ms;
	font-weight: bold;
}

#reportbtn:hover
{
	background-color: #3CB371;
	color: #FFFFFF;
	border: solid 2px #3CB371;
}
</style>
</head>
<body>
<h1 style = "color:white;"> <center>Attendance Management </center></h1><br><br>
<h2 style = "color:white;"><center>Average of Employees </center></h2>
	
<table class="content-table">
<thead>
	<tr>
		<th>Average OverTime Worked</th>
		<th>Average Total Leave Taken</th>
		<th>Average Total Days Worked</th>

	</tr>
	</thead>
	<tbody>
	<%while(result.next()){ %>
	<tr>
		<td><%out.print(result.getString("avg(totalOT)")); %></td>
			<td><%out.print(result.getString("avg(totalLeave)")); %></td>
				<td><%out.print(result.getString("avg(totalDaysWorked)")); %></td>
			
	</tr>
	<%} %>
	</tbody>
</table>
<br>
<h2 style = "color:white;"><center>Maxiumum of Employees </center></h2>



<table class="content-table">
<thead>
    <tr>
        <th>Most OverTime Worked</th>
        <th>Most Leave Taken</th>
        <th>Most Days Worked</th>



   </tr>
    </thead>
    <tbody>
    <%while(result1.next()){ %>
    <tr>
        <td><%out.print(result1.getString("max(totalOT)")); %></td>
            <td><%out.print(result1.getString("max(totalLeave)")); %></td>
                <td><%out.print(result1.getString("max(totalDaysWorked)")); %></td>
            
    </tr>
    <%} %>
    </tbody>
</table>
<br>
<button id = "reportbtn" onclick="window.print()" style="margin-left:1200px;">Print</button>
</body>
</html>