package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ILogInfoDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.service.ILogInfoService;

public class LogInfoService  implements ILogInfoService{
	private ILogInfoDao logInfoDao;

	public void setLogInfoDao(ILogInfoDao aDao) {
		this.logInfoDao = aDao;
	}
	public boolean deleteLogInfo(LogInfo s) {
		Integer flag = logInfoDao.deleteLogInfo(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void addLogInfo(LogInfo log) {
		logInfoDao.addLogInfo(log);
	}
	public List findAllLogInfo(LogInfo a) {
		return logInfoDao.findAllLogInfo(a);
	}
	public int findByCount()
	{
		return logInfoDao.findByCount();
	}
	public List findAllLogxx(Page p)
	{
		return logInfoDao.findAllLogxx(p);
	}
}
