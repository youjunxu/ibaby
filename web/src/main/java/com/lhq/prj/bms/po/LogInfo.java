package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * LogInfo.java Create on 2012-5-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LogInfo implements Serializable{
	public LogInfo() {
	}
	Integer logId;
	Integer userId;
	String userName;
	String czDate;
	String operatorDesc;
	String cName;
	String logIp;
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
	public String getOperatorDesc() {
		return operatorDesc;
	}
	public void setOperatorDesc(String s) {
		this.operatorDesc = s;
	}
	public String getCName() {
		return cName;
	}
	public void setCName(String s) {
		this.cName = s;
	}
	public String getLogIp() {
		return logIp;
	}
	public void setLogIp(String s) {
		this.logIp = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
}
