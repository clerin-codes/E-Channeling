package com.payment;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DBConnect;

public class PaymentDBUtil {
    private static Connection con = null;

    public static boolean addPayment(String pid, double amount, String date, String payment_method, String phone) {
        boolean isSuccess = false;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO payment (idpatient, amount, date, payment_method, phone) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pid);
            pstmt.setDouble(2, amount);
            pstmt.setString(3, date);
            pstmt.setString(4, payment_method);
            pstmt.setString(5, phone);

            int rs = pstmt.executeUpdate();
            if (rs > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in addPayment: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    public static List<Payment> getPaymentsById(String pid) {
        List<Payment> list = new ArrayList<>();
        System.out.println("Call getPaymentsById method");
        try {
            con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM payment WHERE idpatient = ?");
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Payment p = new Payment();
                p.setIdpayment(rs.getInt("idpayment"));
                p.setPid(rs.getInt("idpatient"));
                p.setAmount(rs.getDouble("amount"));
                p.setDate(rs.getString("date"));
                p.setPaymentMethod(rs.getString("payment_method"));
                p.setPhone(rs.getString("phone"));
                

                list.add(p);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println(ex);
        }

        return list;
    }

    public static boolean updatePayment(String idpayment, String pid, double amount, String date, String method, String phone) {
        boolean isSuccess = false;

        try {
            Connection con = DBConnect.getConnection(); 
            Statement stmt = con.createStatement();
            String sql = "UPDATE payment SET amount = '" + amount + "', date = '" + date + "', payment_method = '" + method + "', phone = '" + phone + "' WHERE idpayment = '" + idpayment + "'";
            
            int rs = stmt.executeUpdate(sql);
            
            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    public static boolean deletePayment(String id) {
        boolean isSuccess = false;
        int convertedID = Integer.parseInt(id);
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "DELETE FROM payment WHERE idpayment = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);
            int r = pstmt.executeUpdate();

            if (r > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in deletePayment: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
}
