package com.lhq.prj.bms.po;

import java.io.Serializable;
import java.util.List;
/**
 * LmBaej.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LmBaej implements Serializable{
	public LmBaej() {
	}
	private Integer ejId;
	private Integer userId;
	private String ejName;
	private String userName;
	private String syPhoto;
	private String homeXy;
	private String grLable;
	private String dtUpdate;
	private String strContent;
	private Integer intReaders;
	private Integer photoStatus;
	private Integer intTxsh;
	private List userDocList;

	public Integer getEjId() {
		return ejId;
	}
	public void setEjId(Integer s) {
		this.ejId = s;
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
	public String getEjName() {
		return ejName;
	}
	public void setEjName(String s) {
		this.ejName = s;
	}
	public String getSyPhoto() {
		return syPhoto;
	}
	public void setSyPhoto(String s) {
		this.syPhoto = s;
	}
	public String getHomeXy() {
		return homeXy;
	}
	public void setHomeXy(String s) {
		this.homeXy = s;
	}
	public String getGrLable() {
		return grLable;
	}
	public void setGrLable(String s) {
		this.grLable = s;
	}
	public String getDtUpdate() {
		return dtUpdate;
	}
	public void setDtUpdate(String s) {
		this.dtUpdate = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public Integer getIntReaders() {
		return intReaders;
	}
	public void setIntReaders(Integer s) {
		this.intReaders = s;
	}
	public Integer getPhotoStatus() {
		return photoStatus;
	}
	public void setPhotoStatus(Integer s) {
		this.photoStatus = s;
	}
	public Integer getIntTxsh() {
		return intTxsh;
	}
	public void setIntTxsh(Integer s) {
		this.intTxsh = s;
	}

	public List getUserDocList() {
		return userDocList;
	}
	public void setUserDocList(List s) {
		this.userDocList = s;
	}
}

