package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * LineIgo.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LineIgo implements Serializable{
	public LineIgo(){
	}
	private Integer igoId;
	private Integer igoTypeId;
	private String igoTypeName;
	private Integer brandId;
	private String brandName;
	private String igoName;
	private String igoOriginal;
	private String igoSection;
	private double igoGuide;
	private String igoShmcA;
	private String igoShmcB;
	private String igoShLink;
	private Integer igoXy;
	private Integer userId;
	private String userName;
	private String dtUpdate;
	private String spImg;
	private String strZbmc;
	private String strZbdw;

	public Integer getIgoId() {
		return igoId;
	}
	public void setIgoId(Integer s) {
		this.igoId = s;
	}
	public Integer getIgoTypeId() {
		return igoTypeId;
	}
	public void setIgoTypeId(Integer s) {
		this.igoTypeId = s;
	}
	public String getIgoTypeName() {
		return igoTypeName;
	}
	public void setIgoTypeName(String s) {
		this.igoTypeName = s;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer s) {
		this.brandId = s;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String s) {
		this.brandName = s;
	}
	public String getIgoName() {
		return igoName;
	}
	public void setIgoName(String s) {
		this.igoName = s;
	}
	public String getIgoOriginal() {
		return igoOriginal;
	}
	public void setIgoOriginal(String s) {
		this.igoOriginal = s;
	}
	public String getIgoSection() {
		return igoSection;
	}
	public void setIgoSection(String s) {
		this.igoSection = s;
	}
	public Double getIgoGuide() {
		return igoGuide;
	}
	public void setIgoGuide(Double s) {
		this.igoGuide = s;
	}
	public String getIgoShmcA() {
		return igoShmcA;
	}
	public void setIgoShmcA(String s) {
		this.igoShmcA = s;
	}
	public String getIgoShmcB() {
		return igoShmcB;
	}
	public void setIgoShmcB(String s) {
		this.igoShmcB = s;
	}
	public String getIgoShLink() {
		return igoShLink;
	}
	public void setIgoShLink(String s) {
		this.igoShLink = s;
	}
	public Integer getIgoXy() {
		return igoXy;
	}
	public void setIgoXy(Integer s) {
		this.igoXy = s;
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
	public String getDtUpdate() {
		return dtUpdate;
	}
	public void setDtUpdate(String s) {
		this.dtUpdate = s;
	}
	public String getSpImg() {
		return spImg;
	}
	public void setSpImg(String s) {
		this.spImg = s;
	}
	public String getStrZbmc() {
		return strZbmc;
	}
	public void setStrZbmc(String s) {
		this.strZbmc = s;
	}
	public String getStrZbdw() {
		return strZbdw;
	}
	public void setStrZbdw(String s) {
		this.strZbdw = s;
	}
}
