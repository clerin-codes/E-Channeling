package com.channel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateChanneServlet")
public class UpdateChanneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		String pid = request.getParameter("pid");
		String name = request.getParameter("pname");
		String age = request.getParameter("age");
		String did = request.getParameter("select");
		String date = request.getParameter("date");
		
		boolean isTrue;
		
		isTrue = ChannelingDBUtil.updateChannel(cid, pid, name, age, did, date);
		
		if(isTrue == true) {
			request.setAttribute("pid", pid);
			RequestDispatcher dis = request.getRequestDispatcher("channelView.jsp");
			dis.forward(request, response);
		}else {
			request.setAttribute("id", pid);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}	
	}

}
