package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IXtModuleDao;
import com.lhq.prj.bms.po.XtModule;
import com.lhq.prj.bms.service.IXtModuleService;

public class XtModuleService implements IXtModuleService{
	private IXtModuleDao xtModuleDao;

	public void setXtModuleDao(IXtModuleDao aDao) {
		this.xtModuleDao = aDao;
	}
	public boolean deleteModule(Integer s) {
		Integer flag = xtModuleDao.deleteModule(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void saveModule(XtModule a) {
		xtModuleDao.saveModule(a);
	}
	public boolean updateModule(XtModule s) {
		Integer flag = xtModuleDao.updateModule(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findByAllModule() {
		return (List) xtModuleDao.findByAllModule();
	}
}
