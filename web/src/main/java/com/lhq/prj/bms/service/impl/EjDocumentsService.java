package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.service.IEjDocumentsService;
import com.lhq.prj.bms.dao.IEjDocumentsDao;

public class EjDocumentsService implements IEjDocumentsService{
	private IEjDocumentsDao ejDocumentsDao;
	
	public void setEjDocumentsDao(IEjDocumentsDao d)
	{
		this.ejDocumentsDao=d;
	}
	public UserEj findEjById(Integer i)
	{
		return ejDocumentsDao.findEjById(i);
	}
	public List findAllDocByUserId(Integer i)
	{
		return ejDocumentsDao.findAllDocByUserId(i);
	}
	public List findBADocByEjUser(Integer i)
	{
		return ejDocumentsDao.findBADocByEjUser(i);
	}
	public List findBADocAByEjUser(Integer i)
	{
		return ejDocumentsDao.findBADocAByEjUser(i);
	}
	public List findAllHomeJsByUserId(Integer s)
	{
		return ejDocumentsDao.findAllHomeJsByUserId(s);
	}
}
