package com.medicine;

import java.sql.Connection;
import java.sql.Statement;

import database.DBConnect;

public class medicineDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	
public static boolean addMedicine(String name, String price){
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "insert into medicine values(0,'"+name+"','"+price+"') ";
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
}
