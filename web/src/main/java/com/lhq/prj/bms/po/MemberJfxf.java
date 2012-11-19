package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * MemberJfxf.java Create on 2012-7-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberJfxf implements Serializable{
	public MemberJfxf() {
	}
	private Integer spandId;
	private Integer userId;
	private String userName;
	private Float xfJf;
	private String dtXfDate;
	private String xfDesc;
	private Integer gzId;
	private String gzCode;
	
	public Integer getSpandId()
	{
		return spandId;
	}
	public void setSpandId(Integer s)
	{
		this.spandId=s;
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
	public Float getXfJf()
	{
		return xfJf;
	}
	public void setXfJf(Float s)
	{
		this.xfJf=s;
	}
	public String getDtXfDate()
	{
		return dtXfDate;
	}
	public void setDtXfDate(String s)
	{
		this.dtXfDate=s;
	}
	public String getXfDesc()
	{
		return xfDesc;
	}
	public void setXfDesc(String s)
	{
		this.xfDesc=s;
	}
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
}
