package com.lhq.prj.bms.po;

/**
 * AclLevel.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class PingLun {
	public PingLun() {
	}
	private Integer userId;
	private String userName;
	private String mkCode;
	private Integer docId;
	private Integer plResult;
	private String plDate;

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String s) {
		this.userName = s;
	}
	public String getMkCode() {
		return mkCode;
	}
	public void setMkCode(String s) {
		this.mkCode = s;
	}
	public Integer getDocId() {
		return docId;
	}
	public void setDocId(Integer s) {
		this.docId = s;
	}
	public Integer getPlResult() {
		return plResult;
	}
	public void setPlResult(Integer s) {
		this.plResult = s;
	}
	public String getPlDate() {
		return plDate;
	}
	public void setPlDate(String s) {
		this.plDate = s;
	}
}
