package com.khrd.dto;

public class Picture {
	private int picNo; // 파일번호
	private String picFile; // 파일명
	private int gNo; // 분류번호
	private int rcNo; // 객실분류 번호
	
	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture(int picNo, String picFile, int gNo, int rcNo) {
		super();
		this.picNo = picNo;
		this.picFile = picFile;
		this.gNo = gNo;
		this.rcNo = rcNo;
	}

	public int getPicNo() {
		return picNo;
	}

	public void setPicNo(int picNo) {
		this.picNo = picNo;
	}

	public String getPicFile() {
		return picFile;
	}

	public void setPicFile(String picFile) {
		this.picFile = picFile;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	@Override
	public String toString() {
		return "Picture [picNo=" + picNo + ", picFile=" + picFile + ", gNo=" + gNo + ", rcNo=" + rcNo + "]";
	}

}// Picture
