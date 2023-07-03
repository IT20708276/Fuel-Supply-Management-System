<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
    <%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%Connection conn;





   Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?","root","0779825509");
    String id = request.getParameter("id");
    session.setAttribute("id",id);
    PreparedStatement pst1 = conn.prepareStatement("select * from slip where id = ?");
    pst1.setString(1, id);
   ResultSet result = pst1.executeQuery();
   
   
    String Id="";
    String totalOT ="";
    String totalLeave ="";
    String month ="";
    String totalDaysWorked ="";
   
    
                if(result.next()){
                 Id = result.getString("id");
                 totalOT = result.getString("totalOT");
                 totalLeave= result.getString("totalLeave");
                 month= result.getString("month");
                 totalDaysWorked = result.getString("totalDaysWorked");
                 
            }
    %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


 
 
 <form action ="#" method = "post">
Attendance ID <input type = "text" name = "id" value="<% out.println(Id);%>"readonly><br>
Total OT <input type = "text" name = "totalOT" value="<% out.println(totalOT);%>"readonly><br>
Total Leave Taken <input type = "text" name = "totalLeave"value="<% out.println(totalLeave); %>"readonly><br>
Month <input type = "text" name = "month"value="<% out.println(month); %>"readonly><br>
Total Days Worked <input type = "text" name = "tdw"value="<% out.println(totalDaysWorked); %>"readonly><br>


 
 <a href="useraccount.jsp">
 <input type ="button" name="update" value="Update My data">
 </a>
</form> 
</body>
</html>