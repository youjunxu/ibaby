package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import java.util.List;
import com.lhq.prj.bms.dao.ITbInboxDao;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;

/**
 * TbInboxDao.java Create on 2012-8-4
 * @author andchen
 * @version 1.0
 */
public class TbInboxDao extends SqlMapClientDaoSupport implements ITbInboxDao{
	public Integer saveTbInbox(TbInbox a)
	{
		return (Integer)getSqlMapClientTemplate().insert("TbInbox.save", a);
	}
	public Integer deleteTbInboxById(Integer s)
	{
		return getSqlMapClientTemplate().delete("TbInbox.deleteById", s);
	}
	public Integer deleteTbInboxByOut(Integer s)
	{
		return getSqlMapClientTemplate().update("TbInbox.deleteByOutBox", s);
	}
	public Integer deleteTbInboxByIn(Integer s)
	{
		return getSqlMapClientTemplate().update("TbInbox.deleteByInBox", s);
	}
	public TbInbox findInboxById(Integer s)
	{
		return (TbInbox)getSqlMapClientTemplate().queryForObject("TbInbox.findInboxById",s);
	}
	public int findNewInboxCountByUser(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("TbInbox.findNewInboxCountByUser",s);
	}
	
	public List findInboxByUser(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("TbInbox.findInboxByUser",s);
	}
	public List findOutboxByUser(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("TbInbox.findOutboxByUser",s);
	}
	public UserEj findEjById(Integer i)
	{
		return (UserEj)getSqlMapClientTemplate().queryForObject("UserEj.findEjById",i);
	}
	public Integer updateInBoxSeek(Integer s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("TbInbox.updateInBoxSeek",s);
	}
	public List findAllFriendsById(Integer p)
	{
		return (List)getSqlMapClientTemplate().queryForList("GoodFriend.findAllFriendsById",p);
	}

}
