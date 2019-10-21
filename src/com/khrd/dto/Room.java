package com.khrd.dto;

public class Room {
	private int roomNo; // 방 호수
	private int roomPrice; // 방 가격
	private RoomType roomType; // 객실 타입

	public Room() {
		// TODO Auto-generated constructor stub
	}

	public Room(int roomNo, int roomPrice, RoomType roomType) {
		this.roomNo = roomNo;
		this.roomPrice = roomPrice;
		this.roomType = roomType;
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

	public RoomType getRoomType() {
		return roomType;
	}

	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomPrice=" + roomPrice + ", roomType=" + roomType + "]";
	}

}// Room
