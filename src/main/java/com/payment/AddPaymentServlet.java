package com.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve payment details from the request
        String patientId = request.getParameter("pid");
        String amount = request.getParameter("amount");
        String date = request.getParameter("date");
        String payment_method = request.getParameter("payment_method");
        String phone = request.getParameter("phone");
        
        // Call the addPayment method from PaymentDBUtil
        boolean isAdded = PaymentDBUtil.addPayment(patientId, Double.parseDouble(amount), date, payment_method, phone);
        
        if (isAdded) {
            request.setAttribute("message", "Payment added successfully!");
            request.getRequestDispatcher("paymentView.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Failed to add payment. Please try again.");
            request.getRequestDispatcher("unsuccess.jsp").forward(request, response);
        }
    }
}
