package com.lhq.prj.bms.po;


import java.io.Serializable;

/**
 * UserInfo.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class UserInfo implements Serializable {

	public UserInfo() {
	}
	private Integer userId;
	private String userName;
	private String userPass;
	private String nickName;
	private String dtZcrq;
	private String dtYzrq;
	private String sex;
	private String headImg;
	private Integer userStatus;
	private String userLastPwd;
	private Float userJfzs;
	private Float userXfjf;
	private Float userSyjf;
	private String strContent;
	private String lxTel;
	private String lxSj;
	private String lxEmail;
	private String lxQq;
	private String lxMsn;
	private String regCode;
	private String strCity;
	private String ssName;
	private Integer intTxsh;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String s) {
		this.userName = s;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String s) {
		this.userPass = s;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String s) {
		this.nickName = s;
	}
	public String getDtZcrq() {
		return dtZcrq;
	}
	public void setDtZcrq(String s) {
		this.dtZcrq = s;
	}
	public String getDtYzrq() {
		return dtYzrq;
	}
	public void setDtYzrq(String s) {
		this.dtYzrq = s;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String s) {
		this.sex = s;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String s) {
		this.headImg = s;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer s) {
		this.userStatus = s;
	}
	public String getUserLastPwd() {
		return userLastPwd;
	}
	public void setUserLastPwd(String s) {
		this.userLastPwd = s;
	}
	public Float getUserJfzs() {
		return userJfzs;
	}
	public void setUserJfzs(Float s) {
		this.userJfzs = s;
	}
	public Float getUserXfjf() {
		return userXfjf;
	}
	public void setUserXfjf(Float s) {
		this.userXfjf = s;
	}
	public Float getUserSyjf() {
		return userSyjf;
	}
	public void setUserSyjf(Float s) {
		this.userSyjf = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getLxTel() {
		return lxTel;
	}
	public void setLxTel(String s) {
		this.lxTel = s;
	}
	public String getLxEmail() {
		return lxEmail;
	}
	public void setLxEmail(String s) {
		this.lxEmail = s;
	}
	public String getLxSj() {
		return lxSj;
	}
	public void setLxSj(String s) {
		this.lxSj = s;
	}
	public String getLxQq() {
		return lxQq;
	}
	public void setLxQq(String s) {
		this.lxQq = s;
	}
	public String getLxMsn() {
		return lxMsn;
	}
	public void setLxMsn(String s) {
		this.lxMsn = s;
	}
	public String getRegCode() {
		return regCode;
	}
	public void setRegCode(String s) {
		this.regCode = s;
	}
	public String getStrCity() {
		return strCity;
	}
	public void setStrCity(String s) {
		this.strCity = s;
	}
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String s) {
		this.ssName = s;
	}
	public Integer getIntTxsh() {
		return intTxsh;
	}
	public void setIntTxsh(Integer s) {
		this.intTxsh = s;
	}

}
