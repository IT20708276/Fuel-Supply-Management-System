<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <!-- including JSTL Core libraries to use tags  -->
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update This Notice</title>
 <link href="noticecss/noticeupdatestyles.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- header menu bar -->
<div class="header">
    	<a href="Home.jsp">Home</a>
    	<a href="#contactus">Contact Us</a>
    	<a href="#aboutus">About Us</a>
  	</div>

<!-- middle banner -->
<div class = "homediv">

</div>
<%

	String id = request.getParameter("noticeid");
	String notice_title = request.getParameter("noticetitle");
	String notice_type = request.getParameter("noticetype");
	String notice_date = request.getParameter("noticedate");
	String notice_desc = request.getParameter("noticedesc");
	String notice_email = request.getParameter("noticeemail");
%>

<a href="search.jsp"><button class="update-backbtn"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></a>

<div class="not-insert-header">
<h1>Update this Notice</h1>
</div>
	<form action="update" method="post" id="notice-insert-form">
		<div style="margin-left:350px;">
				<h4><%= notice_type%></h4>
		</div>

		<label class="not-ins-label">Notice No</label> <br>
		 <input type="text" name="noticeId" class="not-inst-inputid" value="<%= id%>" readonly><br>
		 
		 
		<label class="not-ins-label">Notice Title</label> <br>
		 <input type="text" name="noticeTitle" class="not-inst-input" value="<%= notice_title%>"><br>
		 
		<label class="not-ins-label">Notice Type</label> <br>
		 <select class="inst-not-select" name="ntype">
			<option value="1" class="inst-not-options">1.Priority Notice</option>
			<option value="2" class="inst-not-options">2.Normal Notice</option>
			</select><br>
			
			<label class="not-ins-label">Notice Date</label> <br>
		 <input type="text" name="noticeDate" class="not-inst-inputid" value="<%= notice_date%>" readonly><br>
		
		<div class="inst-notice-desc">
	<label class="not-ins-label-right">Notice Description</label> <br>
		<textarea name="ndesc" rows="4" cols="50" class="not-ins-textarea" ><%= notice_desc%></textarea>
		<br>
		</div>
		
		
		<label class="not-ins-label">Email</label> <br>
		<input type="text" name="email" value="<%= notice_email%>" class="not-inst-input"><br>
		
		<div class="updatebuttons">
		<button type="submit" class="not-inst-update" value="Update Notice" name="updatebtn">Update Notice</button>
		<button type="submit" class="not-inst-delete" value="Delete This Notice" name="deletebtn"><i class="fa fa-trash" aria-hidden="true"></i></button>
		</div>
	</form>
	
</body>
</html>