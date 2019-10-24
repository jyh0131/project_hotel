package com.khrd.dto;

public class BedType {
	private int btNo; // 침대 타입 번호
	private String btName; // 침대 타입명
	
	public BedType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BedType(int btNo, String btName) {
		super();
		this.btNo = btNo;
		this.btName = btName;
	}

	public int getBtNo() {
		return btNo;
	}

	public void setBtNo(int btNo) {
		this.btNo = btNo;
	}

	public String getBtName() {
		return btName;
	}

	public void setBtName(String btName) {
		this.btName = btName;
	}

	@Override
	public String toString() {
		return "BedType [btNo=" + btNo + ", btName=" + btName + "]";
	}
} // BedType
