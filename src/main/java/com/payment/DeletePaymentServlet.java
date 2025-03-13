package com.payment;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the payment ID from the request
        String idPayment = request.getParameter("idPayment"); 
        
        // Call PaymentDBUtil to delete the payment by its ID
        boolean isTrue = PaymentDBUtil.deletePayment(idPayment);
        
        if (isTrue) {
            // If deletion is successful, redirect back to PaymentView.jsp
        	response.sendRedirect("paymentView.jsp");
        } else {
            // If deletion fails, forward to a failure page (optional)
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
