<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@page import="java.io.PrintWriter , java.sql.*"%>
	
	<%Connection conn;
ResultSet result=null;
String sid = (String)session.getAttribute("StaffID");
System.out.println(sid);
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
String sql = "select * from staff where StaffID = '"+sid+"'";
Statement pst1 = conn.createStatement();
  
String sq2 = "select * from attendance where StaffID = '"+sid+"'";
Statement pst2 = conn.createStatement();
ResultSet result1=null;

session.setAttribute("StaffID",sid );



	result1 = pst2.executeQuery(sq2);
	
	String tot = "";
	if(result1.next()){
		tot=result1.getString("totalOT");
	}
        



   result = pst1.executeQuery(sql);
   
   String bs = "";
   if(result.next()){
	   bs = result.getString("BasicSalary");
   }



   
    %>    
	
   
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet" href="assets/css/mystyles.css">

	<script defer src = "assets/js/script.js"></script>
	
	<style>
     <%@ include file="assetSalary/css/mystyles.css"%>
     <%@ include file="myCSS\staff.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
  .formdiv input[type=submit]:hover, input[type=reset]:hover
{
  background-color: #00007b;
}
.formdiv input[type=submit], input[type=reset]
{
  height: 40px;
  width : 180px;
  margin: 20px 150px 0px;
  border-radius: 20px;
  border: none;
  background-color: #284f9c;
  color: #FFFFFF;
  transition-duration: 300ms;
  font-size: 16px;
  cursor: pointer;
}
</style>
<script>
	<%@ include file="assetSalary/js/sc.js"%>
</script>
</head>
<body>
<!-- 
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: green">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> SALARY </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header> -->
	<br>
	
			
	
		`<div class= "formdiv" id="error">
	
				<c:if test="${user != null}">
					<form id = "form" action="updateSalary" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form id = "form" action="insertSalary" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			SALARY DETAILS
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Date</label> <input type="date"
						value="<c:out value='${user.date}' />" class="form-control"
						name="date" required = "required">
				</fieldset>

				<fieldset class="form-group">
					<label>Basic Salary</label> <input type="text" id="bs"
						value="<%out.print(bs);%>" class="form-control"
						 required="required" readonly>
				</fieldset>	

				<fieldset class="form-group">
					<label>Deducted Amount</label> <input type="text" id="da"
						 class="form-control"
						name="amount" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Total OT</label> <input type="text" id="ot"
						value="<%out.print(tot);%>" class="form-control"
						 required="required" readonly>
				</fieldset>	

				<fieldset class="form-group">
					<label>Reason</label> <input type="text"
						value="<c:out value='${user.reason}' />" class="form-control"
						name="reason" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Final Salary</label> 
					<input type="text" class="form-control" name="final" required="required" readonly id="cal">
					
				</fieldset>
				<input type ="submit"  value= "Calculate" onclick="return finalamount()">
				<input type="submit" class="btn btn-success" value="save">
				</form>
				</div>
			
		
	
</body>
<script>
    
    function finalamount(){
        var bs = document.getElementById('bs').value;
        var da = document.getElementById('da').value;
        var ot = document.getElementById('ot').value;
        var fa = 50;
        
        if((da < 0 )||( da > bs)){
            alert("DEDUCTION AMOUNT IS NOT VALID");
            return false;
        }else{



           var fs = (bs-da) + (ot*fa);
            
            document.getElementById('cal').value = fs;
        }
   
   }
    
</script>

</html>















