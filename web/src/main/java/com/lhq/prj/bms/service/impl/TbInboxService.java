package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.ITbInboxDao;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.service.ITbInboxService;

public class TbInboxService implements ITbInboxService{
	private ITbInboxDao tbInboxDao;
	public void setTbInboxDao(ITbInboxDao s)
	{
		tbInboxDao=s;
	}
	public Integer saveTbInbox(TbInbox s)
	{
		return tbInboxDao.saveTbInbox(s);
	}
	public boolean deleteTbInboxById(Integer s) {
		Integer flag=tbInboxDao.deleteTbInboxById(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public boolean deleteTbInboxByOut(Integer s)
	{
		Integer flag=tbInboxDao.deleteTbInboxByOut(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public boolean deleteTbInboxByIn(Integer s)
	{
		Integer flag=tbInboxDao.deleteTbInboxByIn(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public TbInbox findInboxById(Integer s)
	{
		return tbInboxDao.findInboxById(s);
	}
	public int findNewInboxCountByUser(Integer s)
	{
		return tbInboxDao.findNewInboxCountByUser(s);
	}
	public List findInboxByUser(Integer s)
	{
		return tbInboxDao.findInboxByUser(s);
	}
	public List findOutboxByUser(Integer s)
	{
		return tbInboxDao.findOutboxByUser(s);
	}
	public UserEj findEjById(Integer i)
	{
		return tbInboxDao.findEjById(i);
	}
	public boolean updateInBoxSeek(Integer s) throws Exception
	{
		Integer flag=tbInboxDao.updateInBoxSeek(s);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public List findAllFriendsById(Integer p)
	{
		return tbInboxDao.findAllFriendsById(p);
	}

}
