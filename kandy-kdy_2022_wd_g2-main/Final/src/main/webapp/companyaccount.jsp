<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
     <%@ include file="essentialservicesCSS/mystyles.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 1500px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>

</head>
<body>
    
<form action="prioritypage.jsp">
    <div class="btnclass2">
        <button type="submit" name="submit" class="userbtn2" value="NoticeBoard">View Notices</button>
    </div>
</form>
<div class="list" >

<h1 class="accTitle">Company Details</h1>

	<table>
		<c:forEach var="ess" items="${essDetails}">
		<c:set var="cid" value="${ess.cid}"/>
		<c:set var="cname" value="${ess.cname}"/>
		<c:set var="fname" value="${ess.fname}"/>
		<c:set var="lname" value="${ess.lname}"/>
		<c:set var="sType" value="${ess.sType}"/>
		<c:set var="reason" value="${ess.reason}"/>
		<c:set var="address" value="${ess.address}"/>
		<c:set var="email" value="${ess.email}"/>
		<c:set var="fLimit" value="${ess.fLimit}"/>
		<c:set var="letter" value="${ess.letter}"/>
		<c:set var="password" value="${ess.password}"/>
		
	
		
		<tr>
			<td>Company ID</td>
			<td>${ess.cid}</td>
		</tr>
		<tr>
			<td>Company Name</td>
			<td>${ess.cname}</td>
		</tr>
		<tr>
			<td>First Name</td>
			<td>${ess.fname}</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>${ess.lname}</td>
		</tr>
		<tr>
			<td>Service Type</td>
			<td>${ess.sType}</td>
		</tr>
		<tr>
			<td>Reason</td>
			<td>${ess.reason}}</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>${ess.address}</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>${ess.email}</td>
		</tr>
		<tr>
			<td>Limit</td>
			<td>${ess.fLimit}</td>
		</tr>
		<tr>
			<td>Letter</td>
			<td>${ess.letter}</td>
		</tr>
		<tr>
			<td>Password</td>
			<td>${ess.password}</td>
		</tr>
	
		</c:forEach>
	</table>
		
		<c:url value="updatecompany.jsp" var="comupdate">
		<c:param name="cid" value="${cid}"/>
		<c:param name="cname" value="${cname}"/>
		<c:param name="fname" value="${fname}"/>
		<c:param name="lname" value="${lname}"/>
		<c:param name="sType" value="${sType}"/>
		<c:param name="reason" value="${reason}"/>
		<c:param name="address" value="${address}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="fLimit" value="${fLimit}"/>
		<c:param name="letter" value="${letter}"/>
		<c:param name="password" value="${password}"/>
	</c:url>
	<div class="center">
	<a href="${comupdate}">
	<button class="button-9" role="button"  type="button" name="update" >Update Company Data</button>
	</a>
	
	
	<br>
	
	<c:url value="deletecompany.jsp" var="comdelete">
		<c:param name="cid" value="${cid}"/>
		<c:param name="cname" value="${cname}"/>
		<c:param name="fname" value="${fname}"/>
		<c:param name="lname" value="${lname}"/>
		<c:param name="sType" value="${sType}"/>
		<c:param name="reason" value="${reason}"/>
		<c:param name="address" value="${address}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="fLimit" value="${fLimit}"/>
		<c:param name="letter" value="${letter}"/>
		<c:param name="password" value="${password}"/>
	</c:url>
	<a href="${comdelete}">
	<button class="button-9" role="button"  type="button" name="delete" >Delete My Account</button>
	</a>
	</div>
</div>	

<div class ="qrcode" style = "color:white;">
	<h1>Your QR Code</h1>
		<div class="q1">
		<img src="https://chart.apis.google.com/chart?cht=qr&chs=250x250&chl=fuel">
		</div>
</div>
	
<script>
	
	function generateqr(){
		var cname = document.getElementById('cName').value;
		var mname = document.getElementById('mName').value;
		var flimit = document.getElementById('flimit').value;
		console.log('cName': + name);
		
		var url = "https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=fuel";
		var ifr = '<iframe src="${url}" height="200" width="200"></iframe>'	;
		document.getElementById('qrcode').innerHTML = ifr;
	
	}
</script>		
	
</body>
</html>