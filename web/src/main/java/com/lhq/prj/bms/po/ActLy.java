package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * ActLy.java Create on 2012-8-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class ActLy implements Serializable{
	public ActLy() {
	}
	private Integer lyId;
	private Integer actId;
	private String actName;
	private String lyContent;
	private String dtCrea;
	private Integer userId;
	private String nickName;

	public Integer getLyId() {
		return lyId;
	}
	public void setLyId(Integer s) {
		this.lyId = s;
	}
	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer s) {
		this.actId = s;
	}
	public String getActName() {
		return actName;
	}
	public void setActName(String s) {
		this.actName = s;
	}
	public String getLyContent() {
		return lyContent;
	}
	public void setLyContent(String s) {
		this.lyContent = s;
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
