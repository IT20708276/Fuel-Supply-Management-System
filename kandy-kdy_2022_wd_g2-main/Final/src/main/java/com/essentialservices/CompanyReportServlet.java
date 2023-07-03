package com.essentialservices;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/CompanyReportServlet")
public class CompanyReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
		
		try {
			List<CompanyReport> repCompany = EssentialServicesDBUtil.getCompanyRDetails();
			request.setAttribute("repCompany", repCompany);
			System.out.println(repCompany);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("EssentialServicesReport.jsp");
		dis.forward(request, response);
	}

}
