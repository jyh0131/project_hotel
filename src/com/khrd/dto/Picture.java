package com.khrd.dto;

public class Picture {
	private String picFile; // 파일명
	private GType gType; // 갤러리 타입
	private RoomCategory roomCategory; // 객실분류 타입
	private int picCategory; // 파일 구분
	
	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture(String picFile, GType gType, RoomCategory roomCategory, int picCategory) {
		super();
		this.picFile = picFile;
		this.gType = gType;
		this.roomCategory = roomCategory;
		this.picCategory = picCategory;
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

	public int getPicCategory() {
		return picCategory;
	}

	public void setPicCategory(int picCategory) {
		this.picCategory = picCategory;
	}

	@Override
	public String toString() {
		return "Picture [picFile=" + picFile + ", gType=" + gType + ", roomCategory=" + roomCategory + ", picCategory="
				+ picCategory + "]";
	}

}// Picture
