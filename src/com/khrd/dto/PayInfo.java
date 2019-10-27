package com.khrd.dto;

public class PayInfo {
	private int pNo; // 결제번호
	private String pCardType; // 카드종류
	private String pCardNum; // 카드번호
	private String pValidMonth; // 유효기간(달)
	private String pValidYear; // 유효기간(월)
	private String pBankName; // 환불은행명
	private String pBankNo; // 환불계좌번호
	private String pBankSername; // 환불예금주
	private Reservation rsv; // 예약번호
	private Member mem; // 회원번호

	public PayInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayInfo(int pNo, String pCardType, String pCardNum, String pValidMonth, String pValidYear, String pBankName,
			String pBankNo, String pBankSername, Reservation rsv, Member mem) {
		super();
		this.pNo = pNo;
		this.pCardType = pCardType;
		this.pCardNum = pCardNum;
		this.pValidMonth = pValidMonth;
		this.pValidYear = pValidYear;
		this.pBankName = pBankName;
		this.pBankNo = pBankNo;
		this.pBankSername = pBankSername;
		this.rsv = rsv;
		this.mem = mem;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpCardType() {
		return pCardType;
	}

	public void setpCardType(String pCardType) {
		this.pCardType = pCardType;
	}

	public String getpCardNum() {
		return pCardNum;
	}

	public void setpCardNum(String pCardNum) {
		this.pCardNum = pCardNum;
	}

	public String getpValidMonth() {
		return pValidMonth;
	}

	public void setpValidMonth(String pValidMonth) {
		this.pValidMonth = pValidMonth;
	}

	public String getpValidYear() {
		return pValidYear;
	}

	public void setpValidYear(String pValidYear) {
		this.pValidYear = pValidYear;
	}

	public String getpBankName() {
		return pBankName;
	}

	public void setpBankName(String pBankName) {
		this.pBankName = pBankName;
	}

	public String getpBankNo() {
		return pBankNo;
	}

	public void setpBankNo(String pBankNo) {
		this.pBankNo = pBankNo;
	}

	public String getpBankSername() {
		return pBankSername;
	}

	public void setpBankSername(String pBankSername) {
		this.pBankSername = pBankSername;
	}

	public Reservation getRsv() {
		return rsv;
	}

	public void setRsv(Reservation rsv) {
		this.rsv = rsv;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	@Override
	public String toString() {
		return "PayInfo [pNo=" + pNo + ", pCardType=" + pCardType + ", pCardNum=" + pCardNum + ", pValidMonth="
				+ pValidMonth + ", pValidYear=" + pValidYear + ", pBankName=" + pBankName + ", pBankNo=" + pBankNo
				+ ", pBankSername=" + pBankSername + ", rsv=" + rsv + ", mem=" + mem + "]";
	}

}// PayInfo
