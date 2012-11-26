package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.po.SysSearch;
import com.lhq.prj.bms.dao.ISysSearchDao;
import com.lhq.prj.bms.service.ISysSearchService;

public class SysSearchService implements ISysSearchService{
	private ISysSearchDao sysSearchDao;
	
	public void setSysSearchDao(ISysSearchDao s)
	{
		this.sysSearchDao=s;
	}
	public List findAllDocInfoByCond(SysSearch s)
	{
		return sysSearchDao.findAllDocInfoByCond(s);
	}
}
