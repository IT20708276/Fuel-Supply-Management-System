<%@ page import = "java.util.*" %>
<%@ page import = "javax.mail.*" %>
<%@ page import = "javax.mail.internet.*" %>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.DriverManager" %>
<%@page import= "java.sql.PreparedStatement" %>
<%@page import= "java.sql.ResultSet" %>
<%@page import= "java.sql.Statement" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>







<%



;
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/fuelstaff";
    String userid = "root";
    String password = "Vithya24";
    //String Email =request.getParameter("Email");
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;



try{
    connection = DriverManager.getConnection(connectionUrl, userid, password);
    statement=connection.createStatement();
        
}catch(Exception e){
    e.printStackTrace();
}



String email = (String)session.getAttribute("Email");
System.out.println(email);



//String to = request.getParameter("Key");
String sql = "select s.totalOT , s.totalLeave, s.month , s.totalDaysWorked from fuelstaff.attendance s , fuelstaff.staff e where s.staffID = e.StaffID and e.Email = '"+email+"'";
//System.out.println(to);
resultSet = statement.executeQuery(sql);





String one = "";
String two = "";
String four = "";



if (resultSet.next()){
    one = resultSet.getString("s.totalOT");
    two = resultSet.getString("s.totalLeave");
    four = resultSet.getString("s.totalDaysWorked");
}

System.out.println(one);
System.out.println(two);
System.out.println(four);

%>  



<body>



   <%
    String N  = "hello";
        if (resultSet.next() == false){
            
            
            // Sender's email ID needs to be mentioned
            String from = "projectfuelsupply@gmail.com";



           final String username = "Temp Project";
            final String password1 = "frkgjqmhxitmkije";
            // Assuming you are sending email from through gmails smtp
            String host = "smtp.gmail.com";



         
            // Setup mail server
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "587");
           
            



           // Get the Session object.// and pass username and password
            Session session1 = Session.getInstance(properties, new javax.mail.Authenticator() {



               protected PasswordAuthentication getPasswordAuthentication() {



                   return new PasswordAuthentication("projectfuelsupply@gmail.com", "frkgjqmhxitmkije");
                }
            });



           try {
                
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session1);



               // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));



               // Set To: header field of the header.
                message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));



               // Set Subject: header field
                message.setSubject("Your Attendance Info");
                
                // Now set the actual message
                message.setText(" TotalOT: "+one + "Total Leave : " + two +"total Days Worked: " + four);



               System.out.println("sending...");
                // Send message
                Transport.send(message);
                System.out.println("Sent message successfully....");
            } catch (MessagingException mex) {
                mex.printStackTrace();
            }
            %>
            <script>
                    alert("Email sent successfully");
                    history.back();
        </script>
            
            <%
            
        }else{
            %>
                <script>
                    alert("Invalid Email !");
                    history.back();
                </script>
                
            <%
            
        }
    
    %>



   








</body>
</html>