package com.lhq.prj.bms.po;

import java.util.List;
import java.io.Serializable;

/**
 * SpBrand.java Create on 2012-6-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SpType  implements Serializable{
	public SpType(){
	}

	private Integer spTypeId;
	private String spTypeName;
	private String zbName;
	private String zbDw;
	private List<SpBrand> brandList;

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
	public String getZbName() {
		return zbName;
	}
	public void setZbName(String s) {
		this.zbName = s;
	}
	public String getZbDw() {
		return zbDw;
	}
	public void setZbDw(String s) {
		this.zbDw = s;
	}
	public List<SpBrand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<SpBrand> s) {
		this.brandList = s;
	}
}
