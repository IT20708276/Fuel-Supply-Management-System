


package com.user;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDbUtil {

	public static List<User> validate(String UserName,String password)	{
		
		ArrayList<User> us= new ArrayList<>();
		
		//create database connection
		
		String url= "jdbc:mysql://localhost:3306/fuelsupplymanagement";
		String user="root";
		String psswd="1234";
		
		//validate
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con =DriverManager.getConnection(url, user, psswd);
			Statement stmt=con.createStatement();
			String sql = "select * from user where NIC='"+UserName+"' and password='"+password+"'";
			ResultSet rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				String id=rs.getString(1);
				String fname=rs.getString(2);
				String lname=rs.getString(3);
				String pswd=rs.getString(4);
				String nic=rs.getString(5);
				String otp=rs.getString(6);
				String email=rs.getString(7);
				String address=rs.getString(8);
		
				User u=new User(id,fname,lname,pswd,nic,otp,email,address);
				us.add(u);
			}
			else {
				us=null;
			}
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		return us;
	}
	
	public static boolean insertUser(String nic,String fname,String lname,String password,String otp,String email,String address) {
		boolean isSuccess=false;
		
		//create database connection
		String url= "jdbc:mysql://localhost:3306/fuelsupplymanagement";
		String user="root";
		String psswd="1234";
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con =DriverManager.getConnection(url, user, psswd);
			Statement stmt=con.createStatement();
			String sql = "insert into user values ('U005','"+fname+"','"+lname+"','"+password+"','"+nic+"','"+otp+"','"+email+"','"+address+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
				
			}
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		return isSuccess;
	}
	
	
	public static boolean updateUser(String nic,String pswd,String fname,String lname,String address) {
		
		boolean isSuccess=false;
		
		String url= "jdbc:mysql://localhost:3306/fuelsupplymanagement";
		String user="root";
		String psswd="1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url, user, psswd);
			Statement stmt=con.createStatement();
			
			String sql="update user set firstaName='"+fname+"',lastName='"+lname+"',password='"+pswd+"',address='"+address+"' where NIC='"+nic+"'";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				isSuccess=true;
			}else {
				
				isSuccess=false;
			}
			
			
		}catch(Exception e) {
			
			e.printStackTrace();	
		}
		
		
		
		return isSuccess;
	}
	public static boolean deleteUser(String nic) {
		
		boolean isSuccess=false;
		
		String url= "jdbc:mysql://localhost:3306/fuelsupplymanagement";
		String user="root";
		String psswd="1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection(url, user, psswd);
			Statement stmt=con.createStatement();
			
			String sql="delete from user where NIC='"+nic+"'";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				isSuccess=true;
			}else {
				
				isSuccess=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	
}
