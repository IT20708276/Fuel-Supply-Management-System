<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="insert" method="post">
		Company ID <input type="text" name="Cid"><br>
		Company Name <input type="text" name="Cname"><br>
		Manager First Name <input type="text" name="fName"><br>
		Manager Last Name <input type="text" name="lName"><br>
		Service Type <input type="text" name="type"><br>
		Reason <input type="text" name="reason"><br>
		Address <input type="text" name="address"><br>
		Email <input type="text" name="email"><br>
		Fuel Limit <input type="text" name="limit"><br>
		Letter <input type="text" name="letter"><br>
		password <input type="password" name="password"><br>
		
		
		<input type="submit" name="submit" value="Create Company">
	</form>

</body>
</html>