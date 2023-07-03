<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%Connection conn;

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select monthname(date),sum(FinalSalary) from salary group by month(date)";
Statement pst1 = conn.createStatement();
	

	

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

.content-table{
	border-collapse: collapse;
	margin:auto;
	color:white;
	margin-top:20px;
	font-size: 1.1em;
	min-width:900px;
	border-radius: 5px;
	overflow:hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.15);
}

.content-table-search{
	border-collapse: collapse;
	margin:auto;
	font-size: 1.1em;
	min-width:900px;
	border-radius: 5px;
	overflow:hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.15);
}

.content-table thead tr{
	background-color: #00008B;
	color:white;
	text-align: center;
	font-weight: bold;
}

.content-table th,
.content-table td{
	padding:12px 15px;
	text-align: center;
}

.content-table tbody tr{
	border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even){
	background-color: rgba(0, 0, 0, 0.8);
}

.content-table tbody tr:nth-of-type(odd){
	background-color: rgba(0, 0, 139, 0.7);
}

.content-table tbody tr:last-of-type {
	border-bottom: 2px solid #00008B;
}

.a{
	text-decoration:none;
	color: #ffffff;
}

.button{
  display: inline-block;
  font-weight: 400;
  color: #212529;
  text-align: center;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-color: transparent;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.button-add {
  color: #fff;
  background-color: #009879;
  border-color: transparent;
}

.btn-act-pos{
	position: absolute;
	left: 360px;
}

.add{
	margin-left:25%;

}

.add-search{
	margin-left:25%;
	margin-top:10px;
	margin-bottom:10px;
	
}

.add-vwAll{
	margin-left:33%;
	margin-top:10px;
	margin-bottom:10px;
}

.add-postion{
	margin-top:150px;
	margin-bottom:10px;
}

.add-postion1{
	margin-top:100px;
	margin-bottom:10px;
}

@media print{
	button{
		display : none;
	}
}

.button-view {
  color: #fff;
  background-color: #009879;
  border-color: transparent;
}

.button-edit {
  color: #fff;
  background-color: #00D9A5;
  border-color: transparent;
}

.button-delete{
  color: #fff;
  background-color: #dc3545;
  border-color: transparent;
}

.search{
	height: 35px;
	margin-left:65%;
	border-radius: 5px;
}

.header-top{
  float: left;
  width:100%;
  padding: 0px;
  position: fixed;
  top: 80px;
  margin-left:20px;
  padding-top: 20px;
  color:black;
}

.head-a{
	color : white;
	padding-right:20px;
	padding-left: 20px;
	font-size: 15px;
	text-decoration: none;
	font-weight: bold;
}

.header a:hover{
  text-shadow: 0px 0px 10px #FFFFFF;
}


a {
  text-decoration: none;
  background-color: transparent;
}

a:hover {
  color: #0056b3;
  text-decoration: none;
}

a:not([href]) {
  color: inherit;
  text-decoration: none;
}

a:not([href]):hover {
  color: inherit;
  text-decoration: none;
}
	
</style>
<meta charset="ISO-8859-1">
<title>Report</title>
  
 
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
     
	
</head>
<body style="background-color:#2980b9;">
   <header>
        <nav class="navbar navbar-expand-md navbar-dark text-center"
            style="background-color: #0b0d0c; text-align:center;">
     			<h1 class="text-center wow fadeInUp" style="color:white;">Report</h1>
        </nav>
    </header>
<div class="add-postion1">
	<button class="button  button-add add-search"  onclick="genPDF()">Generate Report PDF</button>
	<button class="button  button-add add-vwAll" onclick="window.print()">Print Report</button>
	</div>



<form >
<table class="content-table" id="content">
<thead>
	<tr>
		<th>Month</th>
		<th>Total Salary</th>
		
	</tr>
</thead>
<tbody>
		<%
			while (result.next()){
				%>
				
				<tr>
				
				 <td><%out.print(result.getString("monthname(date)")); %>  </td>
				  <td><%out.print(result.getString("sum(FinalSalary)")); %>  </td> 
					
				</tr>
				
				
				<%
			}
		
		%>	
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