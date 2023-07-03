<%@page import="sal.dao.Staff"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%Connection conn;
ResultSet result=null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select * from staff";
Statement pst1 = conn.createStatement();
    
//session.setAttribute("name",uname );



   result = pst1.executeQuery(sql);



   
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type = "text/css" href="asset/css/mystyles.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        
<style>
     <%@ include file="assetSalary/css/mystyles.css"%>
     <%@ include file="myCSS/mystyles.css"%>
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
<!-- 
<div class = "searchbar">
	<form action="SearchStaff.jsp" method = "post"> 
		<input type = "text" placeholder = "Enter Staff ID">
		<button type = "submit"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	</form>
</div>
 -->
<div class = "list">
	
	<table cellpadding="12">
			 <caption><h2>LIST OF STAFF</h2> <br> <br>
			 
			  <tr>
	                <th>Staff ID</th>
	                <th>First Name</th>
	                <th>Last Name</th>
	                <th>NIC</th>
	                <th>Address</th>
	                <th>Email</th>
	                <th>Account No</th>
	                <th>Password</th>
	                <th>Staff Type</th>
	                <th>Contract Years</th>
	                <th>Basic Salary</th>
	                <th>OT/h</th>
	                <th>Select</th>
	            </tr>
	            <%
	           	 while (result.next()){

				%>
				 <tr>
					<td> <%out.print(result.getString("StaffID")); %> </td>
					<td> <%out.print(result.getString("FirstName")); %> </td>
					<td> <%out.print(result.getString("LastName")); %> </td>
					<td> <%out.print(result.getString("NIC")); %></td>
					<td> <%out.print(result.getString("Address")); %> </td>
					<td> <%out.print(result.getString("Email")); %> </td>
					<td> <%out.print(result.getString("AccNo")); %> </td>
					<td> <%out.print(result.getString("Password")); %></td>
					<td> <%out.print(result.getString("StaffType")); %> </td>
					<td> <%out.print(result.getString("ContractYears")) ; %> </td>
					<td> <%out.print(result.getString("BasicSalary")); %>  </td>
					<td> <%out.print(result.getString("OTRate")); %> </td>	
					
					<td>
                    <button  name="select"
                    onclick="document.forms[0].action = 'display.jsp'; return true;"><a href="display.jsp?sid=<%out.print(result.getString("StaffID")); %>"> Select </a></button>
                    </td>
					
					</tr>			
				<%	
					}
	            %>     
	</table>

</div>
</body>
</html>