<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/echanneling";
    String user = "root";
    String pass = "root";

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    String idpayment = request.getParameter("idpayment");
    

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(url, user, pass);
        statement = con.createStatement();
        String sql = "SELECT * FROM payment WHERE idpayment = '" + idpayment + "'";
        resultSet = statement.executeQuery(sql);
        if (resultSet.next()) {
            // Fetch the payment details
            String pid = resultSet.getString("idpatient");
            String amount = resultSet.getString("amount");
            String date = resultSet.getString("date");
            String payment_method = resultSet.getString("payment_method");
            String phone = resultSet.getString("phone");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Payment</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<section class="vh-100" style="background-color: #eee;">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">UPDATE Payment</p>

                                <form action="UpdatePaymentServlet" method="POST" class="mx-1 mx-md-4">
                                    <div class="mb-3">
                                        <label class="form-label">Payment ID</label>
                                        <input class="form-control" type="text" name="idpayment" value='<%=idpayment %>' readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="patientId">Patient ID</label>
                                        <input class="form-control" type="text" name="pid" value='<%=pid %>' readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="paymentAmount">Amount</label>
                                        <input class="form-control" type="number" name="amount" value='<%=amount %>' required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label" for="paymentDate">Payment Date</label>
                                        <input class="form-control" type="date" name="date" value='<%=date %>' required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Select Payment Method</label>
                                        <select class="form-control" name="payment_method" required>
                                            <option value="CREDIT_CARD" <%= payment_method.equals("CREDIT_CARD") ? "selected" : "" %>>Credit Card</option>
                                            <option value="DEBIT_CARD" <%= payment_method.equals("DEBIT_CARD") ? "selected" : "" %>>Debit Card</option>
                                            <option value="CASH" <%= payment_method.equals("CASH") ? "selected" : "" %>>Cash</option>
                                            <option value="ONLINE" <%= payment_method.equals("ONLINE") ? "selected" : "" %>>Online Transfer</option>
                                        </select>
                                    </div>

                                  
                                   <div class="mb-3"><label class="form-label" for="phone">Contact Number</label>
                                   <input id="phone" class="form-control" type="text" name="phone" value='<%= phone %>' pattern="\d{10}" title="Please enter a valid 10-digit phone number" required>
                                   <span id="phoneError" style="color:red; display:none;">Please enter a valid 10-digit phone number</span></div>
                                   <script>document.getElementById('phone').addEventListener('input', function() {var phoneInput = this.value;var phoneError = document.getElementById('phoneError');
                                   var phonePattern = /^[0-9]{10}$/;if (!phonePattern.test(phoneInput)) {phoneError.style.display = 'block';} 
                                   else {phoneError.style.display = 'none';}});</script>
                                   

                                    
                                    
                                    

                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Update Payment">
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%
        } else {
            out.println("<p>No payment found with the given ID.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
