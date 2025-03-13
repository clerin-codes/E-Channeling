package com.doctor;

import java.sql.Connection;
import java.sql.Statement;
import database.DBConnect;
public class doctorDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	
	public static boolean addDoctor(String dname, String type,String area){
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "insert into doctor values(0,'"+dname+"','"+type+"','"+area+"') ";
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
