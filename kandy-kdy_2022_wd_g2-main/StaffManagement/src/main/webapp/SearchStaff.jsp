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
	                <th>Age</th>
	                <th>Address</th>
	                <th>Email</th>
	                <th>Account No</th>
	                <th>Joined Year</th>
	                <th>Password</th>
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
			<td> <%=resultSet.getInt("Age") %> </td>
			<td> <%=resultSet.getString("Address") %> </td>
			<td> <%=resultSet.getString("Email") %> </td>
			<td> <%=resultSet.getString("AccNo") %> </td>
			<td> <%=resultSet.getInt("JoinedYear") %> </td>
			<td> <%=resultSet.getString("Password") %> </td>
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