package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * Spgg.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Spgg implements Serializable{
	public Spgg() {
	}
	private Integer ggId;
	private String mkCode;
	private String strTitle;
	private String strContent;
	private Integer userId;
	private String strAuthor;
	private String dtCrea;

	public Integer getGgId() {
		return ggId;
	}
	public void setGgId(Integer s) {
		this.ggId = s;
	}
	public String getMkCode() {
		return mkCode;
	}
	public void setMkCode(String s) {
		this.mkCode = s;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getStrAuthor() {
		return strAuthor;
	}
	public void setStrAuthor(String s) {
		this.strAuthor = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
}

