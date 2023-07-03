<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table>
 <c:forEach var ="emp" items ="${empDetails}"> 
 
 <c:set var="id" value="${emp.id}"/>
  <c:set var="totalOT" value="${emp.totalOT}"/>
   <c:set var="totalLeave" value="${emp.totalLeave}"/>
    <c:set var="month" value="${emp.month}"/>
     <c:set var="totalDaysWorked" value="${emp.totalDaysWorked}"/>
 
 
 <%
 session = request.getSession();
 String stid = (String)session.getAttribute("sid");
 
 
 %>
 
 <%Connection conn;



Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","0779825509");
String sql = "select * from employee where staffID = '"+stid+"'";
Statement pst1 = conn.createStatement();
    

   ResultSet result = pst1.executeQuery(sql);
   if(result.next()){
	   
   
    %>
   
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
    <td><%out.print(result.getString("staffID"));%></td>
    <td> <%out.print(result.getString("name"));%></td>
    <td><%out.print(result.getString("email"));%></td>
    <%} %>
    <td> ${emp.id}</td>
    <td>${emp.totalOT}</td>
    <td> ${emp.totalLeave}</td>
    <td>${emp.month}</td>
    <td>${emp.totalDaysWorked}</td>
    
  </tr>

    
    
<!--  <tr> -->
 
 
<!--  		<td>Employee ID</td> -->
<%-- 		<td> <%out.print(result.getString("staffID"));%></td> --%>
<!-- 		</tr> -->
<!--  <tr> -->
 
 
<!--  		<td>Name</td> -->
<%-- 		<td> <%out.print(result.getString("name"));%></td> --%>
<!-- 		</tr> -->
		
		
<!-- 		<tr> -->
		
<!-- 		<td>Email</td> -->
<%-- 		<td> <%out.print(result.getString("email"));%></td> --%>
<%-- 		<%} %> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		<td>Slip ID</td> -->
<%-- 		<td> ${emp.id}</td> --%>
		
<!-- </tr> -->

<!-- 	<tr> -->
<!-- 		<td>Total OT</td> -->
<%-- 		<td>${emp.totalOT}</td> --%>
<!-- 	</tr> -->
 
<!-- 	<tr> -->
<!-- 		<td>Total Leave</td> -->
<%-- 		<td> ${emp.totalLeave}</td> --%>
<!-- 	</tr> -->

<!-- 	<tr> -->
<!-- 		<td>Month</td> -->
<%-- 		<td>${emp.month}</td> --%>
<!-- 	</tr> -->
 
<!--  	<tr> -->
<!--  		<td>Total Days Worked</td> -->
<%--  		<td>${emp.totalDaysWorked}</td> --%>
<!--  	</tr> -->
 
 </c:forEach>
 </table>
 
 <c:url value = "updateslip.jsp" var = "empupdate">
 <c:param name="id" value ="${id}"/>
 <c:param name="totalOT" value="${totalOT}"/>
 <c:param name="totalLeave" value ="${totalLeave}"/>
 <c:param name="month" value ="${month}"/>
 <c:param name="totalDaysWorked" value ="${totalDaysWorked}"/>
 </c:url>
 
 <a href="${empupdate}">
 <input type ="button" name="update" value="Update My data">
 </a>
 
 <br>
 <c:url value = "deleteslip.jsp" var = "empdelete">
 	<c:param name="id" value ="${id}"/>
 <c:param name="totalOT" value="${totalOT}"/>
 <c:param name="totalLeave" value ="${totalLeave}"/>
 <c:param name="month" value ="${month}"/>
 <c:param name="totalDaysWorked" value ="${totalDaysWorked}"/>
 </c:url>
 <a href ="${empdelete}">
 <input type = "button" name = "delete" value = "Delete My Account">
 </a>
 
 
 
</body>
</html>