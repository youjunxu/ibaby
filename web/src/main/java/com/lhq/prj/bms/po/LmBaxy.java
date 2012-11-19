package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * LmBaxy.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LmBaxy implements Serializable{
	public LmBaxy() {
	}
	private Integer baId;
	private Integer userId;
	private String strTitle;
	private String strAuthor;
	private String userName;
	private String fromName;
	private String dtCrea;
	private String strContent;
	private String strMemo;
	private Integer readers;
	private Integer lmCode;
	private String lmName;
	private String strLable;
	private Integer plZans;
	private Integer plFlowers;
	private Integer plHands;
	private Integer plYms;
	private Integer plCais;
	private Integer shbj;
	private String shrq;
	private Integer shUserId;
	private String shUserName;
	private String shLy;

	public Integer getBaId() {
		return baId;
	}
	public void setBaId(Integer s) {
		this.baId = s;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getStrAuthor() {
		return strAuthor;
	}
	public void setStrAuthor(String s) {
		this.strAuthor = s;
	}
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
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String s) {
		this.fromName = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getStrMemo() {
		return strMemo;
	}
	public void setStrMemo(String s) {
		this.strMemo = s;
	}
	public Integer getReaders() {
		return readers;
	}
	public void setReaders(Integer s) {
		this.readers = s;
	}
	public Integer getLmCode() {
		return lmCode;
	}
	public void setLmCode(Integer s) {
		this.lmCode = s;
	}

	public String getLmName() {
		return lmName;
	}
	public void setLmName(String s) {
		this.lmName = s;
	}
	public String getStrLable() {
		return strLable;
	}
	public void setStrLable(String s) {
		this.strLable = s;
	}
	public Integer getPlZans() {
		return plZans;
	}
	public void setPlZans(Integer s) {
		this.plZans = s;
	}
	public Integer getPlFlowers() {
		return plFlowers;
	}
	public void setPlFlowers(Integer s) {
		this.plFlowers = s;
	}
	public Integer getPlHands() {
		return plHands;
	}
	public void setPlHands(Integer s) {
		this.plHands = s;
	}
	public Integer getPlYms() {
		return plYms;
	}
	public void setPlYms(Integer s) {
		this.plYms = s;
	}
	public Integer getPlCais() {
		return plCais;
	}
	public void setPlCais(Integer s) {
		this.plCais = s;
	}
	public Integer getShbj() {
		return shbj;
	}
	public void setShbj(Integer s) {
		this.shbj = s;
	}
	public String getShrq() {
		return shrq;
	}
	public void setShrq(String s) {
		this.shrq = s;
	}
	public Integer getShUserId() {
		return shUserId;
	}
	public void setShUserId(Integer s) {
		this.shUserId = s;
	}
	public String getShUserName() {
		return shUserName;
	}
	public void setShUserName(String s) {
		this.shUserName = s;
	}
	public String getShLy() {
		return shLy;
	}
	public void setShLy(String s) {
		this.shLy = s;
	}

}
