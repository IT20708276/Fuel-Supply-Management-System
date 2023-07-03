package com.essentialservices;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;








public class EssentialServicesDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static List<EssentialServices> validate(String companyId, String password){
		
		ArrayList<EssentialServices> ess = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from essentialservices where companyId='"+companyId+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String cid = rs.getString(1);
				String cname = rs.getString(2);
				String fname = rs.getString(3);
				String lname = rs.getString(4);
				String sType  = rs.getString(5);
				String reason = rs.getString(6);
				String address = rs.getString(7); 
				String email = rs.getString(8);
				int fLimit = rs.getInt(9);
				String letter = rs.getString(10);
				String passU = rs.getString(11);
				
				EssentialServices e = new EssentialServices(cid,cname,fname,lname,sType,reason, address,  email,  fLimit,  letter,  password);
				ess.add(e);
				
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return ess;
	}
	
	 public static boolean insertcompany(String cId, String cName, String fName, String lName, String type, String reason, String address, String email,int limit,String letter,String password) {
	    	
	    	boolean isSuccess = false;
	    	
	    	
	    	try {
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		
	    	    String sql = "insert into essentialservices values ('"+cId+"','"+cName+"','"+fName+"','"+lName+"','"+type+"','"+reason+"','"+address+"','"+email+"','"+limit+"','"+letter+"','"+password+"')";
	    		int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
	    			isSuccess = true;
	    		} else {
	    			isSuccess = false;
	    		}	
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	 	
	    	return isSuccess;
	    }
	 
	 public static boolean updatecompany(String cid,String cname,String fname,String lname,String sType,String reason,String address,String  email, String fLimit, String letter, String password) {
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "update essentialservices set companyName='"+cname+"',managerFirstName='"+fname+"',managerLastName ='"+lname+"',serviceType ='"+sType+"',reason='"+reason+"',address ='"+address+"',email ='"+email+"',fuelLimit ='"+fLimit+"',municipalcounciLetterl ='"+letter+"',password ='"+password+"'"
	    				+ "where companyId='"+cid+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	 
	 public static List<EssentialServices> getCompanyDetails(String cid) {
	    	
	    	
	    	ArrayList<EssentialServices> ess = new ArrayList<>();
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "select * from EssentialServices where companyId='"+cid+"'";
	    		rs = stmt.executeQuery(sql);
	    		
	    		while(rs.next()) {
	    		

	    			String coid = rs.getString(1);
	    			String cname= rs.getString(2);
	    			String fname= rs.getString(3);
	    			String lname= rs.getString(4);
	    			String sType= rs.getString(5);
	    			String reason= rs.getString(6);
	    		    String address= rs.getString(7);
	    		    String email= rs.getString(8);
	    		    int fLimit= rs.getInt(9);
	    		    String letter= rs.getString(10);
	    		    String password = rs.getString(11);
	    			
	    			
	    		    EssentialServices e = new EssentialServices(coid,cname,fname,lname,sType,reason,address,email,fLimit,letter,password);
	    			ess.add(e);
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}	
	    	return ess;	
	    }
	 
	 public static boolean deleteCompany(String cid) {
	    	
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from essentialservices where companyId='"+cid+"'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if (r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
}
