package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * TbCity.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class TbCity implements Serializable{
	public TbCity() {
	}
	private Integer cityId;
	private String ssName;
	private String cityName;

	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer s) {
		this.cityId = s;
	}
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String s) {
		this.ssName = s;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String s) {
		this.cityName = s;
	}
}
