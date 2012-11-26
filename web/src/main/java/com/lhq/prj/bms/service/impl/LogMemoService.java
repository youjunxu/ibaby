package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.dao.ILogMemoDao;
import com.lhq.prj.bms.po.LogMemo;
import com.lhq.prj.bms.service.ILogMemoService;

public class LogMemoService  implements ILogMemoService{
	private ILogMemoDao logMemoDao;

	public void setLogMemoDao(ILogMemoDao aDao) {
		this.logMemoDao = aDao;
	}
	public boolean deleteLogMemo(LogMemo s) {
		Integer flag = logMemoDao.deleteLogMemo(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void addLogMemo(LogMemo a) {
		logMemoDao.addLogMemo(a);
	}
	public List findAllLogMemo(LogMemo a) {
		return logMemoDao.findAllLogMemo(a);
	}
}
