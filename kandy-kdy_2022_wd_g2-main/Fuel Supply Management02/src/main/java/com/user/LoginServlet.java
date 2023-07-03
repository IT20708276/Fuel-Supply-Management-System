package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("nic");
		String password = request.getParameter("pswd");
		try {
				List<User> usDet= UserDbUtil.validate(username, password);
				request.setAttribute("usDet", usDet);
		}catch(Exception e) {
			
			e.printStackTrace();
		}	
		//navigating to pages
		
		
		if(request.getAttribute("usDet")==null)
	    {
			PrintWriter out =response.getWriter();
	        JOptionPane.showMessageDialog(null, "Invalid NIC or Password ");
		    response.sendRedirect("UserLogin.jsp");
		

	    }else {
	    	RequestDispatcher dis=request.getRequestDispatcher("UserHomepage.jsp");
			dis.forward(request, response);
	    }
		
	}

}
