package com.lhq.prj.bms.po;

public class LineIgoM {
	public LineIgoM(){
	}
	private Integer igoTypeId;
	private String igoTypeName;
	private Integer brandId;
	private String brandName;
	private Integer smallVal;
	private Integer bigVal;

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
	public Integer getSmallVal() {
		return smallVal;
	}
	public void setSmallVal(Integer s) {
		this.smallVal = s;
	}
	public Integer getBigVal() {
		return bigVal;
	}
	public void setBigVal(Integer s) {
		this.bigVal = s;
	}
}
