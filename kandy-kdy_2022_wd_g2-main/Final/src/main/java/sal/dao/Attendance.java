package sal.dao;

public class Attendance {
	private String id;
	private int totalOT;
	private int totalLeave;
	private String month;
	private int totlDaysWorked;

	public Attendance(String id, int totalOT, int totalLeave, String month, int totlDaysWorked) {
		super();
		this.id = id;
		this.totalOT = totalOT;
		this.totalLeave = totalLeave;
		this.month = month;
		this.totlDaysWorked = totlDaysWorked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTotalOT() {
		return totalOT;
	}

	public void setTotalOT(int totalOT) {
		this.totalOT = totalOT;
	}

	public int getTotalLeave() {
		return totalLeave;
	}

	public void setTotalLeave(int totalLeave) {
		this.totalLeave = totalLeave;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getTotlDaysWorked() {
		return totlDaysWorked;
	}

	public void setTotlDaysWorked(int totlDaysWorked) {
		this.totlDaysWorked = totlDaysWorked;
	}

}
