package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
/**    
 * IUserEjService.java Create on 2012-6-4
 * @author andchen
 * @version 1.0  
 */

public interface IUserEjService {
	List findAllEj();
	Integer findByCount();
	UserEj findEjById(Integer i);
	List findAllDocsByUser(Integer s);
	List findAllDocAByUser(Integer s);
	List findAllFriendsById(Integer p);
	GoodFriend findIsMyFriends(GoodFriend p);
	List findAllSs();
	List findCityBySs(String p);
	boolean updateBaej(LmBaej x) throws Exception;
	boolean updateHeadImg(UserInfo x) throws Exception;
	void addEjLogInfo(LogInfo a);
	UserInfo findByUserId(Integer s);
	boolean deleteUser(Integer s);
	List findAllBaejByTxsh(Page p);
	List findAllUserByNickName(String s);
	LmBaej findBaejByUser(Integer i);
	boolean saveTbInbox(TbInbox a);
	int findNewInboxCountByUser(Integer s);
}
