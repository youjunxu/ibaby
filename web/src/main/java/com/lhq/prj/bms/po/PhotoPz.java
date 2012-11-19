package com.lhq.prj.bms.po;

import java.util.List;
import java.io.Serializable;
/**
 * PhotoPz.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class PhotoPz implements Serializable{
	public PhotoPz(){
	}
	private Integer xcId;
	private Integer userId;
	private String userName;
	private String strTitle;
	private String dtCrea;
	private Integer xcStatus;
	private String xcPassword;
	private List photoList;
	
	public Integer getXcId() {
		return xcId;
	}
	public void setXcId(Integer s) {
		this.xcId = s;
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
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public Integer getXcStatus() {
		return xcStatus;
	}
	public void setXcStatus(Integer s) {
		this.xcStatus = s;
	}
	public String getXcPassword() {
		return xcPassword;
	}
	public void setXcPassword(String s) {
		this.xcPassword = s;
	}
	public List getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List s) {
		this.photoList = s;
	}
	
}
