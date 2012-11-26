package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * EjDcouments.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class EjDocuments implements Serializable{
	public EjDocuments(){
	}
	private String docType;
	private Integer userId;
	private String userName;
	private Integer docId;
	private String strTitle;
	private String dtCrea;
	private String docMemo;
	private Integer intReaders;
	private String strLable;
	private Integer shBj;

	public String getDocType() {
		return docType;
	}
	public void setDocType(String s) {
		this.docType = s;
	}
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
	public Integer getDocId() {
		return docId;
	}
	public void setDocId(Integer s) {
		this.docId = s;
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
	public String getDocMemo() {
		return docMemo;
	}
	public void setDocMemo(String s) {
		this.docMemo = s;
	}
	public Integer getIntReaders() {
		return intReaders;
	}
	public void setIntReaders(Integer s) {
		this.intReaders = s;
	}
	public String getStrLable() {
		return strLable;
	}
	public void setStrLable(String s) {
		this.strLable = s;
	}
	public Integer getShBj() {
		return shBj;
	}
	public void setShBj(Integer s) {
		this.shBj = s;
	}

}
