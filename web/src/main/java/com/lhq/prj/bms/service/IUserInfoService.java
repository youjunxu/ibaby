package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.core.Page;
/**    
 * IUserInfoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IUserInfoService {

	Integer saveUser(UserInfo user);
	boolean saveLmBaej(LmBaej user);
	boolean updateUser(UserInfo user) throws Exception;
	boolean validateUserReg(UserInfo user) throws Exception;
	boolean changeUserPass(UserInfo user) throws Exception;
	boolean reSetUserPass(UserInfo user) throws Exception;
	UserInfo login(UserInfo user);
	List findByUserName(UserInfo s);
	List findAclInfoByUserName(String s);
	List findSysMailInfo();
	List findByAllModule();
	int findByCount();
	List findAllUsers(Page p);
	List findAllAclLevel();
	UserInfo findByUserId(Integer s);
	List findAllSs();
	void addUserLogInfo(LogInfo a);
	MemberJfgz findJfgzByCode(String s);
	boolean addJfxx(MemberJfxf a);
	MemberJfxf findJfxfByCond(MemberJfxf a);
}
 