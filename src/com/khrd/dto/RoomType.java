package com.khrd.dto;

public class RoomType {
	private String rtNo; // 객실 타입 번호
	private String rcNo; // 객실 분류 번호
	private String vtNo; // 전망 타입 번호
	private String btNo; // 침대 타입 번호   
	private String rsNo; // 객실 크기 번호

	public RoomType() {
		// TODO Auto-generated constructor stub
	}

	public RoomType(String rtNo, String rcNo, String vtNo, String btNo, String rsNo) {
		this.rtNo = rtNo;
		this.rcNo = rcNo;
		this.vtNo = vtNo;
		this.btNo = btNo;
		this.rsNo = rsNo;
	}

	public String getRtNo() {
		return rtNo;
	}

	public void setRtNo(String rtNo) {
		this.rtNo = rtNo;
	}

	public String getRcNo() {
		return rcNo;
	}

	public void setRcNo(String rcNo) {
		this.rcNo = rcNo;
	}

	public String getVtNo() {
		return vtNo;
	}

	public void setVtNo(String vtNo) {
		this.vtNo = vtNo;
	}

	public String getBtNo() {
		return btNo;
	}

	public void setBtNo(String btNo) {
		this.btNo = btNo;
	}

	public String getRsNo() {
		return rsNo;
	}

	public void setRsNo(String rsNo) {
		this.rsNo = rsNo;
	}

	@Override
	public String toString() {
		return "Room [rtNo=" + rtNo + ", rcNo=" + rcNo + ", vtNo=" + vtNo + ", btNo=" + btNo + ", rsNo=" + rsNo + "]";
	}

}// Room
