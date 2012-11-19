package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Yqlj;
import com.lhq.prj.bms.dao.IYqljDao;
import com.lhq.prj.bms.service.IYqljService;

public class YqljService implements IYqljService{
	public IYqljDao yqljDao;
	public void setYqljDao(IYqljDao s)
	{
		this.yqljDao=s;
	}
	
	public void saveYqlj(Yqlj a)
	{
		yqljDao.saveYqlj(a);
	}
	public boolean deleteYqljById(Integer s)
	{
		Integer flag=yqljDao.deleteYqljById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateYqlj(Yqlj s) throws Exception
	{
		Integer flag=yqljDao.updateYqlj(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findAllYqlj()
	{
		return yqljDao.findAllYqlj();
	}
	public Yqlj findYqljById(Integer s)
	{
		return yqljDao.findYqljById(s);
	}
	public void addLogInfo(LogInfo a)
	{
		yqljDao.addLogInfo(a);
	}
}
