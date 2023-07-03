<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.payment.PayDetails2"%>
<%@page import="com.payment.PaymentDBUtil"%>
<%@page import="com.payment.DBConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>

<%@page import="com.payment.PayInterfaceDetails"%>
<%@page import="com.payment.PaymentDBUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> Payment Administration Page </title>
		<link rel="stylesheet" href="Assets/CSS/payment.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="AssetsPayment/JS/payment.js"></script>
		
		
		<style>
		     <%@ include file="AssetsPayment/CSS/payment.css"%>
		     body{
		  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
		  background-repeat: no-repeat;
		  background-size: 1800px 900px;
		  font-family: sans-serif;
		  margin: 0px;
		  padding: 0px;}
		</style>
		
		<script>
			<%@ include file="AssetsPayment/JS/payment.js"%>
		</script>
		
	</head>
	<body>
	<%Connection con;

			Class.forName("com.mysql.jdbc.Driver");
			con = DBConnect.getConnection();
			String sql = "select pid, amount, date, vehicleID from payment";
			Statement pst1 = con.createStatement();
   			ResultSet result = pst1.executeQuery(sql); 
   		 %> 
		
		<div class="heading">
			<h1> Welcome to Payment Management</h1>
		</div>
		
		<br><br><br>
		<div class="admin0">
			<div class="admin1">
				<form action="showpay" method="post">
					<h2> View Payment by Id </h2><input type="number" name="payId"><br><br>
					<input type="submit" name="submit" value="View">
				</form>
			</div>
		</div>
		
		<br><br><br>
		
		<table class="styled-table3">
		<c:forEach var="det" items="${retreve}">
		
			<c:set var="pid" value="${det.pid }" />
			<c:set var="amount" value="${det.amount}" />
			<c:set var="datetime" value="${det.datetime}" />
			<c:set var="vehicleNo" value="${det.vehicleNo}" />
			
			<tr class="active-row">
				<td> PID </td>
				<td>${det.pid }</td>
			</tr>
			<tr class="active-row">
				<td> Amount </td>
				<td>${det.amount }</td>
			</tr>
			<tr class="active-row">
				<td>Date and Time</td>
				<td>${det.datetime }</td>
			</tr>
			<tr class="active-row">
				<td> Vehicle Number </td>
				<td>${det.vehicleNo }</td>
			</tr>
		</c:forEach>
		</table>
		
		<div class="admin12">
			<c:url value="updatepayment.jsp" var="payupdate">
				<c:param name="pid" value="${pid}" />
				<c:param name="amount" value="${amount}" />
				<c:param name="datetime" value="${datetime}" />
				<c:param name="vehicleNo" value="${vehicleNo}" />
			</c:url>
			<div class="update">
				<a href="${payupdate}">
					<input type="button" name="Update" value="Update Payment Transection">
				</a>
			</div>
			<br>
			
			<c:url value="deletePayment.jsp" var="paydelete">
				<c:param name="pid" value="${pid}" />
				<c:param name="amount" value="${amount}" />
				<c:param name="datetime" value="${datetime}" />
				<c:param name="vehicleNo" value="${vehicleNo}" />
			</c:url>
			<div class="delete">
				<a href="${paydelete }">
				<input type="button" name="delete" value="Delete Payment Transection">
				</a>
			</div>
		</div>
		
		<div style="border: 1px ;border-radius: 6px; height: 45px; float: left; margin: 0 0 30px 0; width: 100%;">
			<form  action="PaymentReport.jsp"  method ="post">
				<input type="Submit" name="submit" value="Generate Report" style="width:400px; height:45px;
  					display:block;	font-size:25px; font-weight:bold; color:#fff; text-decoration:none; text-transform:uppercase;
  					text-align:center; text-shadow:1px 1px 0px #37a69b; padding-top:6px; margin: auto;position:relative;
  					cursor:pointer;border: none;  background-color: #00008B ;background-image: linear-gradient(top,#3db0a6,#3111);border-top-left-radius: 5px;
  					border-top-right-radius: 5px;border-bottom-right-radius: 5px; border-bottom-left-radius:5px; box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px 5px #999;"/>
			</form>
		</div>
		
		<table class="styled-table3">
			<tr class="active-row">
	          <th>PID</th>
	          <th>Amount</th>
	          <th>Date</th>
	          <th>Vehicle Number</th>
	      </tr>
		  <%  while (result.next()){  %>
			<tr class="active-row">
				<td> <%out.print(result.getString("pid")); %> </td>
				<td> <%out.print(result.getString("amount")); %> </td>
				<td> <%out.print(result.getString("date")); %> </td>
				<td> <%out.print(result.getString("vehicleID")); %></td>
			</tr>			
			<%	} %>     
		</table>
	</body>
</html>