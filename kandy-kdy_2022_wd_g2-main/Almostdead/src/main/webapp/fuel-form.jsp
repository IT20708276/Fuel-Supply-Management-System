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
					<label>Fuel Type</label> <input type="text"
						value="<c:out value='${user.fueltype}' />" class="form-control"
						name="fueltype" required="required" placeholder="Petrol/92 ,Petrol/95 ,Diesel/92 , Diesel/95">
				</fieldset>

				<fieldset class="form-group">
					<label>Current Stock</label> <input type="number"
						value="<c:out value='${user.cstock}' />" class="form-control"
						name="cstock" placeholder="Enter the Liters">
				</fieldset>

				<fieldset class="form-group">
					<label>Refilled Amount</label> <input type="number"
						value="<c:out value='${user.refamount}' />" class="form-control"
						name="refamount" placeholder="Enter the Liters">
				</fieldset>

				<button type="submit" class="btn btn-success" onclick="alert('Fuel Details Successfully saved')">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>