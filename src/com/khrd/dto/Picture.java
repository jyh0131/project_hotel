package com.khrd.dto;

public class Picture {
	private int picNo; // 파일번호
	private String picFile; // 파일명
	private GType gType; // 갤러리 타입 테이블
	private int rcNo; // 객실분류 번호
	
	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture(int picNo, String picFile, GType gType, int rcNo) {
		super();
		this.picNo = picNo;
		this.picFile = picFile;
		this.gType = gType;
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

	public GType getgType() {
		return gType;
	}

	public void setgType(GType gType) {
		this.gType = gType;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	@Override
	public String toString() {
		return "Picture [picNo=" + picNo + ", picFile=" + picFile + ", gType=" + gType + ", rcNo=" + rcNo + "]";
	}

}// Picture
