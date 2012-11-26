package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * SpBrand.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SpBrand implements Serializable{
	public SpBrand() {
	}
	private Integer brandId;
	private Integer spTypeId;
	private String spTypeName;
	private String brandName;
	private String brandImg;
	private Integer dispXh;

	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer s) {
		this.brandId = s;
	}
	public Integer getSpTypeId() {
		return spTypeId;
	}
	public void setSpTypeId(Integer s) {
		this.spTypeId = s;
	}
	public String getSpTypeName() {
		return spTypeName;
	}
	public void setSpTypeName(String s) {
		this.spTypeName = s;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String s) {
		this.brandName = s;
	}
	public String getBrandImg() {
		return brandImg;
	}
	public void setBrandImg(String s) {
		this.brandImg = s;
	}
	public Integer getDispXh() {
		return dispXh;
	}
	public void setDispXh(Integer s) {
		this.dispXh = s;
	}
}

