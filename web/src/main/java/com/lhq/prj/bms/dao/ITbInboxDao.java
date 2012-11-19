package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
/**    
 * ITbInboxDao.java Create on 2012-8-4
 * @author andchen
 * @version 1.0  
 */
public interface ITbInboxDao {
	public Integer saveTbInbox(TbInbox a);
	public Integer deleteTbInboxById(Integer s);
	public Integer deleteTbInboxByOut(Integer s);
	public Integer deleteTbInboxByIn(Integer s);
	public TbInbox findInboxById(Integer s);
	public int findNewInboxCountByUser(Integer s);
	public List findInboxByUser(Integer s);
	public List findOutboxByUser(Integer s);
	public UserEj findEjById(Integer i);
	public Integer updateInBoxSeek(Integer s) throws Exception;
	public List findAllFriendsById(Integer p);
}
