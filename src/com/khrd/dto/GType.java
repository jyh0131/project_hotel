package com.khrd.dto;

public class GType {
	private int gNo;
	private String gName;
	private String gPath;
	
	public GType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GType(int gNo, String gName, String gPath) {
		super();
		this.gNo = gNo;
		this.gName = gName;
		this.gPath = gPath;
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

	public String getgPath() {
		return gPath;
	}

	public void setgPath(String gPath) {
		this.gPath = gPath;
	}

	@Override
	public String toString() {
		return "GType [gNo=" + gNo + ", gName=" + gName + ", gPath=" + gPath + "]";
	}

}
