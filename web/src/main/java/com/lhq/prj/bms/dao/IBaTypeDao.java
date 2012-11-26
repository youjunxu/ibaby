package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.BaType;

/**
 * IBaTypeDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IBaTypeDao {
	public void saveBaType(BaType user);
	public Integer deleteBaType(Integer s);
	public Integer updateBaType(BaType x);
	public List findAllBaType();
}
