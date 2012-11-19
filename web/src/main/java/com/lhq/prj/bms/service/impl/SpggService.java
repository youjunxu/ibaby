package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.ISpggDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.service.ISpggService;

public class SpggService implements ISpggService{
	private ISpggDao spggDao;

	public void setSpggDao(ISpggDao aDao) {
		this.spggDao = aDao;
	}
	public Integer saveSpgg(Spgg s) {
		return (Integer)spggDao.saveSpgg(s);
	}
	public boolean updateSpgg(Spgg s) throws Exception {
		Integer flag = spggDao.updateSpgg(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deleteSpggById(Integer s) {
		Integer flag = spggDao.deleteSpggById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public int findByCount()
	{
		return spggDao.findByCount();
	}
	public List findAllSpgg(Page p) {
		return (List) spggDao.findAllSpgg(p);
	}
	public Spgg findSpggById(Integer s) {
		return spggDao.findSpggById(s);
	}
	public void addGgLogInfo(LogInfo a)
	{
		spggDao.addGgLogInfo(a);
	}
}
