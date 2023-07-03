package dead.web;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.*;

@WebServlet("/edit1")
public class UserEditDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//declare variables and assign with the data
		String name1 = request.getParameter("sprice");
		String uname1 = request.getParameter("pprice");
		String uname2 = request.getParameter("id");
		
		
		//declare objects
		RequestDispatcher rd = null;
		
		Connection conn = null;
		
		PreparedStatement pst= null;
		
		//declare session and get the session values
		
		
		try {
			//register JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//establish the Database connection 
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelstaff","root","Vithya24");
			
			//creating sql query
				pst = conn.prepareStatement("update fuel_type set sellingPrice = ? , purchasingPrice = ?  where FuelID = ?  ");
				pst.setString(1,name1);
				pst.setString(2, uname1);
				pst.setString(3, uname2);
				
			
			//execute sql query 
			pst.executeUpdate();
			
			// redirect to the login page after edit their account
			rd = request.getRequestDispatcher("Fuel_listEdit.jsp");
			
			
			rd.forward(request, response);
			
		}catch(Exception e) {
			//get the exception
			e.printStackTrace();
		}finally {
			try {
				//close the connection
				conn.close();
			}catch(Exception e){
				//get the exception
				e.printStackTrace();
			}
		}
		

		
		
		
	}

}
