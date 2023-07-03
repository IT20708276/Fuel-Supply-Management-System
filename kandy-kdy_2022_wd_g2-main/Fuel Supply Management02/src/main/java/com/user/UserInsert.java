package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class UserInsert
 */
@WebServlet("/UserInsert")
public class UserInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nic =request.getParameter("nic");
		String fname =request.getParameter("fname");
		String lname =request.getParameter("lname");
		String password =request.getParameter("password");
		String email =request.getParameter("email");
		String otp =request.getParameter("otp");
		String address =request.getParameter("address");
		
		boolean isTrue;
		isTrue = UserDbUtil.insertUser(nic, fname, lname, password, otp, email, address);
		
		if (isTrue==true) {
			RequestDispatcher dis =request.getRequestDispatcher("UserLogin.jsp");
			dis.forward(request, response);
			
			
		}else {
			PrintWriter out =response.getWriter();
		    JOptionPane.showMessageDialog(null, "Registration Unsuccessful ");
		    response.sendRedirect("UserRegistration.jsp");
		}
	}

}
