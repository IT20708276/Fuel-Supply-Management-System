<%@ page import = "java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="myCSS/staff.css">
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="staffreg">

	<a class="crossbtn" href="ListStaff.jsp"><i class="fa fa-times" aria-hidden="true"></i></a>
	
	<form method="POST" action= "<%= request.getContextPath() %>/RegisterStaff">
	  		<center><h2> STAFF MANAGEMENT </h2></center>
	  		
	  		<br>
	  		
		    <table>

			<tr>
				<td>First Name</td>
				<td><input type="text" name="FirstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="LastName" /></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><input type="text" name="Age" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><textarea name="Address"></textarea> </td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="Email" /></td>
			</tr>
			<tr>
				<td>Account No</td>
				<td><input type="text" name="AccNo" /></td>
			</tr>
			<tr>
				<td>Joined Year</td>
				<td><input type="text" name="JoinedYear" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="Password" /></td>
			</tr>
			<tr>
				<td>Staff Type</td>
				<td>
				<input type="text" name="StaffType" />
					<!--  <select>
						<option> Permanent </option>
						<option> Contract Basis</option>
					</select> -->
				</td>
			</tr>
			<tr>
				<td>Contract Years</td>
				<td><input type="text" name="ContactYears" /></td>
			</tr>
			<tr>
				<td>Basic Salary</td>
				<td><input type="text" name="BasicSalary" /></td>
			</tr>
			<tr>
				<td>OT Rate/h</td>
				<td><input type="text" name="Ot" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Register Staff" /> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="reset" id="redbtn" value="Reset" /></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>