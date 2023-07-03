<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		String id = request.getParameter("id");
		String totalOt = request.getParameter("totalOT");
		String totalLeave = request.getParameter("totalLeave");
		String month = request.getParameter("month");
		String totalDaysWorked = request.getParameter("totalDaysWorked");
	
	%>
	
	<h1>Attendance Slip Delete</h1>
	
	 <form action = "delete" method = "post">
	Attendance ID <input type = "text" name = "slipid" value = "<%= id%>" readonly><br>
	Total OT <input type = "text" name = "tot" value = "<%= totalOt%>"><br>
Total Leave Taken <input type = "text" name = "tlt" value = "<%= totalLeave%>"><br>
Month <input type = "text" name = "month" value = "<%= month%>"><br>
Total Days Worked <input type = "text" name = "tdw" value = "<%= totalDaysWorked%>"><br>
	 
	  <input type="submit" name = "submit" value = "Delete My Slip"><br>
	  </form>
</body>
</html>