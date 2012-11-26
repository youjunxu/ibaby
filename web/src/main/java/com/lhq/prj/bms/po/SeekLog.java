package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * SeekLog.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SeekLog implements Serializable{
	public SeekLog() {
	}
	private Integer lgId;
	private Integer skUserId;
	private String skUserName;
	private String mkCode;
	private Integer docId;
	private String dtSeek;
	private String skIp;

	public Integer getLgId() {
		return lgId;
	}
	public void setLgId(Integer s) {
		this.lgId = s;
	}
	public Integer getSkUserId() {
		return skUserId;
	}
	public void setSkUserId(Integer s) {
		this.skUserId = s;
	}
	public String getSkUserName() {
		return skUserName;
	}
	public void setSkUserName(String s) {
		this.skUserName = s;
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
	public String getDtSeek() {
		return dtSeek;
	}
	public void setDtSeek(String s) {
		this.dtSeek = s;
	}
	public String getSkIp() {
		return skIp;
	}
	public void setSkIp(String s) {
		this.skIp = s;
	}

}
