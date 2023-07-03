<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <!-- including JSTL Core libraries to use tags  -->
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <!-- import pages to generate the chart -->
     <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.util.Arrays"%>
	<%@page import="java.util.ArrayList"%>
	
	
<%

String count[]= new String[100];
String num[]= new String[100];

int x = 0;
int n=0 ;
String driver = "com.mysql.jdbc.Driver";
String url= "jdbc:mysql://localhost:3306/fuelstaff";
String user="root";
String psswd="Vithya24";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notice Reports</title>

<%
try{
	Connection con =DriverManager.getConnection(url, user, psswd);
	Statement stmt=con.createStatement();
	String sql = "select COUNT(notice_type) from notice group by notice_type";
	ResultSet rs=stmt.executeQuery(sql);

	
	
while(rs.next()){

count[x] = rs.getString("COUNT(notice_type)");
//System.out.println(count[x]);
x=x+1;


}
} catch (Exception e) {
e.printStackTrace();
}



try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

x=0;
try{
	Connection con1 =DriverManager.getConnection(url, user, psswd);
	Statement stmt=con1.createStatement();
	String sql1 = "select notice_type from notice group by notice_type";
	ResultSet res=stmt.executeQuery(sql1);

	
	
while(res.next()){

  num[x] = res.getString(1);
 System.out.println("Number x"+num[x]);
x = x+1;



}
con1.close();
} catch (Exception e) {
e.printStackTrace();
}


x=0;
%>
<!-- CSS link -->
 <link href="noticecss/noticereportsstyles.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  
<style>
     <%@ include file="noticecss/noticereportsstyles.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 1600px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
   #reportbtn
{
	background-color: rgba(0,0,0,0.5);
	color: #FFFFFF;
	border: solid 2px #FFFFFF;
	width:15%;
	padding:15px;
	font-size:20px;
	transition-duration: 200ms;
	font-weight: bold;
}

#reportbtn:hover
{
	background-color: #3CB371;
	color: #FFFFFF;
	border: solid 2px #3CB371;
}
</style>
</head>
<body>

<%
 
		
%>  

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	 
        var data = google.visualization.arrayToDataTable([
          ['Notice Type', 'Number of Notices'],
        
        	  ['<%= num[0]%>.Normal Notices',     <%=count[0]%>],
        	  ['<%= num[1]%>.Priority Notices',     <%=count[1]%>],
          
        
     
        ]);

        var options = {
          title: 'Number of Priority and Normal Notices'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    
let temp = <%= num[0] %>; 
let temp1 = <%= num[1] %>; 

//alert(temp);
//alert(temp1);
//alert(temp2);
</script>
  <!-- middle banner -->
<div class = "homediv">

</div>
  
<!-- Back Button -->
<a href="search.jsp"><button class="not-rep-backbtn"><i class="fa fa-times" aria-hidden="true"></i></button></a>


<!-- page header -->
<div class="not-insert-header">
<h1>Report</h1>
<hr>
</div>
<!-- Notice Report Page Description -->
<h3 class="report-desc">Notices generated for each month along with its respective year is represented below</h3>

<!-- Report Table to store the number of notices posted within a month -->
<table>
<tr>
	<th class="not-gen-rep-header">Number Of Notices</th>
	<th class="not-gen-rep-header">Month</th>
	<th class="not-gen-rep-header">Year</th>
</tr>

<c:forEach var="repnot" items="${repnotice}">

	<c:set var="notcount" value="${repnot.num_notices}"/>
	<c:set var="notmonth" value="${repnot.month}"/>
	<c:set var="notyear" value="${repnot.year}"/>
	


<tr>
		<td class="rep-table-data">${repnot.num_notices}</td>
		<td class="rep-table-data">${repnot.month}</td>
		<td class="rep-table-data">${repnot.year}</td>
</tr>
</c:forEach>
</table>
<!-- Report Table to store the number of priority and Normal Notices-->
<table>


<c:forEach var="repnot2" items="${repnotice2}">

<tr>
		<td class="rep-table-data">${repnot2}</td>
		
</tr>
</c:forEach>
</table>

<button id = "reportbtn" onclick="window.print()" style="margin-left:1200px;">Print</button>

<div id="piechart" style="width: 900px; height: 500px;"></div>
<br>
<br>

</body>
</html>