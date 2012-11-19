package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Yqlj.java Create on 2012-8-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Yqlj implements Serializable{
	public Yqlj() {
	}
	private Integer ljId;
	private String ljName;
	private String ljAddr;
	private String dtCrea;
	private Integer userId;
	private String nickName;
	private String linkImg;

	public Integer getLjId() {
		return ljId;
	}
	public void setLjId(Integer s) {
		this.ljId = s;
	}
	public String getLjName() {
		return ljName;
	}
	public void setLjName(String s) {
		this.ljName = s;
	}
	public String getLjAddr() {
		return ljAddr;
	}
	public void setLjAddr(String s) {
		this.ljAddr = s;
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
	public String getLinkImg() {
		return linkImg;
	}
	public void setLinkImg(String s) {
		this.linkImg = s;
	}

}
