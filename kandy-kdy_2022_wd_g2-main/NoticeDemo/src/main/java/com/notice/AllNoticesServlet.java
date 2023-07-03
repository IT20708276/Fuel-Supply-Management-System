package com.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AllNoticesServlet")
public class AllNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String allNotices = request.getParameter("allnotices");
		/*catching errors*/
		try {
			
			List<Notice> allnotDet = NoticeDBUtil.getAllNotices(allNotices);
			request.setAttribute("allnotDet", allnotDet);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("search.jsp");
		dis.forward(request, response);
	}

}
