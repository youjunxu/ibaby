package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
/**
 * IUserEjDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IUserEjDao {
	public List findAllEj();
	public Integer findByCount();
	public UserEj findEjById(Integer i);
	public List findAllDocsByUser(Integer s);
	public List findAllDocAByUser(Integer s);
	public List findAllFriendsById(Integer p);
	public GoodFriend findIsMyFriends(GoodFriend p);
	public List findAllSs();
	public List findCityBySs(String s);
	public Integer updateBaej(LmBaej x) throws Exception ;
	public Integer updateHeadImg(UserInfo x) throws Exception ;
	public void addEjLogInfo(LogInfo a);
	public UserInfo findByUserId(Integer s);
	public Integer deleteByUser(Integer s);
	public List findAllBaejByTxsh(Page p);
	public List findAllUserByNickName(String s);
	public LmBaej findBaejByUser(Integer i);
	public Integer saveTbInbox(TbInbox a);
	public int findNewInboxCountByUser(Integer s);
}
