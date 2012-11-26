package com.lhq.prj.bms.po;

import java.io.Serializable;
import java.util.List;
/**
 * UserEj.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class UserEj implements Serializable {
	public UserEj() {
	}
	private Integer userId;
	private String userName;
	private String nickName;
	private String dtZcrq;
	private String dtYzrq;
	private String sex;
	private String headImg;
	private Integer userStatus;
	private Integer userJfzs;
	private Integer userXfjf;
	private Integer userSyjf;
	private String strContent;
	private String lxTel;
	private String lxSj;
	private String lxEmail;
	private String lxQq;
	private String lxMsn;
	private String ssName;
	private String strCity;
	private Integer ejId;
	private String ejName;
	private String syPhoto;
	private String homeXy;
	private String grLable;
	private String dtUpdate;
	private String ejContent;
	private Integer intReaders;
	private Integer photoStatus;
	private Integer intTxsh;
	private List userDocList;

	
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
	public Integer getUserJfzs() {
		return userJfzs;
	}
	public void setUserJfzs(Integer s) {
		this.userJfzs = s;
	}
	public Integer getUserXfjf() {
		return userXfjf;
	}
	public void setUserXfjf(Integer s) {
		this.userXfjf = s;
	}
	public Integer getUserSyjf() {
		return userSyjf;
	}
	public void setUserSyjf(Integer s) {
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
	public String getSj() {
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
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String s) {
		this.ssName = s;
	}
	public String getStrCity() {
		return strCity;
	}
	public void setStrCity(String s) {
		this.strCity = s;
	}
	public Integer getEjId() {
		return ejId;
	}
	public void setEjId(Integer s) {
		this.ejId = s;
	}
	public String getEjName() {
		return ejName;
	}
	public void setEjName(String s) {
		this.ejName = s;
	}
	public String getSyPhoto() {
		return syPhoto;
	}
	public void setSyPhoto(String s) {
		this.syPhoto = s;
	}
	public String getHomeXy() {
		return homeXy;
	}
	public void setHomeXy(String s) {
		this.homeXy = s;
	}
	public String getGrLable() {
		return grLable;
	}
	public void setGrLable(String s) {
		this.grLable = s;
	}
	public String getDtUpdate() {
		return dtUpdate;
	}
	public void setDtUpdate(String s) {
		this.dtUpdate = s;
	}
	public String getEjContent() {
		return ejContent;
	}
	public void setEjContent(String s) {
		this.ejContent = s;
	}
	public Integer getIntReaders() {
		return intReaders;
	}
	public void setIntReaders(Integer s) {
		this.intReaders = s;
	}
	public Integer getPhotoStatus() {
		return photoStatus;
	}
	public void setPhotoStatus(Integer s) {
		this.photoStatus = s;
	}
	public Integer getIntTxsh() {
		return intTxsh;
	}
	public void setIntTxsh(Integer s) {
		this.intTxsh = s;
	}

	public List getUserDocList() {
		return userDocList;
	}
	public void setUserDocList(List s) {
		this.userDocList = s;
	}
}
