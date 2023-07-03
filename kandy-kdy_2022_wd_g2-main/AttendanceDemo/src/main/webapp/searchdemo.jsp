<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%
Connection conn;

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","0779825509");
String sql = "select * from slip";
Statement pst1 = conn.createStatement();
ResultSet result = pst1.executeQuery(sql);

String sql1 = "select * from employee";
Statement pst2 = conn.createStatement();
ResultSet result1 = pst2.executeQuery(sql1);
%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="search.jsp" method="get">
		<button>
			<a href="slipinsert.jsp"> Add Slip </a>
		</button>
		    <input type="text" name="id" id="search" name="search"
			placeholder="search slip...">
	</form>

	<table width="350px" border="1">

		<tr>

			<th>Employee ID</th>
		
			<th>Actions</th>
		</tr>
	
		<tr>
<%while (result.next()){%>
<td>
<%out.print(result.getString("staffID"));%>
  </td>



<td> 
&nbsp;&nbsp; 
	
<button><a href="useraccount.jsp?id=<%out.println(result.getString("id"));%>"> View</a></button> 

</td>

</tr>
		
<%}%>
	</table>
</body>
</html>