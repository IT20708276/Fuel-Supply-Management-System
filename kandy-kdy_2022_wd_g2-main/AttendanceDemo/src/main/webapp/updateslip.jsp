<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/slip.css">
</head>
<body>

	<%
		String id = request.getParameter("id");
		String totalOT = request.getParameter("totalOT");
		String totalLeave = request.getParameter("totalLeave");
		String month = request.getParameter("month");
		String totalDaysWorked = request.getParameter("totalDaysWorked");
	
	%>

<!-- <form action = "update" method = "post"> -->
	
	
<%-- 	Attendance ID <input type = "text" name = "slipid" value = "<%= id%>" readonly><br> --%>
<%-- 	Total OT <input type = "text" name = "totalot" value = "<%= totalOT%>"><br> --%>
<%-- Total Leave Taken <input type = "text" name = "totalleave" value = "<%= totalLeave%>"><br> --%>
<%-- Month <input type = "text" name = "month" value = "<%= month%>"><br> --%>
<%-- Total Days Worked <input type = "text" name = "totaldaysworked" value = "<%= totalDaysWorked%>"><br> --%>
	 
	 
	 <div class="container">
    <div class="title">Update Slip</div>
    <div class="content">
      <form action="update" method = "post">
        <div class="user-details">
        <div class="input-box">
            <span class="details">Attendance Slip ID</span>
             <input type = "text" name = "slipid" value = "<%= id%>" readonly>
          </div>
          <div class="input-box">
            <span class="details">Total Over Time</span>
            <input type = "text" name = "totalot" value = "<%= totalOT%>">
          </div>
          <div class="input-box">
            <span class="details">Total Leave Taken</span>
            <input type = "text" name = "totalleave" value = "<%= totalLeave%>">
          </div>
          <div class="input-box">
            <span class="details">Month</span>
          <input type = "text" name = "month" value = "<%= month%>">
          </div>
          <div class="input-box">
            <span class="details">Total Days Worked</span>
            <input type = "text" name = "totaldaysworked" value = "<%= totalDaysWorked%>">
          </div>
         
        </div>
        
        <div class="button">
          <input type="submit" name="submit" value="Update Attendance Slip">
        </div>
      </form>
    </div>
  </div>
	
	

</body>
</html>