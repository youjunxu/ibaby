package com.lhq.prj.bms.po;

import java.io.Serializable;
/**
 * BaType.java Create on 2012-4-18
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class BaType implements Serializable{
	public BaType() {
	}
	private Integer lmId;
	private String lmName;

	public Integer getLmId() {
		return lmId;
	}
	public void setLmId(Integer s) {
		this.lmId = s;
	}
	public String getLmName() {
		return lmName;
	}
	public void setLmName(String s) {
		this.lmName = s;
	}

}
