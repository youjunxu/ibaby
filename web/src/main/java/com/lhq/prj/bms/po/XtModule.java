package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * XtModule.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class XtModule implements Serializable{
	public XtModule() {
	}
	private Integer mkId;
	private Integer mkSort;
	private String mkCode;
	private String mkName;
	private String noLoginAcl;
	private String userAcl;
	private String memberAcl;
	
	public Integer getMkId() {
		return mkId;
	}
	public void setMkId(Integer s) {
		this.mkId = s;
	}
	public Integer getMkSort() {
		return mkSort;
	}
	public void setMkSort(Integer s) {
		this.mkSort = s;
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
	public String getNoLoginAcl() {
		return noLoginAcl;
	}
	public void setNoLoginAcl(String s) {
		this.noLoginAcl = s;
	}
	public String getUserAcl() {
		return userAcl;
	}
	public void setUserAcl(String s) {
		this.userAcl = s;
	}
	public String getMemberAcl() {
		return memberAcl;
	}
	public void setMemberAcl(String s) {
		this.memberAcl = s;
	}

}
