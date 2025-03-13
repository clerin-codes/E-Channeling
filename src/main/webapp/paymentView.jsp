<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Page</title>

    <!-- CSS only -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
        crossorigin="anonymous">

    <!-- JavaScript Bundle with Popper -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
    </script>
</head>
<body>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    //String pid = request.getParameter("pid");
    String pid = "1";
    String driverName = "com.mysql.jdbc.Driver";

    String url = "jdbc:mysql://localhost:3306/echanneling";
    String user = "root";
    String pass = "root";
    Connection con;

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<div class="px-4 py-5 text-center">
    <img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png" alt="">
    <h1 class="display-5 fw-bold">YOUR PAYMENT DETAILS</h1>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">Here You can view and manage your payment details.</p>
    </div>
</div>

<div id="mmenu_screen" class="container-fluid main_container d-flex">
    <div class="row flex-fill">
        <div class="col-sm-2 h-100"></div>
        <div class="col-sm-8 h-100">
            <div class="card">
                <div class="card-body">

                    <table class="table table-striped pb-5">    
                      <thead>
                        <tr>
                          <th scope="col">Payment ID</th>
                          <th scope="col">Date</th>
                          <th scope="col">Amount</th>
                          <th scope="col">Payment Method</th>
                          <th scope="col">phone</th>
                          <th scope="col">Actions</th>
                        </tr>
                      </thead>
                      <tbody>

                        <%
                        try {
                            connection = DriverManager.getConnection(url, user, pass);
                            statement = connection.createStatement();
                            
                            String sql = "SELECT * FROM payment WHERE idpatient='" + pid + "'";
                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                        %>

                        <tr>
                          <td class="align-middle"><%= resultSet.getString("idpayment") %></td>
                          <td class="align-middle"><%= resultSet.getString("date") %></td>
                          <td class="align-middle"><%= resultSet.getString("amount") %></td>
                          <td class="align-middle"><%= resultSet.getString("payment_method") %></td>
                          <td class="align-middle"><%= resultSet.getString("phone") %></td>
                          
                       <td class="align-middle">
    <c:url value="paymentUpdate.jsp" var="paymentUpdate">
        <c:param name="idpayment" value='<%= resultSet.getString("idpayment") %>'></c:param>
        <c:param name="pid" value='<%= resultSet.getString("idpatient") %>'></c:param>
        <c:param name="date" value='<%= resultSet.getString("date") %>'></c:param>
        <c:param name="amount" value='<%= resultSet.getString("amount") %>'></c:param>
        <c:param name="payment_method" value='<%= resultSet.getString("payment_method") %>'></c:param>
        <c:param name="phone" value='<%= resultSet.getString("phone") %>'></c:param>
    </c:url> 

    <div class="button-container" style="display: flex; gap: 10px; align-items: center;">
        <a href="${paymentUpdate}">
            <input class="btn btn-primary" type="button" name="update" value="UPDATE">
        </a>

        <form action="DeletePaymentServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this payment?');">
            <input type="hidden" name="idPayment" value="<%= resultSet.getString("idpayment") %>">
            <input class="btn btn-danger" type="submit" name="delete" value="DELETE">
        </form>
    </div>
</td>


</td>
                        </tr>

                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                      </tbody>
                    </table>

                    <!-- Back to Home Page link -->
                    <div class="mt-4">
                        <a href="home.jsp" class="btn btn-secondary">Back to Home Page</a>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-sm-2 mmenu_screen--direktaction flex-fill"></div>
    </div>
</div>

</body>
</html>