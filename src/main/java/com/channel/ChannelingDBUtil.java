package com.channel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.DBConnect;

public class ChannelingDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	boolean isSuccess = false;
	

	
	public static boolean addAppoinment(String did, String pid, String date, String name, String age) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        con = DBConnect.getConnection();
	        String sql = "INSERT INTO channel (iddoctor, idpatient, date, name, age) VALUES (?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, did);
	        pstmt.setString(2, pid);
	        pstmt.setString(3, date);
	        pstmt.setString(4, name);
	        pstmt.setString(5, age);
	        
	        int rs = pstmt.executeUpdate();
	        if(rs > 0) {
	            isSuccess = true;
	        }
	    } catch(SQLException e) {
	        e.printStackTrace();
	        System.out.println("Error in addAppoinment: " + e.getMessage());
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
	public static List<Channel> getAppointmentById(String pid){
		List<Channel> list=new ArrayList<Channel>();
		System.out.println("Call getAppoinment methode");
		try{
			Connection con=DBConnect.getConnection();
			
			PreparedStatement ps=con.prepareStatement("select * from channel where idpatient='"+ pid +"'");
			ResultSet rs=ps.executeQuery();

			
			while(rs.next()){
				Channel c = new Channel();
				c.setCid(rs.getInt("idchannel"));
				c.setDid(rs.getInt("iddoctor"));
				c.setPid(rs.getInt("idpatient"));
				c.setName(rs.getString("name"));
				c.setDate(rs.getString("date"));
				c.setAge(rs.getString("age"));
				System.out.println(rs.getInt("iddoctor"));
				
				PreparedStatement ps2 = con.prepareStatement("select * from doctor where iddoctor='"+ rs.getInt("iddoctor") +"'");
				ResultSet rs2 = ps2.executeQuery();
				
				while(rs2.next()){
					c.setDname(rs2.getString("dname"));
					c.setDtype(rs2.getString("type"));
					System.out.println(rs2.getString("dname"));
				}

				list.add(c);
				
			}
			con.close();
		}catch(Exception ex){ex.printStackTrace();System.out.println(ex);}
			
		return list;
	}
	
	public static boolean updateChannel(String cid,String pid,String name,String age,String did,String date) {
		
		
		boolean isSuccess = false;
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			//------------------------------------------------------------------------------------------------------
			
			String sql = "update channel set iddoctor = '"+did+"', idpatient = '"+pid+"', date = '"+date+"', name = '"+name+"', age = '"+age+"'where idchannel = '"+cid+"'";
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
	
public static boolean deleteAppoinment(String id) {
		
		boolean isSuccess = false;
		int convertedID = Integer.parseInt(id);
		
		try {
			//DB connect part -------------------------------------------------------------------------------
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "Delete from channel where idchannel = '"+convertedID+"'"; 
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
