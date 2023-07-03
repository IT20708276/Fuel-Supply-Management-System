<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
        <link rel="stylesheet" href="css/mystyles.css">
        
          <style>
     <%@ include file="AttendanceCSS/mystyles.css"%>
      body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
</head>
 <%
 String stid = request.getParameter("id");
 
 %>
 
 <%Connection conn;



Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select * from staff where staffID = '"+stid+"'";
Statement pst1 = conn.createStatement();
String sql1 = "select * from attendance where staffID = '"+stid+"'";
Statement ps = conn.createStatement();

   ResultSet result = pst1.executeQuery(sql);
   ResultSet result1 = ps.executeQuery(sql1);
   if(result.next()){
	String em = result.getString("Email");
       
       session.setAttribute("Email",em);
   
    %>
<body>
<div class = "container">
<button class ="w3-button w3-orange" ><a href = "indexAttendance.jsp">Dashboard</a>
   </button>
   <h1 style="color:white;"><center> Employee Slip</center></h1>
<div class = "list" style="margin-left:200px">

<table cellpadding = "25" class = "center">
	<tr>
	<th>Employee ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Slip ID</th>
    <th>Total OT</th>
    <th>Total Leave</th>
    <th>Month</th>
    <th>Total Days Worked</th>
	</tr>
	
	<tr>
	 <td><%out.print(result.getString("StaffID"));%></td>
    <td> <%out.print(result.getString("FirstName"));%></td>
    <td><%out.print(result.getString("Email"));%></td>
    
 <%}
 if(result1.next()){
 %>
  <td><%out.print(result1.getString("attendanceID"));%></td>
   <td><%out.print(result1.getString("totalOT"));%></td>
    <td><%out.print(result1.getString("totalLeave"));%></td>
     <td><%out.print(result1.getString("month"));%></td>
      <td><%out.print(result1.getString("totalDaysWorked"));%></td>
	</tr>
	   <%} %>
</table>

</div>
</div>

<div class="w3-container">
<div class="w3-bar" style="margin-left:240px">



 <button class="w3-bar-item w3-button w3-black" style="width:33.3%"><a href="email1.jsp">Send Email</a></button></center>
  
  <button class="w3-bar-item w3-button w3-red" style="width:33.3%"onclick="window.print()">Print this page</button>    </center>



 </div>



</div>
</body>
</html>