<%@page import="com.itp.model.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itp.service.StaffInterface"%>
<%@page import="com.itp.service.StaffInterfaceImpl"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.DriverManager" %>
<%@page import= "java.sql.PreparedStatement" %>
<%@page import= "java.sql.ResultSet" %>
<%@page import= "java.sql.Statement" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/fuelstaff?characterEncoding=utf8";
String userid = "root";
String password = "Vithya24";
String StaffID =request.getParameter("StaffID");
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel = "stylesheet" type = "text/css" href = "myCSS\staff.css" />
	<link rel="stylesheet" href="css/style.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
     <%@ include file="css/style.css"%>
     <%@ include file="myCSS\staff.css"%>
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
<%@include file = "Header.jsp" %>

<div class = "list">
<a class="backbtn" href="ListStaff.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>
	<table cellpadding="12">
		<caption><h2>Details of Staff</h2></caption>
			  <tr>
	                <th>Staff ID</th>
	                <th>First Name</th>
	                <th>Last Name</th>
	                <th>NIC</th>
	                <th>Address</th>
	                <th>Email</th>
	                <th>Account No</th>
	                <th>Staff Type</th>
	                <th>Contract Years</th>
	                <th>Basic Salary</th>
	                <th>OT/h</th>
	                <th>Select</th>
	            </tr>
		<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from staff where StaffID='"+StaffID+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		<tr>
			<td> <%=resultSet.getString("StaffID") %> </td>
			<td> <%=resultSet.getString("FirstName") %> </td>
			<td> <%=resultSet.getString("LastName") %> </td>
			<td> <%=resultSet.getString("NIC") %> </td>
			<td> <%=resultSet.getString("Address") %> </td>
			<td> <%=resultSet.getString("Email") %> </td>
			<td> <%=resultSet.getString("AccNo") %> </td>
			<td> <%=resultSet.getString("StaffType") %> </td>
			<td> <%=resultSet.getInt("ContractYears") %> </td>
			<td> <%=resultSet.getDouble("BasicSalary") %> </td>
			<td> <%=resultSet.getDouble("OTRate") %> </td>
			<td>
				<form method="POST" action="GetStaff">
					<input type="hidden" name="StaffID" value="<%=resultSet.getString("StaffID")%>"/>
					<input type="submit" value= "Select Staff" /> 
				</form>
			</td>			 
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>

</div>
</body>
</html>