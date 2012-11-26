package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * PhotoMemo.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class PhotoMemo implements Serializable{
	public PhotoMemo(){		
	}
	private Integer photoId;
	private Integer xcId;
	private String xcTitle;
	private Integer userId;
	private String userName;
	private String strTitle;
	private String wjName;
	private String dtCrea;
	private Integer phStatus;
	private Integer sfFm;
	private Integer photoWidth;
	private Integer photoHeight;
	
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer s) {
		this.photoId = s;
	}
	public Integer getXcId() {
		return xcId;
	}
	public void setXcId(Integer s) {
		this.xcId = s;
	}
	public String getXcTitle() {
		return xcTitle;
	}
	public void setXcTitle(String s) {
		this.xcTitle = s;
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
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getWjName() {
		return wjName;
	}
	public void setWjName(String s) {
		this.wjName = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public Integer getPhStatus() {
		return phStatus;
	}
	public void setPhStatus(Integer s) {
		this.phStatus = s;
	}
	public Integer getSfFm() {
		return sfFm;
	}
	public void setSfFm(Integer s) {
		this.sfFm = s;
	}
	public Integer getPhotoWidth() {
		return photoWidth;
	}
	public void setPhotoWidth(Integer s) {
		this.photoWidth = s;
	}
	public Integer getPhotoHeight() {
		return photoHeight;
	}
	public void setPhotoHeight(Integer s) {
		this.photoHeight = s;
	}
}
