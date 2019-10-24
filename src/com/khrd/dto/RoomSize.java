package com.khrd.dto;

public class RoomSize {
	private int rsNo; // 객실 크기 번호
	private int rsName; // 객실 크기명

	public RoomSize() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RoomSize(int rsNo, int rsName) {
		super();
		this.rsNo = rsNo;
		this.rsName = rsName;
	}
	
	public int getRsNo() {
		return rsNo;
	}
	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}
	public int getRsName() {
		return rsName;
	}
	public void setRsName(int rsName) {
		this.rsName = rsName;
	}
	
	@Override
	public String toString() {
		return "RoomSize [rsNo=" + rsNo + ", rsName=" + rsName + "]";
	}
	
}//RoomSize
