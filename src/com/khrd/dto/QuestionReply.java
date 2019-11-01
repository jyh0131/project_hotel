package com.khrd.dto;

import java.sql.Timestamp;

public class QuestionReply {
	private int qrNo; // 답글번호
	private String qrContent; // 답글내용
	private Timestamp qrDate; // 답글날짜
	private QuestionBoard qbNo; // 문의번호
	
	public QuestionReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuestionReply(int qrNo, String qrContent, Timestamp qrDate, QuestionBoard qbNo) {
		super();
		this.qrNo = qrNo;
		this.qrContent = qrContent;
		this.qrDate = qrDate;
		this.qbNo = qbNo;
	}

	public int getQrNo() {
		return qrNo;
	}

	public void setQrNo(int qrNo) {
		this.qrNo = qrNo;
	}

	public String getQrContent() {
		return qrContent;
	}

	public void setQrContent(String qrContent) {
		this.qrContent = qrContent;
	}

	public Timestamp getQrDate() {
		return qrDate;
	}

	public void setQrDate(Timestamp qrDate) {
		this.qrDate = qrDate;
	}

	public QuestionBoard getQbNo() {
		return qbNo;
	}

	public void setQbNo(QuestionBoard qbNo) {
		this.qbNo = qbNo;
	}

	@Override
	public String toString() {
		return "QuestionReply [qrNo=" + qrNo + ", qrContent=" + qrContent + ", qrDate=" + qrDate + ", qbNo=" + qbNo
				+ "]";
	}
}
