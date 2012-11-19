package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.ITsjyDao;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Tsjy;
import com.lhq.prj.bms.service.ITsjyService;
/**
 * TsjyService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */

public class TsjyService implements ITsjyService{
	private ITsjyDao tsjyDao;
	public void setTsjyDao(ITsjyDao aDao) {
		this.tsjyDao = aDao;
	}
	public boolean deleteTsjyById(Integer s) {
		Integer flag = tsjyDao.deleteTsjyById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean saveTsjyHf(Tsjy s) {
		Integer flag = tsjyDao.saveTsjyHf(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public Integer saveTsjy(Tsjy a) {
		return (Integer)tsjyDao.saveTsjy(a);
	}
	public int findByCount() {
		return tsjyDao.findByCount();
	}
	public List findAllTsjy(Page p) {
		return tsjyDao.findAllTsjy(p);
	}
	public Tsjy findTsjyById(Integer s)
	{
		return tsjyDao.findTsjyById(s);
	}
}
