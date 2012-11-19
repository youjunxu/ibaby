package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.core.Page;

/**    
 * IAclInfoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IAclInfoService {
	void saveAclInfo(AclInfo user);
	boolean deleteByAclInfo(Integer s);
	List findByUserName(AclInfo s);
	int findByCount();
	List findAllAclInfo(Page p);
	List findAllAclLevel();
	List findAclByAdd(AclInfo s);
	UserInfo findUserById(UserInfo s);
	AclInfo findAclById(Integer s);
	boolean chgAclSx(AclInfo a) throws Exception;
	boolean updateAclInfo(AclInfo a) throws Exception;
	void addAclLogInfo(LogInfo a);
}
