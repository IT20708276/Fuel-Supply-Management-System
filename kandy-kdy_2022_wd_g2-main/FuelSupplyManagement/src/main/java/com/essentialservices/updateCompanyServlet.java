package com.essentialservices;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.essentialservices.EssentialServices;
import com.essentialservices.EssentialServicesDBUtil;




@WebServlet("/updateCompanyServlet")
public class updateCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cid = request.getParameter("cId");
		String cname= request.getParameter("cName"); 
		String fname= request.getParameter("fName");
		String lname= request.getParameter("lName");
		String sType= request.getParameter("type");
		String reason= request.getParameter("reason");
	    String address= request.getParameter("address");
	    String email= request.getParameter("email");
	    String fLimit= request.getParameter("limit");
	    String letter= request.getParameter("letter");
	    String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = EssentialServicesDBUtil.updatecompany( cid, cname, fname, lname, sType, reason, address,  email,  fLimit,  letter,  password);
		
		if(isTrue == true) {
			
			List<EssentialServices> essDetails = EssentialServicesDBUtil.getCompanyDetails(cid);
			request.setAttribute("essDetails", essDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("companyaccount.jsp");
			dis.forward(request, response);
		}
		else {
			
			List<EssentialServices> essDetails = EssentialServicesDBUtil.getCompanyDetails(cid);
			request.setAttribute("essDetails", essDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("companyaccount.jsp");
			dis.forward(request, response);
		}
		
	}

}
