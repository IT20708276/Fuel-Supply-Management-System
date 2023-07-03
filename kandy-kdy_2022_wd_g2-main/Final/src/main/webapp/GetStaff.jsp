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

<script type="text/javascript" defer src="Script.js"></script>

<style>
     <%@ include file="css/style.css"%>
     <%@ include file="myCSS\staff.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 1000px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>

<script>
	<%@ include file="Script.js"%>
</script>

</head>
<body>


<script type="text/javascript">
function alertDelete(){
alert("Staff details are removed from the database");

function alertUpdate(){
	alert("Staff details has been updated");
	}
}
</script>


	<%
		Staff s1 = (Staff) request.getAttribute("s1");
	%>
<div class="staffreg">

	<a class="crossbtn" href="ListStaff.jsp"><i class="fa fa-times" aria-hidden="true"></i></a>

	<form method="POST" action="UpdateStaff" onsubmit="return validateForm(); alertUpdate();" >
	
	<center> <h2> UPDATE / DELETE STAFFS </h2></center> <br>
	
		<table>
			<tr>
				<td>Staff ID</td>
				<td><input type="text" name="StaffID" disabled="disabled" value="<%=s1.getStaffID()%>" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input id="fname" type="text" name="FirstName" value="<%=s1.getFirstName()%>" onkeyup="validateFName()" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input id="lname" type="text" name="LastName" value="<%=s1.getLastName()%>" onkeyup="validateLName()" /></td>
			</tr>
			<tr>
				<td>NIC</td>
				<td><input id="nic" type="text" name="NIC" value="<%=s1.getNIC()%>" onkeyup="validateNIC()" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><textarea id="address" name="Address" onkeyup="validateAddress()"> <%=s1.getAddress()%> </textarea> </td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input id="email" type="text" name="Email" value="<%=s1.getEmail()%>" onkeyup="validateEmail()" /></td>
			</tr>
			<tr>
				<td>Account No</td>
				<td><input id="accno" type="text" name="AccNo" value="<%=s1.getAccNo()%>" onkeyup="validateAccNo()" /></td>
			</tr>
			<tr>
				<td>Staff Type</td>
				<td><input id="stafftype" type="text" name="StaffType" value="<%=s1.getStaffType()%>" onkeyup="validateSType()" /></td>
			</tr>
			<tr>
				<td>Contract Years</td>
				<td><input id="cyears" type="text" style="display:block;" name="ContactYears" value="<%=s1.getContactYears()%>" onkeyup="validateYears()"" /></td>
			</tr>
			<tr>
				<td>Basic Salary</td>
				<td><input id="salary" type="text" name="BasicSalary" value="<%=s1.getBasicSalary()%>" onkeyup="validateSalary()"  /></td>
			</tr>
			<tr>
				<td>OT/h</td>
				<td><input id="ot" type="text" name="Ot" value="<%=s1.getOt()%>" onkeyup="validateOT()"" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="hidden" name="StaffID" value="<%=s1.getStaffID()%>" /> 
				<input type="submit" value="Update Staff"/>
				</td>
			</tr>
		</table>
	</form>

	<form method="POST" action="DeleteStaff" onsubmit = "alertDelete()">
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