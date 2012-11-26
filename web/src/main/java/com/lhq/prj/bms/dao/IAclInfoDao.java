package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
/**    
 * IAclInfoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IAclInfoDao {
	public void saveAclInfo(AclInfo a);
	public Integer deleteByAclInfo(Integer s);
	public Integer updateAclInfo(AclInfo s) throws Exception;
	public List findByUserName(AclInfo s);
	public UserInfo findUserById(UserInfo s);
	public int findByCount();
	public List findAllAclInfo(Page p);
	public List findAclByAdd(AclInfo s);
	public List findAllAclLevel();
	public AclInfo findAclById(Integer s);
	public Integer chgAclSx(AclInfo a) throws Exception;
	public void addAclLogInfo(LogInfo a);
}
