<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Receipt download </title>
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
		
		
		<br><br><br>
		
		<div class="pay5">
			<h1>Payment Receipt</h1>
			<form  action="views"  method ="post">
			<input type="Submit" name="btn1" value="Create Receipt"/>
			</form>
		</div>
		<br><br><br>
		
		<table class="styled-table2" id="invoice">
		<c:forEach var="detail" items="${paymentDet}">
			<tr class="active-row">
				<td> Name </td>
				<td>${detail.name }</td>
			</tr>
			<tr class="active-row">
				<td> Vehicle Number </td>
				<td>${detail.vehicleNo }</td>
			</tr>
			<tr class="active-row">
				<td> Date and Time</td>
				<td>${detail.datetime }</td>
			</tr>
			<tr class="active-row">
				<td> NIC </td>
				<td>${detail.nic }</td>
			</tr>
			<tr class="active-row">
				<td> Email </td>
				<td>${detail.email }</td>
			</tr>
			<tr class="active-row">
				<td> Fuel </td>
				<td>${detail.fuel } Liters</td>
			</tr>
			<tr class="active-row">
				<td> Payment Amount </td>
				<td>${detail.amount }</td>
			</tr>
		</c:forEach>
		</table>
		<br><br><br>
		<button style=" width:400px; height:45px; display:block;font-size:25px;font-weight:bold; color:#fff; text-decoration:none; text-transform:uppercase;text-align:center;
  			text-shadow:1px 1px 0px #00008B;padding-top:6px; margin: 0 0 0 600px; position:relative;
  			cursor:pointer; border: none; background-color: #00008B; background-image: linear-gradient(top,#3db0a6,#3111); border-top-left-radius: 5px;
  			border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius:5px; box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px 5px #999;" role="button" onclick="generatePDF()">Download Receipt</button>
			
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>	
		<script type="text/javascript">
			
		function generatePDF(){
			
			
			const element = document.getElementById('invoice');
			
			var opt = {
					filename: 'PaymentRecipt.pdf',
					jsPDF: {unit: 'in', format: 'A4', orientation: 'landscape' }
			};

			html2pdf().set(opt).from(element).save();
			
		}
		</script>
	
	
	</body>
</html>