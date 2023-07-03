package com.employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/employeeinsert")
public class employeeinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String staffID = request.getParameter("sid");
		String totalOT = request.getParameter("tot");
		String totalLeave = request.getParameter("tlt");
		String month =request.getParameter("month");
		String totalDaysWorked = request.getParameter("tdw");
		
		boolean isTrue;
		
		isTrue = EmployeeDBUtil.insertemployee(totalOT, totalLeave, month, totalDaysWorked);
		
		if(isTrue == true) {
			
			HttpSession open = request.getSession();
			open.setAttribute("sid", staffID);
			
			List<Employee> empDetails = EmployeeDBUtil.getSlipDetails(staffID);
			request.setAttribute("empDetails", empDetails);
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
