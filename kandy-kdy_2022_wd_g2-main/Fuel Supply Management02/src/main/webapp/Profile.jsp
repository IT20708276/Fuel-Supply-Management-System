<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String nic=request.getParameter("nic");
	String pswd=request.getParameter("pswd");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String address=request.getParameter("address");
%>

	<form action="update" method="post">
		NIC<input type="text" name="nic" value="<%= nic %>" readonly><br>
		Password<input type="password" name="pswd" value="<%= pswd %>" ><br>
		First Name<input type="text" name="fname" value="<%= fname %>" ><br>
		Last Name<input type="text" name="lname" value="<%= lname %>" ><br>
		Address<input type="text" name="address" value="<%= address %>" ><br>
		<input type="submit" name="submit" value="Edit"><br> 
	</form>


</body>
</html>