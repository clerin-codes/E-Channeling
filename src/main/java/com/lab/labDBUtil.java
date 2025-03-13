package com.lab;

import java.sql.Connection;
import java.sql.Statement;

import database.DBConnect;

public class labDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	
public static boolean addLab(String name, String area){
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "insert into labs values(0,'"+name+"','"+area+"') ";
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
