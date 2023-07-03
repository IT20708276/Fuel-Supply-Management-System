package com.itp.service;

import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;

import com.itp.connection.CommonConstants;
import com.itp.connection.CommonUtil;
import com.itp.connection.DBConnectionUtil;
import com.itp.connection.QueryUtil;
import com.itp.model.Staff;

public class StaffInterfaceImpl implements StaffInterface{

	public static final Logger log = Logger.getLogger(StaffInterface.class.getName());

	private static Connection connection;

	private static Statement statement;

	
	/*static{
		//create table or drop if exist
		createStaffTable();
	}*/
	
	

	private PreparedStatement preparedStatement;

	
	public static void createStaffTable() {

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_DROP_TABLE));
			
			statement.executeUpdate(QueryUtil.queryByID(CommonConstants.QUERY_ID_CREATE_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		}
	}

	
	@Override
	public void AddStaff(Staff s1) {
		// TODO Auto-generated method stub
		String StaffID = CommonUtil.generateIDs(getStaffIDs());
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_STAFFS));
			connection.setAutoCommit(false);
			
			//Generate staff IDs
			s1.setStaffID(StaffID);
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, s1.getStaffID());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, s1.getFirstName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, s1.getLastName());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_FOUR, s1.getAge());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, s1.getAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, s1.getEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, s1.getAccNo());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_EIGHT, s1.getJoinedYear());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, s1.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, s1.getStaffType());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_ELEVEN, s1.getContactYears());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_TWELVE, s1.getBasicSalary());
			preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_THIRTEEN, s1.getOt());
			
			// Add staff
			preparedStatement.execute();
			
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
			e.printStackTrace();
		} finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		
	}

	@Override
	public Staff getStaffByID(String StaffID) {
		// TODO Auto-generated method stub
		return actionOnStaff(StaffID).get(0);
	}

	@Override
	public ArrayList<Staff> getStaffs() {
		// TODO Auto-generated method stub
		return actionOnStaff(null);
	}

	@Override
	public Staff UpdateStaff(String StaffID, Staff s1) {
		// TODO Auto-generated method stub
		if (StaffID != null && !StaffID.isEmpty()) {
			
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_STAFF));
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, s1.getFirstName());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, s1.getLastName());
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_THREE, s1.getAge());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, s1.getAddress());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, s1.getEmail());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, s1.getAccNo());
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SEVEN, s1.getJoinedYear());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, s1.getPassword());
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, s1.getStaffType());
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_TEN, s1.getContactYears());
				preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_ELEVEN, s1.getBasicSalary());
				preparedStatement.setDouble(CommonConstants.COLUMN_INDEX_TWELVE, s1.getOt());
				
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_THIRTEEN, s1.getStaffID());
				
				preparedStatement.executeUpdate();

			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		// Get the updated employee
		return getStaffByID(StaffID);
	}

	@Override
	public void RemoveStaff(String StaffID) {
		// TODO Auto-generated method stub
		if (StaffID != null && !StaffID.isEmpty()) {
			
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_REMOVE_STAFF));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, StaffID);
				preparedStatement.executeUpdate();
			} catch (SQLException | SAXException | IOException | ParserConfigurationException
					| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			} finally {
				
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
	}
	
	private ArrayList<Staff> actionOnStaff(String StaffID) {

		ArrayList<Staff> StaffList = new ArrayList<Staff>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if (StaffID != null && !StaffID.isEmpty()) {
				
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_STAFF));
				preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, StaffID);
			}
			
			else {
				preparedStatement = connection
						.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_STAFFS));
			}
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Staff s1 = new Staff();
				
				s1.setStaffID(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				s1.setFirstName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				s1.setLastName(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				s1.setAge(resultSet.getInt(CommonConstants.COLUMN_INDEX_FOUR));
				s1.setAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				s1.setEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				s1.setAccNo(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				s1.setJoinedYear(resultSet.getInt(CommonConstants.COLUMN_INDEX_EIGHT));
				s1.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				s1.setStaffType(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				s1.setContactYears(resultSet.getInt(CommonConstants.COLUMN_INDEX_ELEVEN));
				s1.setBasicSalary(resultSet.getDouble(CommonConstants.COLUMN_INDEX_TWELVE));
				s1.setOt(resultSet.getDouble(CommonConstants.COLUMN_INDEX_THIRTEEN));
				StaffList.add(s1);
			}

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return StaffList;
	}

	private ArrayList<String> getStaffIDs(){
		
		ArrayList<String> arrayList = new ArrayList<String>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection
					.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_STAFF_IDS));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException
				| ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}

}
