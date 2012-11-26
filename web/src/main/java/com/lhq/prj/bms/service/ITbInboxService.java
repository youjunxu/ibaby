package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;

public interface ITbInboxService {
	Integer saveTbInbox(TbInbox a);
	boolean deleteTbInboxById(Integer s);
	boolean deleteTbInboxByOut(Integer s);
	boolean deleteTbInboxByIn(Integer s);
	TbInbox findInboxById(Integer s);
	int findNewInboxCountByUser(Integer s);
	List findInboxByUser(Integer s);
	List findOutboxByUser(Integer s);
	UserEj findEjById(Integer i);
	boolean updateInBoxSeek(Integer s) throws Exception;
	List findAllFriendsById(Integer p);
}
