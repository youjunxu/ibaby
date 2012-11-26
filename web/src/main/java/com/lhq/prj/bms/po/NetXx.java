package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * NetXx.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class NetXx implements Serializable{
	public NetXx(){
	}
	private String aboutUs;
	private String xgSm;
	private String dtCrea;
	private Integer userId;
	private String nickName;

	public String getAboutUs() {
		return aboutUs;
	}
	public void setAboutUs(String s) {
		this.aboutUs = s;
	}
	public String getXgSm() {
		return xgSm;
	}
	public void setXgSm(String s) {
		this.xgSm = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String s) {
		this.nickName = s;
	}

}
