package dead.model;

public class User {
	
	
	private int gid;
	private String fueltype;
	private String cstock;
	private String refamount;
	
	
	
	
	
	
	
	public User(int gid, String fueltype, String cstock, String refamount) {
		super();
		this.gid = gid;
		this.fueltype = fueltype;
		this.cstock = cstock;
		this.refamount = refamount;
	}
	
	
	
	
	public User(String fueltype, String cstock, String refamount) {
		super();
		this.fueltype = fueltype;
		this.cstock = cstock;
		this.refamount = refamount;
	}




	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getFueltype() {
		return fueltype;
	}
	public void setFueltype(String fueltype) {
		this.fueltype = fueltype;
	}
	public String getCstock() {
		return cstock;
	}
	public void setCstock(String cstock) {
		this.cstock = cstock;
	}
	public String getRefamount() {
		return refamount;
	}
	public void setRefamount(String refamount) {
		this.refamount = refamount;
	}

	
	
}
