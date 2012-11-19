package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * MemberJfgz.java Create on 2012-7-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberJfgz implements Serializable{
	public MemberJfgz() {
	}
	private Integer gzId;
	private String gzCode;
	private Float jfs;
	private String dtUpdate;
	private String strContent;
	private Integer userId;
	private String userName;
	private String jfDw;
	
	public Integer getGzId()
	{
		return gzId;
	}
	public void setGzId(Integer s)
	{
		this.gzId=s;
	}
	public String getGzCode()
	{
		return gzCode;
	}
	public void setGzCode(String s)
	{
		this.gzCode=s;
	}
	public Float getJfs()
	{
		return jfs;
	}
	public void setJfs(Float s)
	{
		this.jfs=s;
	}
	public String getDtUpdate()
	{
		return dtUpdate;
	}
	public void setDtUpdate(String s)
	{
		this.dtUpdate=s;
	}
	public String getStrContent()
	{
		return strContent;
	}
	public void setStrContent(String s)
	{
		this.strContent=s;
	}
	public Integer getUserId()
	{
		return this.userId;
	}
	public void setUserId(Integer s)
	{
		this.userId=s;
	}
	public String getUserName()
	{
		return this.userName;
	}
	public void setUserName(String s)
	{
		this.userName=s;
	}
	public String getJfDw()
	{
		return this.jfDw;
	}
	public void setJfDw(String s)
	{
		this.jfDw=s;
	}

}
