package com.khrd.dto;

public class RoomCategory {
	private int rcNo; // 객실 분류 번호
	private String rcName; // 객실 분류명(한글)
	private String rcEngName; // 객실 분류명(영어)
	
	public RoomCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomCategory(int rcNo, String rcName, String rcEngName) {
		super();
		this.rcNo = rcNo;
		this.rcName = rcName;
		this.rcEngName = rcEngName;
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

	public String getRcEngName() {
		return rcEngName;
	}

	public void setRcEngName(String rcEngName) {
		this.rcEngName = rcEngName;
	}

	@Override
	public String toString() {
		return "RoomCategory [rcNo=" + rcNo + ", rcName=" + rcName + ", rcEngName=" + rcEngName + "]";
	}

}
