package com.itp.service;

import java.util.logging.Logger;

import java.util.ArrayList;

import com.itp.model.Staff;

public interface StaffInterface {

	public static final Logger log = Logger.getLogger(StaffInterface.class.getName());


	public void AddStaff(Staff s1);

	
	public Staff getStaffByID(String StaffID);
	
	
	public ArrayList<Staff> getStaffs();
	
	
	public Staff UpdateStaff(String StaffID, Staff s1);

	
	public void RemoveStaff(String StaffID);
}
