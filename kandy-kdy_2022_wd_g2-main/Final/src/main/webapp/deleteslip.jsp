<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Slip</title>
<link rel="stylesheet" href="AttendanceCSS/mystyles.css">

<style>
     <%@ include file="AttendanceCSS/mystyles.css"%>
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

<script type="text/javascript">
function alertDel(){
alert("Your job is done");
}
</script>


<%
 String stid = request.getParameter("id");
 
 %>
 
 <%Connection conn;



Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");

String sql1 = "select * from attendance where staffID = '"+stid+"'";
Statement ps = conn.createStatement();

  
   ResultSet result1 = ps.executeQuery(sql1);
   if(result1.next()){
	   
   
    %>
	  
   <div class="formdiv">
      <form action="DeleteSlipServlet" method = "post" onsubmit = "alertDel()">
        <h2> Delete Slip</h2>
        <table>
        <tr>
				<td> Attendance ID</td>
				<td><input type="text" name = "slipid" value = "<%out.print(result1.getString("attendanceID"));%>" readonly></td>
			</tr>
           <tr>
				<td>Total Over Time</td>
				<td><input type="text" name = "tot" value = "<%out.print(result1.getString("totalOT"));%>"></td>
			</tr>
         <tr>
				<td>Total Leave Taken</td>
				<td><input type="text" name = "tlt" value = "<%out.print(result1.getString("totalLeave"));%>"></td>
			</tr>
         
         <tr>
			<td>Month</td>
			 <td> <input type = "text" name = "month" value = "<%out.print(result1.getString("month"));%>"></td>
            </tr>
          <tr>
				<td>Total Days Worked</td>
				<td><input type="text" name = "tdw"  value = "<%out.print(result1.getString("totalDaysWorked"));%>"></td>
			</tr>
         
         <%} %>
        
        <tr>
<td colspan="2"><input type="submit" name="submit" value="Delete Slip"> </td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="cancel" value="Cancel"><a href = "indexAttendance.jsp"></a> </td>
</tr>
 </table>
      </form>
    </div>
	  
</body>
</html>