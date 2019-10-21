package com.khrd.dto;

import java.util.Date;

public class Member {
	private int mNo;
	private String mName;
	private Date mBirth;
	private String mMail;
	private String mPhone;
	private String mTel;
	private String mZipcode;
	private String mAddr1;
	private String mAddr2;
	private String mId;
	private String mPwd;
	private Date mRegdate;
	private Date mQuitdate;
	private int mIsAdmin;
	public Member() {}
	public Member(int mNo, String mName, Date mBirth, String mMail, String mPhone, String mTel, String mZipcode,
			String mAddr1, String mAddr2, String mId, String mPwd, Date mRegdate, Date mQuitdate, int mIsAdmin) {
		super();
		this.mNo = mNo;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mMail = mMail;
		this.mPhone = mPhone;
		this.mTel = mTel;
		this.mZipcode = mZipcode;
		this.mAddr1 = mAddr1;
		this.mAddr2 = mAddr2;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mRegdate = mRegdate;
		this.mQuitdate = mQuitdate;
		this.mIsAdmin = mIsAdmin;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Date getmBirth() {
		return mBirth;
	}
	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}
	public String getmMail() {
		return mMail;
	}
	public void setmMail(String mMail) {
		this.mMail = mMail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmZipcode() {
		return mZipcode;
	}
	public void setmZipcode(String mZipcode) {
		this.mZipcode = mZipcode;
	}
	public String getmAddr1() {
		return mAddr1;
	}
	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}
	public String getmAddr2() {
		return mAddr2;
	}
	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public Date getmRegdate() {
		return mRegdate;
	}
	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}
	public Date getmQuitdate() {
		return mQuitdate;
	}
	public void setmQuitdate(Date mQuitdate) {
		this.mQuitdate = mQuitdate;
	}
	public int getmIsAdmin() {
		return mIsAdmin;
	}
	public void setmIsAdmin(int mIsAdmin) {
		this.mIsAdmin = mIsAdmin;
	}
	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mName=" + mName + ", mBirth=" + mBirth + ", mMail=" + mMail + ", mPhone="
				+ mPhone + ", mTel=" + mTel + ", mZipcode=" + mZipcode + ", mAddr1=" + mAddr1 + ", mAddr2=" + mAddr2
				+ ", mId=" + mId + ", mPwd=" + mPwd + ", mRegdate=" + mRegdate + ", mQuitdate=" + mQuitdate
				+ ", mIsAdmin=" + mIsAdmin + "]";
	}
	
	
}	
