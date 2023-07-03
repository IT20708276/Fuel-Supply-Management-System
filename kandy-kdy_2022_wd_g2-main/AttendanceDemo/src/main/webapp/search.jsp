<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%
Connection conn;
String key = request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","0779825509");
String sql = "select * from slip where staffID = '"+key+"'";
Statement pst1 = conn.createStatement();
ResultSet result = pst1.executeQuery(sql);


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
	
<button><a href="display.jsp?id=<%out.println(result.getString("id"));%>"> View</a></button> 

</td>

</tr>
		
<%}%>
	</table>
</body>
</html>