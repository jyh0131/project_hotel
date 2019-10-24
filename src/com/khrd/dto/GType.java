package com.khrd.dto;

public class GType {
	private int gNo;
	private String gName;
	
	public GType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GType(int gNo, String gName) {
		super();
		this.gNo = gNo;
		this.gName = gName;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	@Override
	public String toString() {
		return "GType [gNo=" + gNo + ", gName=" + gName + "]";
	}
	
}
