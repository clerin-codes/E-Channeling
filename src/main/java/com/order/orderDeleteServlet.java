package com.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderDeleteServlet")
public class orderDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("oid");
		String pid = request.getParameter("pid"); 
		
		boolean isTrue = orderDBUtil.DeleteOrder(id);
		
		if(isTrue == true) {
			request.setAttribute("pid", pid);
			RequestDispatcher dis = request.getRequestDispatcher("orderView.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("pid", pid);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
