package com.khrd.dto;

import java.sql.Timestamp;

public class QuestionBoard {
	private int qbNo; // 문의번호
	private String qbTitle; // 제목 
	private String qbName; // 성명
	private String qbEmail; // 이메일
	private String qbCategory; // 문의분류
	private String qbPhone; // 휴대전화
	private String qbTel; // 자택전화
	private Timestamp qbDate; // 문의날짜
	private String qbPath; // 첨부파일경로
	private Member member; // 회원번호 가져오기 위해
	private String qcContent; // 문의내용
	
	public QuestionBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuestionBoard(int qbNo, String qbTitle, String qbName, String qbEmail, String qbCategory, String qbPhone,
			String qbTel, Timestamp qbDate, String qbPath, Member member, String qcContent) {
		super();
		this.qbNo = qbNo;
		this.qbTitle = qbTitle;
		this.qbName = qbName;
		this.qbEmail = qbEmail;
		this.qbCategory = qbCategory;
		this.qbPhone = qbPhone;
		this.qbTel = qbTel;
		this.qbDate = qbDate;
		this.qbPath = qbPath;
		this.member = member;
		this.qcContent = qcContent;
	}

	public int getQbNo() {
		return qbNo;
	}

	public void setQbNo(int qbNo) {
		this.qbNo = qbNo;
	}

	public String getQbTitle() {
		return qbTitle;
	}

	public void setQbTitle(String qbTitle) {
		this.qbTitle = qbTitle;
	}

	public String getQbName() {
		return qbName;
	}

	public void setQbName(String qbName) {
		this.qbName = qbName;
	}

	public String getQbEmail() {
		return qbEmail;
	}

	public void setQbEmail(String qbEmail) {
		this.qbEmail = qbEmail;
	}

	public String getQbCategory() {
		return qbCategory;
	}

	public void setQbCategory(String qbCategory) {
		this.qbCategory = qbCategory;
	}

	public String getQbPhone() {
		return qbPhone;
	}

	public void setQbPhone(String qbPhone) {
		this.qbPhone = qbPhone;
	}

	public String getQbTel() {
		return qbTel;
	}

	public void setQbTel(String qbTel) {
		this.qbTel = qbTel;
	}

	public Timestamp getQbDate() {
		return qbDate;
	}

	public void setQbDate(Timestamp qbDate) {
		this.qbDate = qbDate;
	}

	public String getQbPath() {
		return qbPath;
	}

	public void setQbPath(String qbPath) {
		this.qbPath = qbPath;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	@Override
	public String toString() {
		return "QuestionBoard [qbNo=" + qbNo + ", qbTitle=" + qbTitle + ", qbName=" + qbName + ", qbEmail=" + qbEmail
				+ ", qbCategory=" + qbCategory + ", qbPhone=" + qbPhone + ", qbTel=" + qbTel + ", qbDate=" + qbDate
				+ ", qbPath=" + qbPath + ", member=" + member + ", qcContent=" + qcContent + "]";
	}

}
