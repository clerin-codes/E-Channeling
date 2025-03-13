package com.payment;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the parameters from the request
        String idpayment = request.getParameter("idpayment");  // Payment ID
        String pid = request.getParameter("pid");              // Patient ID
        String amountStr = request.getParameter("amount");     // Payment amount
        String date = request.getParameter("date");            // Payment date
        String payment_method = request.getParameter("payment_method");        // Payment method
        String phone = request.getParameter("phone");        // Payment status

        // Parse the amount as double
        double amount = Double.parseDouble(amountStr);

        // Call PaymentDBUtil to update the payment
        boolean isTrue = PaymentDBUtil.updatePayment(idpayment, pid, amount, date, payment_method, phone);

        if (isTrue) {
            // If the update is successful, forward to the payment view page
            request.setAttribute("pid", pid);  // Pass the patient ID back to the request
            RequestDispatcher dis = request.getRequestDispatcher("paymentView.jsp");
            dis.forward(request, response);
        } else {
            // If the update fails, forward to an error page
            request.setAttribute("pid", pid);
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
