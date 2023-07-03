package com.itp.controller;

import jakarta.servlet.http.HttpServlet;



import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itp.model.Staff;
import com.itp.service.StaffInterface;
import com.itp.service.StaffInterfaceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterStaff
 */
@WebServlet("/RegisterStaff")
public class RegisterStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterStaff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException {
		response.setContentType("text/html");
		
		System.out.print("doPost Add Start");

		Staff s1 = new Staff();
		
		
		s1.setFirstName(request.getParameter("FirstName"));
		s1.setLastName(request.getParameter("LastName"));
		s1.setAge(Integer.parseInt(request.getParameter("Age")));
		s1.setAddress(request.getParameter("Address"));
		s1.setEmail(request.getParameter("Email"));
		s1.setAccNo(request.getParameter("AccNo"));
		s1.setJoinedYear(Integer.parseInt(request.getParameter("JoinedYear")));
		s1.setPassword(request.getParameter("Password"));
		s1.setStaffType(request.getParameter("StaffType"));
		s1.setContactYears(Integer.parseInt(request.getParameter("ContactYears")));
		s1.setBasicSalary(Double.parseDouble(request.getParameter("BasicSalary")));
		s1.setOt(Double.parseDouble(request.getParameter("Ot")));
		
		StaffInterface si = new StaffInterfaceImpl();
		si.AddStaff(s1);

		request.setAttribute("s1", s1);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SendEmail");
		dispatcher.forward(request, response);
	}

}
