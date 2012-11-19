package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * SysSearch.java Create on 2012-8-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SysSearch implements Serializable{
	public SysSearch(){
	}
	private String strBaCond;
	private String strLyCond;
	private Integer docId;
	private String strDocType;
	private String strTitle;
	private String dtCrea;
	private Integer userId;
	private String nickName;

	public String getStrBaCond() {
		return strBaCond;
	}
	public void setStrBaCond(String s) {
		this.strBaCond = s;
	}
	public String getStrLyCond() {
		return strLyCond;
	}
	public void setStrLyCond(String s) {
		this.strLyCond = s;
	}
	public Integer getDocId() {
		return docId;
	}
	public void setDocId(Integer s) {
		this.docId = s;
	}
	public String getStrDocType() {
		return strDocType;
	}
	public void setStrDocType(String s) {
		this.strDocType = s;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String s) {
		this.nickName = s;
	}

}
