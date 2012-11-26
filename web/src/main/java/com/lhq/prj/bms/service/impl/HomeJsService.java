package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.po.HomeJs;
import com.lhq.prj.bms.dao.IHomeJsDao;
import com.lhq.prj.bms.service.IHomeJsService;

public class HomeJsService implements IHomeJsService{
	private IHomeJsDao homeJsDao;
	public void setHomeJsDao(IHomeJsDao s)
	{
		this.homeJsDao=s;
	}
	public Integer saveHomeJs(HomeJs s)
	{
		return homeJsDao.saveHomeJs(s);
	}
	public boolean deleteHomeJsById(Integer s)
	{
		Integer flag=homeJsDao.deleteHomeJsById(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public boolean updateHomeJsBase(HomeJs s) throws Exception
	{
		Integer flag=homeJsDao.updateHomeJsBase(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public boolean updateHomeJsShbj(HomeJs s) throws Exception
	{
		Integer flag=homeJsDao.updateHomeJsShbj(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public HomeJs findHomeJsById(Integer s)
	{
		return homeJsDao.findHomeJsById(s);
	}
	public List findAllHomeJsByUserId(Integer s)
	{
		return homeJsDao.findAllHomeJsByUserId(s);
	}
	public List findAllHomeJsAByUserId(HomeJs s)
	{
		return homeJsDao.findAllHomeJsAByUserId(s);
	}
	public List findBADocByEjUser(Integer i)
	{
		return homeJsDao.findBADocByEjUser(i);
	}
}
