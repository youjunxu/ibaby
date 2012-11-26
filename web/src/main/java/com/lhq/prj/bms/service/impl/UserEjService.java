package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IUserEjDao;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IUserEjService;

public class UserEjService implements IUserEjService{
	private IUserEjDao userEjDao;

	public void setUserEjDao(IUserEjDao aDao) {
		this.userEjDao = aDao;
	}

	public List findAllEj()
	{
		return userEjDao.findAllEj();
	}
	public Integer findByCount()
	{
		return userEjDao.findByCount();
	}
	public UserEj findEjById(Integer i)
	{
		return userEjDao.findEjById(i);
	}
	public List findAllDocsByUser(Integer s)
	{
		return userEjDao.findAllDocsByUser(s);
	}
	public List findAllDocAByUser(Integer s)
	{
		return userEjDao.findAllDocAByUser(s);
	}
	public List findAllFriendsById(Integer p)
	{
		return userEjDao.findAllFriendsById(p);
	}
	public GoodFriend findIsMyFriends(GoodFriend p)
	{
		return userEjDao.findIsMyFriends(p);
	}
	public List findAllSs()
	{
		return userEjDao.findAllSs();
	}
	public List findCityBySs(String p)
	{
		return userEjDao.findCityBySs(p);
	}
	public boolean updateBaej(LmBaej s) throws Exception{
		Integer flag = userEjDao.updateBaej(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateHeadImg(UserInfo s) throws Exception{
		Integer flag = userEjDao.updateHeadImg(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void addEjLogInfo(LogInfo a)
	{
		userEjDao.addEjLogInfo(a);
	}
	public UserInfo findByUserId(Integer s)
	{
		return userEjDao.findByUserId(s);
	}
	public boolean deleteUser(Integer userName) {
		Integer flag = userEjDao.deleteByUser(userName);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findAllBaejByTxsh(Page p)
	{
		return userEjDao.findAllBaejByTxsh(p);
	}
	public List findAllUserByNickName(String s)
	{
		return userEjDao.findAllUserByNickName(s);
	}
	public LmBaej findBaejByUser(Integer i)
	{
		return userEjDao.findBaejByUser(i);
	}
	public boolean saveTbInbox(TbInbox a)
	{
		Integer flag = userEjDao.saveTbInbox(a);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public int findNewInboxCountByUser(Integer s)
	{
		return userEjDao.findNewInboxCountByUser(s);
	}
}
