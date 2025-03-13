package com.patient;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PatientRegisterServlet")
public class PatientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PatientRegisterServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("pname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Boolean isTrue;
		
		isTrue = patientDBUtil.registerPatient(name, username, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
