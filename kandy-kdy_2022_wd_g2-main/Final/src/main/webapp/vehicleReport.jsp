<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>

<%Connection conn;

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select u.userID ,u.firstName, u.lastName , avg(v.fuelLimit) from vehicle v , user u  where v.userID = u.userID group by u.userID";
Statement pst1 = conn.createStatement();
	

	

	ResultSet result = pst1.executeQuery(sql); 
	%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
  
 
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
     
	<style>
     	<%@ include file="assetsVehicle/CSS/dashboard.css"%>
	</style>
</head>
<body style="background-color:#2980b9;">
   <header>
        <nav class="navbar navbar-expand-md navbar-dark text-center"
            style="background-color: #00008B; text-align:center;">
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
		<th>User ID</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Monthly Average Fuel Consumption (in liters)</th>
		
	</tr>
</thead>
<tbody>
		<%
			while (result.next()){
				%>
				
				<tr>
				
				 <td><%out.print(result.getString("u.userID")); %>  </td>
				  <td><%out.print(result.getString("u.firstName")); %>  </td>
				  <td><%out.print(result.getString("u.lastName")); %>  </td>
				  <td><%out.print(result.getString("avg(v.fuelLimit)")); %>  </td>  
					
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
			  filename:     'Monthly Vehicle Report.pdf',
			  jsPDF:        { unit: 'in', format: 'A4', orientation: 'landscape' }
			};

			// New Promise-based usage:
			html2pdf().set(opt).from(element).save();
}


</script>
</html>