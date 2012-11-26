package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * HomeJs.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class HomeJs implements Serializable{
	public HomeJs(){
	}
	private Integer jsId;
	private String jsTitle;
	private Integer userId;
	private String userName;
	private String strContent;
	private String dtCrea;
	private String strMemo;
	private Integer docLevel;
	private String docPass;
	private Integer shBj;
	private String shRq;
	private Integer shUserId;
	private String shUserName;

	public Integer getJsId() {
		return jsId;
	}
	public void setJsId(Integer s) {
		this.jsId = s;
	}
	public String getJsTitle() {
		return jsTitle;
	}
	public void setJsTitle(String s) {
		this.jsTitle = s;
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
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public String getStrMemo() {
		return strMemo;
	}
	public void setStrMemo(String s) {
		this.strMemo = s;
	}
	public Integer getDocLevel() {
		return docLevel;
	}
	public void setDocLevel(Integer s) {
		this.docLevel = s;
	}
	public String getDocPass() {
		return docPass;
	}
	public void setDocPass(String s) {
		this.docPass = s;
	}	
	public Integer getShBj() {
		return shBj;
	}
	public void setShBj(Integer s) {
		this.shBj = s;
	}
	public String getShRq() {
		return shRq;
	}
	public void setShRq(String s) {
		this.shRq = s;
	}
	public Integer getShUserId() {
		return shUserId;
	}
	public void setShUserId(Integer s) {
		this.shUserId = s;
	}
	public String getShUserName() {
		return shUserName;
	}
	public void setShUserName(String s) {
		this.shUserName = s;
	}
}
