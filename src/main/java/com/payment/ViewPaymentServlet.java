package com.payment;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewPaymentServlet")
public class ViewPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the patient ID (pid) from the request
        String pid = request.getParameter("pid");
        System.out.println("Called Servlet View Payment");
        System.out.println("Patient ID: " + pid);

        // Check if pid is not null
        if (pid != null) {
            // Fetch the payments by patient ID
            List<Payment> payments = PaymentDBUtil.getPaymentsById(pid);
            
            // Set the payments list as an attribute for the JSP page
            request.setAttribute("payments", payments);
            
            // Forward the request to the paymentView.jsp page to display the payments
            request.getRequestDispatcher("paymentView.jsp").forward(request, response);
        } else {
            // If no patient ID is provided, forward to an unsuccessful page
            request.getRequestDispatcher("unsuccess.jsp").include(request, response);
        }
    }
}
