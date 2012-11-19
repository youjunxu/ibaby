package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * AclLevel.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class AclLevel implements Serializable{
	public AclLevel() {
	}
	private Integer aclLevel;
	private String aclDes;

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

}
