package com.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderUpdateServlet")
public class orderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		String pid = request.getParameter("pid");
		String name = request.getParameter("name");
		String mid = request.getParameter("mid");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		boolean isTrue;
		
		isTrue = orderDBUtil.UpdateOrder(oid, pid,phone,name,address,mid);
		
		if(isTrue == true) {
			request.setAttribute("pid", pid);
			RequestDispatcher dis = request.getRequestDispatcher("orderView.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("id", pid);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
