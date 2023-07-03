<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Slip</title>
<link rel="stylesheet" href="css/mystyles.css">

<style>
     <%@ include file="AttendanceCSS/mystyles.css"%>
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



<script type="text/javascript">
function alertName(){



   
alert("Slip has been submitted");
}




function chkDay(){
    var tlt = document.getElementById('tlt').value;
    
    var tdw = document.getElementById('tdw').value;
    
    
    if(tlt < 0 || tlt > 30){
        alert("Total Leave Taken should be higher than 0 and less than 31")
        return false;
    }
    else if(tdw < 0 || tdw > 30){
        alert("Total Days Worked should be higher than 0 and less than 30")
        return false;        
    }
    else{
        alert("Please Click Create Slip");
        document.getElementById('submit').disabled=false;
        return true;
    }
    



}




</script>



<!-- <form action ="insert" method = "post"> -->



<!-- Total OT <input type = "text" name = "tot"><br> -->
<!-- Total Leave Taken <input type = "text" name = "tlt"><br> -->
<!-- Month <input type = "text" name = "month"><br> -->
<!-- Total Days Worked <input type = "text" name = "tdw"><br> -->

<div class="formdiv">




      <form action="employeeinsert" method = "post" onsubmit = "alertName()">
     <h2 style="color:white;"> Create Slip</h2>
     
     
     <table>



           <tr>
                <td> Employee ID</td>
                <td><input type="text" name = "sid" placeholder="Enter ID" required></td>
            </tr>
            <tr>
                <td>Total Over Time</td>
                <td><input type="number" name = "tot" placeholder="Enter OT in hours" required></td>
            </tr>
            <tr>
                <td>Total Leave Taken</td>
                <td><input type="number" id="tlt" name = "tlt" placeholder="Enter Days" required></td>
            </tr>
            
            <tr>
            <td>Month</td>
            <td><select name = "month" required>
            <option value = "January">January</option>
            <option value = "February">February</option>
            <option value = "March">March</option>
            <option value = "April">April</option>
            <option value = "May">May</option>
            <option value = "June">June</option>
            <option value = "July">July</option>
            <option value = "August">August</option>
            <option value = "September">September</option>
            <option value = "October">October</option>
            <option value = "November">November</option>
            <option value = "December">December</option>
            </select></td>
            </tr>
            <tr>
                <td>Total Days Worked</td>
                <td><input type="number" id="tdw"name = "tdw" placeholder="Enter Days" required></td>
            </tr>
            
<!--       Employee ID<input type="text" name = "sid" placeholder="enter" required> -->
         
<!--      Total Over Time<input type="text" name = "tot" placeholder="Twenty 20h" required><br> -->
<!--         Total Leave Taken<input type="text" name = "tlt" placeholder="Enter Days in Words(*)" required> -->
<!--           Month<select name = "month" required> -->
<!--             <option value = "january">January</option> -->
<!--             <option value = "febrary">February</option> -->
<!--             <option value = "january">March</option> -->
<!--             <option value = "january">April</option> -->
<!--             <option value = "january">May</option> -->
<!--             <option value = "january">June</option> -->
<!--             <option value = "january">July</option> -->
<!--             <option value = "january">August</option> -->
<!--             <option value = "january">September</option> -->
<!--             <option value = "january">October</option> -->
<!--             <option value = "january">November</option> -->
<!--             <option value = "january">December</option> -->
<!--             </select> -->
<!--           Total Days Worked<input type="text" name = "tdw" placeholder="Enter Date" required> -->
    <tr>
<td colspan="2">
<center><input type="button" onclick="chkDay()" value="Check"> </center></td>
</tr>
            
<tr>
<td colspan="2">



<input type="submit" name="submit" id="submit" value="Create Slip" disabled> </td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="cancel" value="Cancel"><a href = "index.jsp"></a> </td>
</tr>
</table>
      </form>
    </div>



</body>
</html>