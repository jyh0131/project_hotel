package com.khrd.dto;

public class Picture {
	private int picNo; // 파일번호
	private String picFile; // 파일명
	private GType gType; // 갤러리 타입
	private RoomCategory roomCategory; // 객실분류 번호
	
	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture(int picNo, String picFile, GType gType, RoomCategory roomCategory) {
		super();
		this.picNo = picNo;
		this.picFile = picFile;
		this.gType = gType;
		this.roomCategory = roomCategory;
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

	public RoomCategory getRoomCategory() {
		return roomCategory;
	}

	public void setRoomCategory(RoomCategory roomCategory) {
		this.roomCategory = roomCategory;
	}

	@Override
	public String toString() {
		return "Picture [picNo=" + picNo + ", picFile=" + picFile + ", gType=" + gType + ", roomCategory="
				+ roomCategory + "]";
	}

}// Picture
