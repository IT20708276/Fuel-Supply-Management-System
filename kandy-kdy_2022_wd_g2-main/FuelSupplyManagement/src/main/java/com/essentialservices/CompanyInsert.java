package com.essentialservices;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CompanyInsert")
public class CompanyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cId = request.getParameter("Cid");
		String cName = request.getParameter("Cname");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String type = request.getParameter("type");
		String reason = request.getParameter("reason");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		int limit = Integer.parseInt(request.getParameter("limit")) ;
		String letter = request.getParameter("letter");
		String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = EssentialServicesDBUtil.insertcompany(cId, cName,  fName,  lName,  type,  reason,  address,  email, limit, letter, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
