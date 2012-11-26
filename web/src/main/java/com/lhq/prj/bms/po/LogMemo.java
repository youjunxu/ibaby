package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * LogMemo.java Create on 2012-5-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LogMemo implements Serializable{
	public LogMemo() {
	}
	Integer logId;
	Integer userId;
	String userName;
	String czDate;
	String objectName;
	String beforeCz;
	String afterCz;
	String strContent;
	
	public Integer getLogId() {
		return logId;
	}
	public void setLogId(Integer s) {
		this.logId = s;
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
	public String getCzDate() {
		return czDate;
	}
	public void setCzDate(String s) {
		this.czDate = s;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String s) {
		this.objectName = s;
	}
	public String getBeforeCz() {
		return beforeCz;
	}
	public void setBeforeCz(String s) {
		this.beforeCz = s;
	}
	public String getAfterCz() {
		return afterCz;
	}
	public void setAfterCz(String s) {
		this.afterCz = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
}
