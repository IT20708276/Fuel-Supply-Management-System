<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>
<link rel="stylesheet" href="Assets/CSS/UserManagement.css">

</head>
<body>

	<div class="header">
	    <a href="#">Home</a>
	    <a href="#contactus">Contact Us</a>
	    <a href="#aboutus">About Us</a>
	     <c:forEach var="us" items="${usDet}">
   
    <c:set var="userid" value="${us.userID}"/>
    <c:set var="nic" value="${us.NIC}"/>
    <c:set var="fname" value="${us.firstName}"/>
    <c:set var="lname" value="${us.lastName}"/>
    <c:set var="pswd" value="${us.password}"/>
    <c:set var="otp" value="${us.OTP}"/>
    <c:set var="email" value="${us.email}"/>
    <c:set var="address" value="${us.address}"/>
    
    </c:forEach>
    <c:url value="Profile.jsp" var="profile">
    	<c:param name="nic" value="${nic}"/>
    	<c:param name="pswd" value="${pswd}"/>
    	<c:param name="fname" value="${fname}"/>
    	<c:param name="lname" value="${lname}"/>
    	<c:param name="address" value="${address}"/>
    </c:url>
    <a href="${profile}">
    	<input type="button" name="profile" value="Profile">
    </a>
    <c:url value="DeleteUser.jsp" var="userdelete">
    
    	<c:param name="nic" value="${nic}"/>
    	<c:param name="pswd" value="${pswd}"/>
    	<c:param name="fname" value="${fname}"/>
    	<c:param name="lname" value="${lname}"/>
    	<c:param name="address" value="${address}"/>
    
    </c:url>
    <a href="${userdelete}">
    	<input type="button" name="delete" value="Delete Profile">
    </a>
	</div>
  	
  	 <div class="btnclass">
      <a class="userbtn" href="#">All Notices</a>
      <a class="userbtn" href="#">Register Vehicle</a>
    </div>
    
    
    
   
  <div class="noticebox">
  	<p>Hello world</p>
  </div>
  <div class="searchbar">
	  <input type="text" placeholder="Search..">
	</div>
  
    <div class="mapbox">
  
  	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1979.3232434248032!2d80.5704957!3d7.166802!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae371d8c769256f%3A0xbcd997529268faef!2sIOC%20Lanka%20Fuel%20Filling%20Station!5e0!3m2!1sen!2slk!4v1663747091369!5m2!1sen!2slk" width="1000" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>

  
  
</body>
</html>