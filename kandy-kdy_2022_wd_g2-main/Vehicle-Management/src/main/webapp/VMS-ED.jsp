<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.PrintWriter , java.sql.*"%>
<!DOCTYPE html>
<%Connection conn;



	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FMS?","root","1234");
	String np = request.getParameter("np");
	session.setAttribute("np",np);
	PreparedStatement pst1 = conn.prepareStatement("select * from vehicle where plateNumber = ?");
	pst1.setString(1, np);
	

	ResultSet result = pst1.executeQuery(); 
	String cNo="";
	String pNo ="";
	String vType ="";
	String FType ="";
	String FLimit ="";
	String date = "";
	String rfuel="";
	String status = "";
	
				if(result.next()){
					cNo = result.getString("chassisNumber");
					 pNo = result.getString("plateNumber");
					 vType= result.getString("vehicleType");
					 FType = result.getString("fuelID");
					 FLimit = result.getString("fuelLimit");
					 date = result.getString("updatedDate");
					 rfuel = result.getString("remainingFuel");
					 status = result.getString("status");
			}
				
				
				PreparedStatement pst = conn.prepareStatement("select * from fuel_Type");
				
				PreparedStatement pst2 = conn.prepareStatement("select * from fuel_Type where fuelID=?");
				pst2.setString(1, FType);
				
				ResultSet result2 = pst2.executeQuery();
				
				String fuelType = "";
				
				if(result2.next()){
					fuelType = result2.getString("FuelType");
				}

				ResultSet result1 = pst.executeQuery();
	%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Your (<% out.println(pNo); %>) Vehicle Details</title>
 <link rel="stylesheet" href="assets/CSS/maicons.css">

  <link rel="stylesheet" href="assets/CSS/bootstrap.css">

  <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.css">

  <link rel="stylesheet" href="assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="assets/CSS/theme.css">
</head>
<body>

	<div class="page-section">
    <div class="container">
    <h1 class="text-center wow fadeInUp">Edit Your (<% out.println(pNo); %>) Vehicle Details</h1>
      <form class="main-form" action="edit" method="post">
        <div class="row mt-5 ">
          <div class="col-12 col-sm-6 py-2 wow fadeInLeft">
          	<h5 class = "text-left wow fadeInUp">Chassis Number</h5>
            <input type="text" class="form-control"  id="CN" placeholder="Chassis Number ..."  name="cNumber" value="<% out.println(cNo); %>" required> 
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInRight">
          <h5 class = "text-right wow fadeInUp">Plate Number</h5>
            	<input type="text" class="form-control" id="NoPl" placeholder="Plate Number ..." value="<% out.println(pNo); %>" readonly  name="pNumber"  title="Plate Number should be ex:'AB ABC 1234'" required>
          </div>
          <div class="col-12 py-2 wow fadeInUp" data-wow-delay="300ms">
          <h5 class = "text-center wow fadeInUp">Vehicle Type</h5>
       			<input type="text" class="form-control" placeholder="Vehicle Type ..." readonly value="<% out.println(vType); %>" readonly>
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInLeft">
          	<h5 class = "text-left wow fadeInUp">Fuel Limit</h5>
			<input type="text" class="form-control" placeholder="Fuel Limit ..." value="<% out.println(FLimit); %>" readonly name = "fLimit" id="fLimit">
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInRight">
          <h5 class = "text-right wow fadeInUp">Created Date</h5>
            <input type = "text" class="form-control" id = "date" name = "date" value="<% out.println(date); %>" readonly autocomplete="off" name="date">
          </div>
			<div class="col-12 col-sm-6 py-2 wow fadeInLeft">
          	<h5 class = "text-left wow fadeInUp">Current Fuel Type</h5>
			<input type="text" placeholder="Fuel Type..." class="form-control" readonly name="cfType" value="<% out.println(fuelType); %>"readonly>
			<input type="hidden" name="CFUELID" value="<% out.println(FType); %>">
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInRight">
          <h5 class = "text-right wow fadeInUp">New Fuel Type</h5>
               <select id="fuelType" name="fType" class="custom-select"  >
							<option disabled selected>Select Fuel Type</option>
							<% while(result1.next()){ %>
                            
                            
                            <option value="<%=result1.getString("fuelID") %>"><%=result1.getString("FuelType") %></option>
                          
					 <%} %>
               </select>
              
          </div>
          
        </div>
       <div class = "login_Btn">
        
      	<button name="action" class="btn col-12 btn-primary mt-3 wow zoomIn" value="update" onclick="return editValid()">Update</button>
      	
      	<a href = "index.jsp" class="btn col-12 btn-outline-accent  mt-3 wow zoomIn">Cancel</a>
      	
      	</div>
      	</form>
      	</div>
      	</div>
	
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
<script type="text/javascript" src = "assets/JS/validate.js"></script>
</html>