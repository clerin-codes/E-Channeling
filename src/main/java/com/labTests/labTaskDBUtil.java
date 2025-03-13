package com.labTests;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBConnect;

public class labTaskDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;

	public static boolean addLabTest(String pid, String lid, String name, String phone) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = DBConnect.getConnection();
	        String sql = "INSERT INTO labtest (idpatient, idlabs, pname, phone, area) VALUES (?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, pid);
	        pstmt.setString(2, lid);
	        pstmt.setString(3, name);
	        pstmt.setString(4, phone);
	        pstmt.setString(5, "Unknown");  // Default area value, modify as needed

	        int rs = pstmt.executeUpdate();
	        if(rs > 0) {
	            isSuccess = true;
	        }
	    } catch(SQLException e) {
	        e.printStackTrace();
	        System.out.println("Error in addLabTest: " + e.getMessage());
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
	
public static boolean updateLabTest(String ltid, String pid,String lid,String name,String phone) {
		
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "update labtest set idpatient = '"+pid+"',idlabs = '"+lid+"', pname= '"+name+"', phone= '"+phone+"' where idlabtest = '"+ltid+"'";
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
	
public static boolean DeleteLabTest(String id) {
		
		boolean isSuccess = false;
		int convertedID = Integer.parseInt(id);
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "Delete from labtest where idlabtest = '"+convertedID+"'"; 
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
