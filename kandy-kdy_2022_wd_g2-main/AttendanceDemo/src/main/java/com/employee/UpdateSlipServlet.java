package com.employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




 
@WebServlet("/UpdateSlipServlet")
public class UpdateSlipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("slipid");
		String totalOT = request.getParameter("totalot");
		String totalLeave = request.getParameter("totalleave");
		String month = request.getParameter("month");
		String totalDaysWorked = request.getParameter("totaldaysworked");
		
		boolean isTrue;
		
		isTrue = EmployeeDBUtil.updateslip(id, totalOT, totalLeave, month, totalDaysWorked);
		
		
		if(isTrue == true) {
			
			List<Employee> empDetails = EmployeeDBUtil.getEmployeeDetails(id);
			request.setAttribute("empDetails", empDetails);
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
		
		else {
			
			
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
