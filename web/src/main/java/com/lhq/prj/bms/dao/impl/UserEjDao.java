package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import java.util.List;

import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IUserEjDao;

public class UserEjDao extends SqlMapClientDaoSupport implements IUserEjDao{
	public List findAllEj()
	{
		return (List)getSqlMapClientTemplate().queryForList("UserEj.findAllEj");
	}
	public Integer findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("UserEj.findByCount");
	}
	public UserEj findEjById(Integer i)
	{
		return (UserEj)getSqlMapClientTemplate().queryForObject("UserEj.findEjById",i);
	}
	public LmBaej findBaejByUser(Integer i)
	{
		return (LmBaej)getSqlMapClientTemplate().queryForObject("LmBaej.findBaejByUser",i);
	}
	
	public List findAllDocsByUser(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findAllDocByUserId",s);
	}
	public List findAllDocAByUser(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findAllDocAByUserId",s);
	}
	public List findAllFriendsById(Integer p)
	{
		return (List)getSqlMapClientTemplate().queryForList("GoodFriend.findAllFriendsById",p);
	}
	public GoodFriend findIsMyFriends(GoodFriend p)
	{
		return (GoodFriend)getSqlMapClientTemplate().queryForObject("GoodFriend.findIsMyFriends",p);
	}
	public List findAllSs()
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findAllSs");
	}
	public List findCityBySs(String p)
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findCityBySs",p);
	}
	public Integer updateBaej(LmBaej s) throws Exception 
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaej.updateBaej", s);
	}
	public Integer updateHeadImg(UserInfo s) throws Exception 
	{
		return (Integer)getSqlMapClientTemplate().update("UserInfo.updateHeadImg", s);
	}
	public void addEjLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	public UserInfo findByUserId(Integer s)
	{
		return (UserInfo)getSqlMapClientTemplate().queryForObject("UserInfo.findByUseId",s);
	}
	public Integer deleteByUser(Integer s) {
		return getSqlMapClientTemplate().delete("UserInfo.deleteById", s);
	} 
	public List findAllBaejByTxsh(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("UserEj.findAllBaejByTxsh",p);
	}
	public List findAllUserByNickName(String s)
	{
		return (List)getSqlMapClientTemplate().queryForList("UserInfo.findByNickName",s);
	}
	
	public Integer saveTbInbox(TbInbox a)
	{
		return (Integer)getSqlMapClientTemplate().insert("TbInbox.save", a);
	}
	public int findNewInboxCountByUser(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("TbInbox.findNewInboxCountByUser",s);
	}

}
