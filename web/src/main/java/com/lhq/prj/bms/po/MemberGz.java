package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * MemberGz.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberGz implements Serializable{
	public MemberGz() {
	}
	private Integer gzId;
	private Integer gzUserId;
	private String gzUserName;
	private Integer bgzUserId;
	private String bgzUserName;
	private String dtGzDate;
	
	public void setGzId(Integer s)
	{
		this.gzId=s;
	}
	public Integer getGzId()
	{
		return this.gzId;
	}
	public void setGzUserId(Integer s)
	{
		this.gzUserId=s;
	}
	public Integer getGzUserId()
	{
		return this.gzUserId;
	}
	public void setGzUserName(String s)
	{
		this.gzUserName=s;
	}
	public String getGzUserName()
	{
		return this.gzUserName;
	}
	public void setBgzUserId(Integer s)
	{
		this.bgzUserId=s;
	}
	public Integer getBgzUserId()
	{
		return this.bgzUserId;
	}
	public void setBgzUserName(String s)
	{
		this.bgzUserName=s;
	}
	public String getBgzUserName()
	{
		return this.bgzUserName;
	}
	public void setDtGzDate(String s)
	{
		this.dtGzDate=s;
	}
	public String getDtGzDate()
	{
		return this.dtGzDate;
	}
}
