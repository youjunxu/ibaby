package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.core.Page;
/**    
 * IUserInfoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IUserInfoDao {

	public Integer saveUser(UserInfo user);
	public Integer saveLmBaej(LmBaej user);
	public Integer updateUser(UserInfo user) throws Exception;
	public Integer validateUserReg(UserInfo user) throws Exception;
	public Integer changeUserPass(UserInfo user) throws Exception;
	public Integer reSetUserPass(UserInfo user) throws Exception;
	public UserInfo login(UserInfo user);
	public List findByUserName(UserInfo s);
	public List findAclInfoByUserName(String s);
	public List findSysMailInfo();
	public List findByAllModule();
	public int findByCount();
	public List findAllUsers(Page p);
	public List findAllAclLevel();
	public List findAllSs();
	public UserInfo findByUserId(Integer s);
	public void addUserLogInfo(LogInfo a);
	public MemberJfgz findJfgzByCode(String s);
	public Integer addJfxx(MemberJfxf a);
	public MemberJfxf findJfxfByCond(MemberJfxf a);
}
 