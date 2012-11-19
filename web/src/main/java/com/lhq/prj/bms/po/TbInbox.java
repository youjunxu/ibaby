package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * AclLevel.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class TbInbox implements Serializable{
	public TbInbox() {
	}
	private Integer xxId;
	private Integer sendUserId;
	private String sendUserName;
	private Integer recUserId;
	private String recUserName;
	private String dtSend;
	private String xxTitle;
	private String xxBody;
	private Integer ydBj;
	private Integer xsOut;
	private Integer xsIn;
	private Integer hfXxId;

	public Integer getXxId() {
		return xxId;
	}
	public void setXxId(Integer s) {
		this.xxId = s;
	}
	public Integer getSendUserId() {
		return sendUserId;
	}
	public void setSendUserId(Integer s) {
		this.sendUserId = s;
	}
	public String getSendUserName() {
		return sendUserName;
	}
	public void setSendUserName(String s) {
		this.sendUserName = s;
	}
	public Integer getRecUserId() {
		return recUserId;
	}
	public void setRecUserId(Integer s) {
		this.recUserId = s;
	}
	public String getRecUserName() {
		return recUserName;
	}
	public void setRecUserName(String s) {
		this.recUserName = s;
	}
	public String getDtSend() {
		return dtSend;
	}
	public void setDtSend(String s) {
		this.dtSend = s;
	}
	public String getXxTitle() {
		return xxTitle;
	}
	public void setXxTitle(String s) {
		this.xxTitle = s;
	}
	public String getXxBody() {
		return xxBody;
	}
	public void setXxBody(String s) {
		this.xxBody = s;
	}
	public Integer getYdBj() {
		return ydBj;
	}
	public void setYdBj(Integer s) {
		this.ydBj = s;
	}
	public Integer getXsOut() {
		return xsOut;
	}
	public void setXsOut(Integer s) {
		this.xsOut = s;
	}
	public Integer getXsIn() {
		return xsIn;
	}
	public void setXsIn(Integer s) {
		this.xsIn = s;
	}
	public Integer getHfXxId() {
		return hfXxId;
	}
	public void setHfXxId(Integer s) {
		this.hfXxId = s;
	}

}
