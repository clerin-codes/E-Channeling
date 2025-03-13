package com.payment;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PaymentServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve payment parameters from the request
        String pid = request.getParameter("pid");              // Patient ID
        String amountStr = request.getParameter("amount");     // Payment amount
        String date = request.getParameter("date");            // Payment date
        String method = request.getParameter("method");        // Payment method
        String phone = request.getParameter("phone");        // phone

        // Parse the amount as double
        double amount = Double.parseDouble(amountStr);

        // Call PaymentDBUtil to add the payment
        boolean isSuccess = PaymentDBUtil.addPayment(pid, amount, date, method, phone);
        
        // Debugging logs
        System.out.println("Patient ID: " + pid);
        System.out.println("Amount: " + amount);
        System.out.println("Date: " + date);
        System.out.println("Method: " + method);
        System.out.println("phone: " + phone);

        if (isSuccess) {
            // If payment is successful, retrieve the payment details for this patient (pid)
            List<Payment> payments = PaymentDBUtil.getPaymentsById(pid);
            request.setAttribute("payments", payments);
            
            // Forward to payment view JSP page
            RequestDispatcher dis = request.getRequestDispatcher("paymentView.jsp");
            dis.forward(request, response);
        } else {
            // If payment failed, forward to an error page
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}
