package com.khrd.dto;

import java.util.Date;

public class Notice {
	private int ntNo; // 공지번호
	private String ntTitle; //공지제목
	private String ntContent; //공지내용
	private Date ntRegdate; //공지작성일
	private Date ntModdate; //공지수정일
	private String ntFile; //첨부파일
	private Member member; //쓴사람 번호

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int ntNo, String ntTitle, String ntContent, Date ntRegdate, Date ntModdate, String ntFile,
			Member member) {
		this.ntNo = ntNo;
		this.ntTitle = ntTitle;
		this.ntContent = ntContent;
		this.ntRegdate = ntRegdate;
		this.ntModdate = ntModdate;
		this.ntFile = ntFile;
		this.member = member;
	}

	public int getNtNo() {
		return ntNo;
	}

	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}

	public String getNtTitle() {
		return ntTitle;
	}

	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}

	public String getNtContent() {
		return ntContent;
	}

	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}

	public Date getNtRegdate() {
		return ntRegdate;
	}

	public void setNtRegdate(Date ntRegdate) {
		this.ntRegdate = ntRegdate;
	}

	public Date getNtModdate() {
		return ntModdate;
	}

	public void setNtModdate(Date ntModdate) {
		this.ntModdate = ntModdate;
	}

	public String getNtFile() {
		return ntFile;
	}

	public void setNtFile(String ntFile) {
		this.ntFile = ntFile;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Notice [ntNo=" + ntNo + ", ntTitle=" + ntTitle + ", ntContent=" + ntContent + ", ntRegdate=" + ntRegdate
				+ ", ntModdate=" + ntModdate + ", ntFile=" + ntFile + ", member=" + member + "]";
	}

}// Notice
