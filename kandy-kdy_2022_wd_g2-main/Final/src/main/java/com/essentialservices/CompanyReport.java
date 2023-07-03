package com.essentialservices;

public class CompanyReport{
	
	private int numFCount;
	private float limit;
	
	public CompanyReport(int numFCount, float limit) {
		
		this.numFCount = numFCount;
		this.limit = limit;
	}

	public int getNumFCount() {
		return numFCount;
	}

	public void setNumFCount(int numFCount) {
		this.numFCount = numFCount;
	}

	public float getLimit() {
		return limit;
	}

	public void setLimit(float limit) {
		this.limit = limit;
	}

}
