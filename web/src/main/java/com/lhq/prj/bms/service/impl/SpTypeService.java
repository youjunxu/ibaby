package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.dao.ISpTypeDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.service.ISpTypeService;
public class SpTypeService implements ISpTypeService{
	private ISpTypeDao spTypeDao;

	public void setSpTypeDao(ISpTypeDao aDao) {
		this.spTypeDao = aDao;
	}
	public List findAllSpType() {
		return (List) spTypeDao.findAllSpType();
	}
	public void addSpTypeLogInfo(LogInfo a)
	{
		spTypeDao.addSpTypeLogInfo(a);
	}
}
