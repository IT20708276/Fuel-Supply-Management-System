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
	<style>
	    <%@ include file="css/style.css"%>
     <%@ include file="myCSS\staff.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
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
.tableRep{
width: 75%;
	color: white;
	background-color: black;
}
</style>
</head>
<body>



<%
try{
    Connection con =DriverManager.getConnection(url, user, psswd);
    Statement stmt=con.createStatement();
    String sql = "select COUNT(address) from user group by address";
    ResultSet rs=stmt.executeQuery(sql);



   
    
while(rs.next()){



count[x] = rs.getString("COUNT(address)");



x=x+1;




}
con.close();
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
    String sql1 = "select address from user group by address";
    ResultSet res=stmt.executeQuery(sql1);



   
    
while(res.next()){



 num[x] = res.getString(1);
x = x+1;





}
con1.close();
} catch (Exception e) {
e.printStackTrace();
}



x=0;
%>
<table class="tableRep" border=1 style="color:white; padding:20px;">



   <tr><th>Address</th>
    <th>User Count</th></tr>



   
<%



x=0;
while(num[x]!=null) {%>    
    <tr>



   <td><%= num[x]%></td>
    <td><%= count[x]%></td>
    
    </tr>
<%
    x=x+1;
}




%>
</table>




<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);



     function drawChart() {



        
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
        
              ['<%= num[0]%>',     <%=count[0]%>],
              ['<%= num[1]%>',     <%=count[1]%>],
              ['<%= num[2]%>',     <%=count[2]%>],
              ['<%= num[3]%>',     <%=count[3]%>],
              ['<%= num[4]%>',     <%=count[4]%>],
              ['<%= num[5]%>',     <%=count[5]%>],
              ['<%= num[6]%>',     <%=count[6]%>],
              ['<%= num[7]%>',     <%=count[7]%>],
              ['<%= num[8]%>',     <%=count[8]%>],
              ['<%= num[9]%>',     <%=count[9]%>],
              ['<%= num[10]%>',     <%=count[10]%>],
        
     
        ]);



       var options = {
          title: 'User Report'
        };



       var chart = new google.visualization.PieChart(document.getElementById('piechart'));



       chart.draw(data, options);
      }
    
let temp = <%= num[0] %>;
let temp1 = <%= num[1] %>;
let temp2 = <%= num[2]%>;
alert(temp);
alert(temp1);
alert(temp2);
</script>


<button id = "reportbtn" onclick="window.print()" style="margin-left:1200px;">Print</button>

    <div id="piechart" style="width: 900px; height: 500px;"></div>




</body>
</html>