package com.khrd.dto;

public class RoomCategory {
	private int rcNo;
	private String rcName;
	
	public RoomCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomCategory(int rcNo, String rcName) {
		super();
		this.rcNo = rcNo;
		this.rcName = rcName;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	public String getRcName() {
		return rcName;
	}

	public void setRcName(String rcName) {
		this.rcName = rcName;
	}

	@Override
	public String toString() {
		return "RoomCategory [rcNo=" + rcNo + ", rcName=" + rcName + "]";
	}
	
	
}
