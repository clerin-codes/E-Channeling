package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBConnect;

public class orderDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;

	
	public static boolean addOrder(String pid, String phone, String name, String address, String mid) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO echanneling.order (idpatient, phone, name, address, idmedicine) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, pid);
            pstmt.setString(2, phone);
            pstmt.setString(3, name);
            pstmt.setString(4, address);
            pstmt.setString(5, mid);
            
            int rs = pstmt.executeUpdate();
            if(rs > 0) {
                isSuccess = true;
            }
        } catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Error in addOrder: " + e.getMessage());
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    


public static boolean UpdateOrder(String oid, String pid, String phone,String name,String address,String mid){
	
	
	boolean isSuccess = false;
	
	try {
		//DB connect part -------------------------------------------------------------------------------
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		//------------------------------------------------------------------------------------------------------
		
		String sql = "update echanneling.order set idpatient = '"+pid+"',phone = '"+phone+"', name= '"+name+"', address= '"+address+"', idmedicine  = '"+mid+"' where idorder = '"+oid+"'";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}else {
			isSuccess = false;			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}

public static boolean DeleteOrder(String id) {
	
	boolean isSuccess = false;
	int convertedID = Integer.parseInt(id);
	
	try {
		//DB connect part -------------------------------------------------------------------------------
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		
		String sql = "Delete from echanneling.order where idorder = '"+convertedID+"'"; 
		int r = stmt.executeUpdate(sql);
		
		if(r > 0) {
			isSuccess = true;
		}else {
			isSuccess = false;
					
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}

}

