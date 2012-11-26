package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * AclLevel.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MailInfo implements Serializable{
	public MailInfo() {
	}
	private String userName;
	private String userPass;
	private String smtpName;
	private String mailPort;
	private String mailAddr;

	public String getUserName() {
		return userName;
	}
	public void setUserName(String s) {
		this.userName = s;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String s) {
		this.userPass = s;
	}
	public String getSmtpName() {
		return smtpName;
	}
	public void setSmtpName(String s) {
		this.smtpName = s;
	}
	public String getMailPort() {
		return mailPort;
	}
	public void setMailPort(String s) {
		this.mailPort = s;
	}
	public String getMailAddr() {
		return mailAddr;
	}
	public void setMailAddr(String s) {
		this.mailAddr = s;
	}

}
