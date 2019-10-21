package com.khrd.dto;

public class Picture {
	private int picNo; // 파일번호
	private String picFile; // 파일명
	private int gNo; // 분류번호
	private int rtNo; // 객실타입 번호

	public Picture() {
		// TODO Auto-generated constructor stub
	}

	public Picture(int picNo, String picFile, int gNo, int rtNo) {
		this.picNo = picNo;
		this.picFile = picFile;
		this.gNo = gNo;
		this.rtNo = rtNo;
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

	public int getRtNo() {
		return rtNo;
	}

	public void setRtNo(int rtNo) {
		this.rtNo = rtNo;
	}

	@Override
	public String toString() {
		return "Picture [picNo=" + picNo + ", picFile=" + picFile + ", gNo=" + gNo + ", rtNo=" + rtNo + "]";
	}

}// Picture
