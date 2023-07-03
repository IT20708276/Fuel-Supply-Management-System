<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/slip.css">
</head>
<body>



<!-- <form action ="insert" method = "post"> -->

<!-- Total OT <input type = "text" name = "tot"><br> -->
<!-- Total Leave Taken <input type = "text" name = "tlt"><br> -->
<!-- Month <input type = "text" name = "month"><br> -->
<!-- Total Days Worked <input type = "text" name = "tdw"><br> -->


<div class="container">
    <div class="title">Create Slip</div>
    <div class="content">
      <form action="insert" method = "post">
        <div class="user-details">
         <div class="input-box">
            <span class="details">Employee ID</span>
            <input type="text" name = "sid" placeholder="enter" required>
          </div>
          <div class="input-box">
            <span class="details">Total Over Time</span>
            <input type="text" name = "tot" placeholder="Twenty 20h" required>
          </div>
          <div class="input-box">
            <span class="details">Total Leave Taken</span>
            <input type="text" name = "tlt" placeholder="Enter Days in Words(*)" required>
          </div>
          <div class="input-box">
            <span class="details">Month</span>
            <input type="text" name = "month" placeholder="Enter Month" required>
          </div>
          <div class="input-box">
            <span class="details">Total Days Worked</span>
            <input type="text" name = "tdw" placeholder="Enter Date" required>
          </div>
         
        </div>
        
        <div class="button">
          <input type="submit" name="submit" value="Create Slip">
        </div>
      </form>
    </div>
  </div>

</body>
</html>