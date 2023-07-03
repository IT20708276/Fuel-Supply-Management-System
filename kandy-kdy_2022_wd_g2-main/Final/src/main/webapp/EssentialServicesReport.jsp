<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="essentialservicesCSS/report.css">
<style>
     <%@ include file="essentialservicesCSS/report.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body style="background-color:#2980b9;">
   

    
    
<div class="rBox">

<h1>Monthly Company Fuel Usage Report</h1>
<!-- Report Table -->
<table class="list" id="content">
<tr>
	<th class="not-gen-rep-header">Fuel Limit</th>
	<th class="not-gen-rep-header">Fuel count</th>

</tr>

<c:forEach var="repcom" items="${repCompany}">

	


<tr>
		<td>${repcom.numFCount}</td>
		<td >${repcom.limit}</td>
		
</tr>
</c:forEach>
</table>


<div class="add-postion1">

	<form action="comreport" method="post">
	<button class="button-9">Generate Report</button>
    <button class="button-9" onclick="window.print()">Print Report</button>
	</form>
	<button class="button-9"  onclick="genPDF()">Generate Report PDF</button>
    
 </div>

</div>


</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script type="text/javascript">
    
    
function genPDF(){
    const element = document.getElementById('content');
    var opt = {
              filename:     'Monthly Essential Service Report.pdf',
              jsPDF:        { unit: 'in', format: 'A4', orientation: 'landscape' }
            };



           // New Promise-based usage:
            html2pdf().set(opt).from(element).save();
}




</script>
</html>