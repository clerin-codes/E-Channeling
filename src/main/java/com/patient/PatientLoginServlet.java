package com.patient;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uid");
        String password = request.getParameter("pass");
        
        try {
            List<Patient> patient = patientDBUtil.validate(username, password);
            if (!patient.isEmpty()) {
                // Successful login
                request.setAttribute("pDetails", patient);
                RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
                dis.forward(request, response);
            } else {
                // Failed login
                request.setAttribute("errorMessage", "Invalid username or password");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            }
        } catch(Exception e) {
            e.printStackTrace();
            // Handle exceptions
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        }
    }
}