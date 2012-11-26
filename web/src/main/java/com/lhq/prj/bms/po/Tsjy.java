package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Tsjy.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Tsjy implements Serializable{
	public Tsjy() {
	}
	private Integer tsjyId;
	private String jyTitle;
	private Integer fbUserId;
	private String fbUserName;
	private String dtFbrq;
	private String strContent;
	private String ipAddr;
	private Integer hfUserId;
	private String hfUserName;
	private String dtHfrq;
	private String hfContent;

	public Integer getTsjyId() {
		return tsjyId;
	}
	public void setTsjyId(Integer s) {
		this.tsjyId = s;
	}
	public String getJyTitle() {
		return jyTitle;
	}
	public void setJyTitle(String s) {
		this.jyTitle = s;
	}
	public Integer getFbUserId() {
		return fbUserId;
	}
	public void setFbUserId(Integer s) {
		this.fbUserId = s;
	}
	public String getFbUserName() {
		return fbUserName;
	}
	public void setFbUserName(String s) {
		this.fbUserName = s;
	}
	public String getDtFbrq() {
		return dtFbrq;
	}
	public void setDtFbrq(String s) {
		this.dtFbrq = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String s) {
		this.ipAddr = s;
	}
	public Integer getHfUserId() {
		return hfUserId;
	}
	public void setHfUserId(Integer s) {
		this.hfUserId = s;
	}
	public String getHfUserName() {
		return hfUserName;
	}
	public void setHfUserName(String s) {
		this.hfUserName = s;
	}
	public String getDtHfrq() {
		return dtHfrq;
	}
	public void setDtHfrq(String s) {
		this.dtHfrq = s;
	}
	public String getHfContent() {
		return hfContent;
	}
	public void setHfContent(String s) {
		this.hfContent = s;
	}
}
