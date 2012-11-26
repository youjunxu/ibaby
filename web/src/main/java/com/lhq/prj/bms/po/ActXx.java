package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * AclLevel.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class ActXx implements Serializable{
	public ActXx(){
	}
	private Integer actId;
	private String actName;
	private String actLink;

	private String dtCrea;
	private String actContent;
	private String dtStart;
	private String dtEnd;
	private String actImg;
	private Integer actStatus;
	private Integer userId;
	private String userName;
	private String jpJs;
	private Integer photoWidth;
	private Integer photoHeight;
	private String hdJs;

	public Integer getActId()
	{
		return actId;
	}
	public void setActId(Integer s)
	{
		this.actId=s;
	}
	public String getActName()
	{
		return actName;
	}
	public void setActName(String s)
	{
		this.actName=s;
	}
	public String getActLink() {
		return actLink;
	}
	public void setActLink(String s) {
		this.actLink = s;
	}

	public String getDtCrea()
	{
		return dtCrea;
	}
	public void setDtCrea(String s)
	{
		this.dtCrea=s;
	}
	public String getActContent()
	{
		return actContent;
	}
	public void setActContent(String s)
	{
		this.actContent=s;
	}
	public String getDtStart()
	{
		return dtStart;
	}
	public void setDtStart(String s)
	{
		this.dtStart=s;
	}
	public String getDtEnd()
	{
		return dtEnd;
	}
	public void setDtEnd(String s)
	{
		this.dtEnd=s;
	}
	public String getActImg()
	{
		return actImg;
	}
	public void setActImg(String s)
	{
		this.actImg=s;
	}
	public Integer getActStatus()
	{
		return actStatus;
	}
	public void setActStatus(Integer s)
	{
		this.actStatus=s;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserId(Integer s)
	{
		this.userId=s;
	}

	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String s)
	{
		this.userName=s;
	}
	public String getJpJs()
	{
		return jpJs;
	}
	public void setJpJs(String s)
	{
		this.jpJs=s;
	}
	public Integer getPhotoWidth() {
		return photoWidth;
	}
	public void setPhotoWidth(Integer s) {
		this.photoWidth = s;
	}
	public Integer getPhotoHeight() {
		return photoHeight;
	}
	public void setPhotoHeight(Integer s) {
		this.photoHeight = s;
	}
	public String getHdJs()
	{
		return hdJs;
	}
	public void setHdJs(String s)
	{
		this.hdJs=s;
	}

}
