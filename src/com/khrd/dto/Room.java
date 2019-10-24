package com.khrd.dto;

public class Room {
	private int roomNo; // 객실 호수
	private int roomPrice; // 객실 가격
	private RoomCategory roomCategory; // 객실 분류
	private ViewType viewType; // 전망 타입
	private BedType bedType; // 침대 타입
	private RoomSize roomSize; // 객실 크기
	
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Room(int roomNo, int roomPrice, RoomCategory roomCategory, ViewType viewType, BedType bedType,
			RoomSize roomSize) {
		super();
		this.roomNo = roomNo;
		this.roomPrice = roomPrice;
		this.roomCategory = roomCategory;
		this.viewType = viewType;
		this.bedType = bedType;
		this.roomSize = roomSize;
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

	public RoomCategory getRoomCategory() {
		return roomCategory;
	}

	public void setRoomCategory(RoomCategory roomCategory) {
		this.roomCategory = roomCategory;
	}

	public ViewType getViewType() {
		return viewType;
	}

	public void setViewType(ViewType viewType) {
		this.viewType = viewType;
	}

	public BedType getBedType() {
		return bedType;
	}

	public void setBedType(BedType bedType) {
		this.bedType = bedType;
	}

	public RoomSize getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(RoomSize roomSize) {
		this.roomSize = roomSize;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomPrice=" + roomPrice + ", roomCategory=" + roomCategory + ", viewType="
				+ viewType + ", bedType=" + bedType + ", roomSize=" + roomSize + "]";
	}

}// Room
