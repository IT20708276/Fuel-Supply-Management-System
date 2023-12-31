package com.itp.connection;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.itp.service.StaffInterface;

public class CommonUtil {

	public static final Logger log = Logger.getLogger(StaffInterface.class.getName());

	public static final Properties properties = new Properties();

	static {
		try {
			
			// Read the property only once when load the class
			properties.load(QueryUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));
			
		} catch (IOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	public static String generateIDs(ArrayList<String> arrayList) {

		String id;
		int next = arrayList.size();
		next++;
		id = CommonConstants.STAFF_ID_PREFIX + next;
		System.out.println("Staff ID : "+ id);
		if (arrayList.contains(id)) {
			//next = next+2;
			next++;
			id = CommonConstants.STAFF_ID_PREFIX + next;
		}
		return id;
	}
}
