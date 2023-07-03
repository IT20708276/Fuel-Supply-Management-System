<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Fuel Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<style>
     <%@ include file="assetSalary/css/mystyles.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #1e90ff ">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Fuel Supply Management </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Fuel Details</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit Fuel
            		</c:if>
						<c:if test="${user == null}">
            			Add/Refill Fuel 
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="gid" value="<c:out value='${user.gid}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Fuel Type</label> 
					<select name="fueltype" class="form-control" > 
						<option value="Petrol/92">Petrol 92 </option>
						<option value="Petrol/95" >Petrol 95</option>
						<option value="Super Diesel">Super Diesel</option>
						<option value="Auto Diesel"> Auto Diesel</option>
					
					</select>
				</fieldset>





				<fieldset class="form-group">
					<label>Current Stock</label> <input type="number" id="cs"
						value="<c:out value='${user.cstock}' />" class="form-control"
						name="cstock" required="required" placeholder="Enter the Liters < 100,000 L">
				</fieldset>

				<fieldset class="form-group">
					<label>Refilled Amount</label> <input type="number" id="ref"
						value="<c:out value='${user.refamount}' />" class="form-control"
						name="refamount"  required="required" placeholder="Enter the Liters < 100,000 L">
				</fieldset>

				<button type="submit" class="btn btn-success" onclick="return check()">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>



<script>     


	
	
	function check(){

		var cs=document.getElementById("cs").value;
		var ref=document.getElementById("ref").value;
		
		
		if (cs>100000){
			alert('check current stock value again');
			return false;
		
		}
		else if (ref>100000){
			alert('check refilled amount value again');
			return false;
		}
		
		
		
	}
	



</script>
</html>