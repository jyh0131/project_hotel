package com.khrd.dto;

public class ViewType {
	private int vtNo; // 전망 타입번호
	private String vtName; // 전망 타입명
	
	public ViewType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ViewType(int vtNo, String vtName) {
		super();
		this.vtNo = vtNo;
		this.vtName = vtName;
	}

	public int getVtNo() {
		return vtNo;
	}

	public void setVtNo(int vtNo) {
		this.vtNo = vtNo;
	}

	public String getVtName() {
		return vtName;
	}

	public void setVtName(String vtName) {
		this.vtName = vtName;
	}

	@Override
	public String toString() {
		return "ViewType [vtNo=" + vtNo + ", vtName=" + vtName + "]";
	}
	
} // ViewType
