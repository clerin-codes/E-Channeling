package com.labTests;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/labTestUpdateServlet")
public class labTestUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ltid = request.getParameter("ltid");
		String pid = request.getParameter("pid");
		String name = request.getParameter("name");
		String lid = request.getParameter("lid");
		String phone = request.getParameter("phone");
		
		boolean isTrue;
		
		isTrue = labTaskDBUtil.updateLabTest(ltid,pid,lid,name,phone);
		
		if(isTrue == true) {
			request.setAttribute("pid", pid);
			RequestDispatcher dis = request.getRequestDispatcher("labTestView.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("id", pid);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}	
	}

}
