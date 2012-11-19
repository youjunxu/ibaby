package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * BaDocSh.java Create on 2012-8-5
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class BaDocSh implements Serializable{
	public BaDocSh(){
	}
	private Integer reEdit;
	private String shKey;
	private String dtUpdate;
	private Integer userId;
	private String userName;
	
	public void setReEdit(Integer s)
	{
		this.reEdit=s;
	}
	public Integer getReEdit()
	{
		return reEdit;
	}
	public void setShKey(String s)
	{
		this.shKey=s;
	}
	public String getShKey()
	{
		return shKey;
	}
	public void setDtUpdate(String s)
	{
		this.dtUpdate=s;
	}
	public String getDtUpdate()
	{
		return dtUpdate;
	}
	public void setUserId(Integer s)
	{
		this.userId=s;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserName(String s)
	{
		this.userName=s;
	}
	public String getUserName()
	{
		return userName;
	}
}
