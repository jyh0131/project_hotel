package com.khrd.dto;

import java.util.Date;

public class Reservation {
	private int rNo; // 예약 번호
	private Member member; // 회원 번호
	private Room room; // 방 호수
	private Date rIn; // 체크인 날짜
	private Date rOut; // 체크아웃 날짜
	private int rTotalPrice; // 최종금액
	private String rRequest; // 요청사항
	private int rPersonnel; // 투숙인원
	private Date rPayDate; // 결제날짜
	private int opNo; // 옵션번호
	private String rState; // 예약상태

	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(int rNo, Member member, Room room, Date rIn, Date rOut, int rTotalPrice, String rRequest,
			int rPersonnel, Date rPayDate, int opNo, String rState) {
		this.rNo = rNo;
		this.member = member;
		this.room = room;
		this.rIn = rIn;
		this.rOut = rOut;
		this.rTotalPrice = rTotalPrice;
		this.rRequest = rRequest;
		this.rPersonnel = rPersonnel;
		this.rPayDate = rPayDate;
		this.opNo = opNo;
		this.rState = rState;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Date getrIn() {
		return rIn;
	}

	public void setrIn(Date rIn) {
		this.rIn = rIn;
	}

	public Date getrOut() {
		return rOut;
	}

	public void setrOut(Date rOut) {
		this.rOut = rOut;
	}

	public int getrTotalPrice() {
		return rTotalPrice;
	}

	public void setrTotalPrice(int rTotalPrice) {
		this.rTotalPrice = rTotalPrice;
	}

	public String getrRequest() {
		return rRequest;
	}

	public void setrRequest(String rRequest) {
		this.rRequest = rRequest;
	}

	public int getrPersonnel() {
		return rPersonnel;
	}

	public void setrPersonnel(int rPersonnel) {
		this.rPersonnel = rPersonnel;
	}

	public Date getrPayDate() {
		return rPayDate;
	}

	public void setrPayDate(Date rPayDate) {
		this.rPayDate = rPayDate;
	}

	public int getOpNo() {
		return opNo;
	}

	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}

	public String getrState() {
		return rState;
	}

	public void setrState(String rState) {
		this.rState = rState;
	}

	@Override
	public String toString() {
		return "Reservation [rNo=" + rNo + ", member=" + member + ", room=" + room + ", rIn=" + rIn + ", rOut=" + rOut
				+ ", rTotalPrice=" + rTotalPrice + ", rRequest=" + rRequest + ", rPersonnel=" + rPersonnel
				+ ", rPayDate=" + rPayDate + ", opNo=" + opNo + ", rState=" + rState + "]";
	}

}// Reservation
