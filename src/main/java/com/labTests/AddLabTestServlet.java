package com.labTests;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddLabTestServlet")
public class AddLabTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		String lid = request.getParameter("lab");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		Boolean isTrue;
		
		
		
		isTrue = labTaskDBUtil.addLabTest(pid, lid, name, phone);
		System.out.println(pid);
		System.out.println(lid);
		System.out.println(name);
		System.out.println(phone );
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
