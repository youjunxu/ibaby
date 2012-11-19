package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IBaTypeDao;
import com.lhq.prj.bms.po.BaType;
import com.lhq.prj.bms.service.IBaTypeService;

public class BaTypeService implements IBaTypeService{
	private IBaTypeDao baTypeDao;

	public void setBaTypeDao(IBaTypeDao aDao) {
		this.baTypeDao = aDao;
	}
	public boolean deleteBaType(Integer s) {
		Integer flag = baTypeDao.deleteBaType(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void saveBaType(BaType a) {
		baTypeDao.saveBaType(a);
	}
	public boolean updateBaType(BaType s) {
		Integer flag = baTypeDao.updateBaType(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findAllBaType() {
		return (List) baTypeDao.findAllBaType();
	}
}
