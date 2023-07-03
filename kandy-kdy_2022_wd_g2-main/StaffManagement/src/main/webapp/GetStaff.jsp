<%@ page import = "java.util.Date" %>
<%@page import="com.itp.model.Staff"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<%
		Staff s1 = (Staff) request.getAttribute("s1");
	%>
<div class="staffreg">

	<a class="crossbtn" href="ListStaff.jsp"><i class="fa fa-times" aria-hidden="true"></i></a>

	<form method="POST" action="UpdateStaff">
	
	<center> <h2> UPDATE / DELETE STAFFS </h2></center> <br>
	
		<table>
			<tr>
				<td>Staff ID</td>
				<td><input type="text" name="StaffID" disabled="disabled" value="<%=s1.getStaffID()%>" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="FirstName" value="<%=s1.getFirstName()%>" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="LastName" value="<%=s1.getLastName()%>" /></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><input type="text" name="Age" value="<%=s1.getAge()%>" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="Address" value="<%=s1.getAddress()%>" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="Email" value="<%=s1.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Account No</td>
				<td><input type="text" name="AccNo" value="<%=s1.getAccNo()%>" /></td>
			</tr>
			<tr>
				<td>Joined Year</td>
				<td><input type="text" name="JoinedYear" value="<%=s1.getJoinedYear()%>" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="Password" value="<%=s1.getPassword()%>" /></td>
			</tr>
			<tr>
				<td>Staff Type</td>
				<td><input type="text" name="StaffType" value="<%=s1.getStaffType()%>" /></td>
			</tr>
			<tr>
				<td>Contract Years</td>
				<td><input type="text" name="ContactYears" value="<%=s1.getContactYears()%>" /></td>
			</tr>
			<tr>
				<td>Basic Salary</td>
				<td><input type="text" name="BasicSalary" value="<%=s1.getBasicSalary()%>" /></td>
			</tr>
			<tr>
				<td>OT/h</td>
				<td><input type="text" name="Ot" value="<%=s1.getOt()%>" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="StaffID" value="<%=s1.getStaffID()%>" /> 
				<input type="submit" value="Update Staff"/>
				</td>
			</tr>
		</table>
	</form>

	<form method="POST" action="DeleteStaff">
	<table>
		<tr>
			<td colspan="2">
				<!--  <form method="POST" action="DeleteStaff"> -->
					<input type="hidden" name="StaffID" value="<%=s1.getStaffID()%>" /> 
					<input id="redbtn" type="submit" value="Delete Staff"/>
				<!--  </form> -->
			</td>
		</tr>
	</table>
	</form>
 </div>	
</body>
</html>