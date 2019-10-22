package com.khrd.dto;

public class Room {
	private int roomNo; // 객실 호수
	private int roomPrice; // 객실 가격
	private int rcNo; // 객실 분류 번호
	private int vtNo; // 전망 타입 번호
	private int btNo; // 침대 타입 번호
	private int rsNo; // 객실 크기 번호
	private int picNo; // 파일 번호
	
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Room(int roomNo, int roomPrice, int rcNo, int vtNo, int btNo, int rsNo, int picNo) {
		super();
		this.roomNo = roomNo;
		this.roomPrice = roomPrice;
		this.rcNo = rcNo;
		this.vtNo = vtNo;
		this.btNo = btNo;
		this.rsNo = rsNo;
		this.picNo = picNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	public int getVtNo() {
		return vtNo;
	}

	public void setVtNo(int vtNo) {
		this.vtNo = vtNo;
	}

	public int getBtNo() {
		return btNo;
	}

	public void setBtNo(int btNo) {
		this.btNo = btNo;
	}

	public int getRsNo() {
		return rsNo;
	}

	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}

	public int getPicNo() {
		return picNo;
	}

	public void setPicNo(int picNo) {
		this.picNo = picNo;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomPrice=" + roomPrice + ", rcNo=" + rcNo + ", vtNo=" + vtNo + ", btNo="
				+ btNo + ", rsNo=" + rsNo + ", picNo=" + picNo + "]";
	}
	
}// Room
