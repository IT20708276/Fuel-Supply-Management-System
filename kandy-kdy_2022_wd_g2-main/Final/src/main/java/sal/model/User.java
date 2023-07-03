package sal.model;

public class User {
	private int id;
	private String date;
	private String amount;
	private String reason;
	private String staffid;
	private String finalsalary;
	
	
	
	public User(int id, String date, String amount, String reason, String finalsalary) {
		super();
		this.id = id;
		this.date = date;
		this.amount = amount;
		this.reason = reason;
		this.finalsalary=finalsalary;
		
	}
	
	
	public User(String date, String amount, String reason, String staffid, String finalsalary) {
		super();
		this.date = date;
		this.amount = amount;
		this.reason = reason;
		this.staffid=staffid;
		this.finalsalary=finalsalary;
		

		
	}



	public String getFinalsalary() {
		return finalsalary;
	}


	public void setFinalsalary(String finalsalary) {
		this.finalsalary = finalsalary;
	}


	public String getStaffid() {
		return staffid;
	}


	public void setStaffid(String staffid) {
		this.staffid = staffid;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
