<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%@page import="java.io.PrintWriter , java.sql.*"%>
<head>
     
    <meta charset="utf-8">
    <title>Bar Chart</title>
    <style>
    
    body{
    
    margin: 0;
    padding: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: "Roboto " , sans-serif;
    background: #333;
    
    
}


.chart{
    
    width: 600px;
    height: 300px;
    display: block;
    
}

.numbers{
    
    color: #fff;
    margin: 0;
    padding: 0;
    width: 50px;
    height: 100%;
    display: inline-block;
    float: left;
    
    
}

.numbers li{
    
    list-style: none;
    height: 150px;
    position: relative;
    bottom: 145px;
    
    
}


.numbers span{
    
    font-size: 12px;
    font-weight: 600;
    position: absolute;
    bottom: 0;
    right: 10px;
    
}


.bars{
    
    
    
    color: #fff;
    font-size: 12px;
    font-weight: 600;
    background: #555;
    margin: 0;
    padding: 0;
    display: inline-block;
    width: 500px;
    height: 300px;
    box-shadow: 0 0 10px 0 #555;
    border-radius: 5px;
}

.bars li{
    display: table-cell;
    width: 100px;
    height: 300px;
    position: relative;
    
}

.bars span{
    
    width :100%;
    position: absolute;
    bottom: -30px;
    text-align: center;
    
    
}

.bars .bar{
    
    display: block;
    background: #17C0EB;
    width: 50px;
   
    position: absolute;
    bottom: 0;
    margin-left: 25px;
    text-align: center;
    box-shadow:0 0 10px 0 rgba(23,192,235,0.5); 
    transition: 0.5s; 
    transition-property: background , box-shadow;
    
    
}

.bars .bar:hover{
    
    background: #55EFC4;
    box-shadow: 0 0 10px 0 rgba (85 , 239 , 196,0.5);
    cursor: pointer;
    
    
}


.bars .bar:before{
    color: #fff;
    content: attr(data-percentage) '%';
    position: relative;
    bottom: 20px;
    
    
    
}

.bot {

positon: absolute;
top:100px;



}






.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:15px;
}

    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
  
  
    </head>
    
    
    <body>
  
    
    
    	<%Connection conn;



						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/femo","root","Aashy#12*2002");
						String sql = "select * from fuel_type where fueltype='petrol/92'";
						Statement pst1 = conn.createStatement();
					
						   ResultSet result1 = pst1.executeQuery(sql);
						   
						   
						   
						   
							String sql2 ="select * from fuel_type where fueltype='petrol/95'";
							Statement pst2 = conn.createStatement();
						
							   ResultSet result2 = pst2.executeQuery(sql2);
							   
							   
							   
							   
							   
							   
								String sql3 = "select * from fuel_type where fueltype='Auto_Diesel'";
								Statement pst3 = conn.createStatement();
							
								   ResultSet result3 = pst3.executeQuery(sql3);
								   
								   
								   
								   
								   
								   
								   
									String sql4 = "select * from fuel_type where fueltype='Super_Diesel'";
									Statement pst4 = conn.createStatement();
								
									   ResultSet result4 = pst4.executeQuery(sql4);
						   
						   
						    %>
	
    
    
    
    
    
    
    <div class="chart">
        
        <ul class="numbers">
        <li><span>100%</span></li>
        <li><span>50%</span></li>
        <li><span>0%</span></li>
        </ul>
        
        <%if(result1.next()){ 
        String temp=(result1.getString("sellingPrice"));
        int one=Integer.parseInt(temp);
        int temp2=one/10;
        %>
        
        
        <ul class="bars">
        <li><div class ="bar" data-percentage="<%out.print(temp2); %>"></div><span>Petrol/92</span></li>
        <%} %>
       
       
       
       
        <%if(result3.next()){ 
        String temp1=(result3.getString("sellingPrice"));
        int one=Integer.parseInt(temp1);
        int temp5=one/10;
        %>
       
       
        <li><div class ="bar" data-percentage="<%out.print(temp5); %>"></div><span>Auto Diesel </span></li>
        <%} %>
       
        
         <%if(result2.next()){ 
        String temp8=(result2.getString("sellingPrice"));
        int one=Integer.parseInt(temp8);
        int temp6=one/10;
        %>
        
        
        <li><div class ="bar" data-percentage="<%out.print(temp6); %>"></div><span>Petrol/95</span></li>    
         <%} %>
        
        
         <%if(result4.next()){ 
        String temp9=(result4.getString("sellingPrice"));
        int one=Integer.parseInt(temp9);
        int temp2=one/10;
        %>
        
        
        
        <li><div class ="bar" data-percentage="<%out.print(temp2); %>"></div><span>Super Diesel</span></li>   
         <%} %>
        </ul>
		
			
		        
        </div>
    
    
    
        <script type="text/javascript">
            $(document).ready(function(e) {  
        $(function(){
            $('.bars li .bar').each(function(key, bar){
            var percentage = $(this).data ('percentage');
            $(this).animate({
                'height': percentage +'%'
            },1000);
        });
        });
            
        });
            
        </script>
        
        <br>
          <a href="fuel-list.jsp" class="button">Back</a>
        
    <button  class="button" onclick="window.print()">Print</button>
    </body>




</html>