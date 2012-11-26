package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * AclInfo.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class AclInfo implements Serializable{
	public AclInfo() {
	}
	private Integer aclId;
	private Integer userId;
	private String userName;
	private Integer aclLevel;
	private String aclDes;
	private String dtAvil;
	private String dtSxrq;
	private String mkCode;
	private String mkName;
	private String strContent;
	
	public Integer getAclId() {
		return aclId;
	}
	public void setAclId(Integer s) {
		this.aclId = s;
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
	public Integer getAclLevel() {
		return aclLevel;
	}
	public void setAclLevel(Integer s) {
		this.aclLevel = s;
	}
	public String getAclDes() {
		return aclDes;
	}
	public void setAclDes(String s) {
		this.aclDes = s;
	}
	public String getDtAvil() {
		return dtAvil;
	}
	public void setDtAvil(String s) {
		this.dtAvil = s;
	}
	public String getDtSxrq() {
		return dtSxrq;
	}
	public void setDtSxrq(String s) {
		this.dtSxrq = s;
	}
	public String getMkCode() {
		return mkCode;
	}
	public void setMkCode(String s) {
		this.mkCode = s;
	}
	public String getMkName() {
		return mkName;
	}
	public void setMkName(String s) {
		this.mkName = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}

}
