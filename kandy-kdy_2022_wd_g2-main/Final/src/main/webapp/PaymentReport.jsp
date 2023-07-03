<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<%@page import="com.payment.PaymentDBUtil"%>
<%@page import="com.payment.DBConnect"%>
<!DOCTYPE html>

<%Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DBConnect.getConnection();
	String sql = "select day(date) , sum(amount) from payment group by day(date)";
	Statement pst1 = con.createStatement();
 	ResultSet result = pst1.executeQuery(sql); 
%> 
<html>
	<head>
		<style>
		
		@charset "ISO-8859-1";
		
		body{
		  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
		  background-repeat: no-repeat;
		  background-size: 1800px 900px;
		  font-family: sans-serif;
		  margin: 0px;
		  padding: 0px;}
		
		.styled-table3{
			border-collapse: collapse;
		    margin: auto;
			border-radius: 9px;
		    font-size: 0.9em;
		    font-family: sans-serif;
		    min-width: 700px;
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}
		.styled-table3 thead tr th{ 
				background: black;
				Background-color : rgba(0, 0, 0, 0.9) ;
				color: white;
				padding-left : 35px;
				padding: 12px 15px ;
				border : 2px solid #00008B;
			}
		.styled-table3  tr td:nth-child(even){ 
				background: #eceeee;
				color: black;
				padding-left : 35px;
				border : 2px solid #00008B;
			}
			
			
		.styled-table3  tr td:nth-child(odd){ 
				background: #00008B;
				color:#fff;
				padding-left : 35px;
		}
		.styled-table3  tr td:nth-child(even){ 
				Background-color : rgba(0, 0, 0, 0.8) ;
				color:#fff;
				padding-left : 35px;
		}
			
		.styled-table3 td {
		    padding: 12px 15px ;
		}
		.styled-table3 tbody tr {
		    border-bottom: 3px solid #dddddd;
		}
		.styled-table3 thead tr {
		    border-bottom: 3px solid #dddddd;
		}
		.styled-table3 tbody tr:last-of-type {
		    border-bottom: 4px solid #ffff1a;
		}
		.styled-table3 tbody tr.active-row {
		    font-weight: bold;
		    color: #00008B;
		}
		
		.styled-table3 thead tr.active-row {
		    font-weight: bold;
		    color: black;
		}
		
		.button{
		  display: inline-block;
		  font-weight: 400;
		  font-family:Arial, "Helvetica", sans-serif;
		  color: #fff;
		  background-color: #00008B;
		  border-color: transparent;
		  text-align: center;
		  vertical-align: middle;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  border: 1px solid transparent;
		  padding: 0.375rem 0.75rem;
		   text-transform:uppercase;
		  font-size: 1rem;
		  line-height: 1.5;
		  border-radius: 5px;
		  box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px 5px #999;
		  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}
		.add-search{
			margin: 10px 0 10px 450px;
		}
		.add-vwAll{
			margin: 10px 0 10px 310px;
		}
		.add-postion1{
			margin-top:20px;
			margin-bottom:10px;
		}
		.heading {
		  Background-color : rgba(0, 0, 0, 0.7) ;
		  border-radius: 30px;
		  height: 60px;
		  width: 99%;
		  margin: 0 30px 30px 5px;
		  float: left;
		  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}
		
		.heading h1 {
		  color : white ;
		  text-align : center;
		  padding-top: 10px;
		  font-size : 34px;
		}
		</style>
		<meta charset="ISO-8859-1">
		<title>Report</title>
	  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">
	</head>
<body>
	
		<div class="heading">
			<h1> PAYMENT REPORT</h1>
		</div>
	
	<div class="add-postion1">
		<button class="button add-search"  onclick="genPDF()">Generate Report PDF</button>
		<button class="button add-vwAll" onclick="window.print()">Print Report</button>
	</div>

	<form >
		<table class="styled-table3" id="content">
			<thead>
				<tr class="active-row">
					<th>Date</th>
					<th>Total Amount</th>
				</tr>
			</thead>
			<tbody>
			<% while (result.next()){ %>
					
					<tr class="active-row">
						<td><%out.print(result.getString("day(date)")); %>  </td>
						<td><%out.print(result.getString("sum(amount)")); %>  </td> 
					</tr>
					<% } %>	
			</tbody>	
		</table>
	</form>
</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script type="text/javascript">
	function genPDF(){
		const element = document.getElementById('content');
		var opt = {
				  filename:     'Monthly Salary Report.pdf',
				  jsPDF:        { unit: 'in', format: 'A4', orientation: 'landscape' }
				};
				// New Promise-based usage:
				html2pdf().set(opt).from(element).save();
	}
</script>
</html>