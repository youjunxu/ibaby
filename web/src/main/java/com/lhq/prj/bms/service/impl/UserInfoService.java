package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IUserInfoDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.service.IUserInfoService;
import com.lhq.prj.bms.core.Page;
/**
 * UserInfoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class UserInfoService implements IUserInfoService {

	private IUserInfoDao userInfoDao;

	public void setUserInfoDao(IUserInfoDao userDao) {
		this.userInfoDao = userDao;
	}

	public Integer saveUser(UserInfo user) {
		return userInfoDao.saveUser(user);
	}
	public boolean saveLmBaej(LmBaej user)
	{
		Integer flag = userInfoDao.saveLmBaej(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateUser(UserInfo user) throws Exception {
		Integer flag = userInfoDao.updateUser(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean validateUserReg(UserInfo user) throws Exception {
		Integer flag = userInfoDao.validateUserReg(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean reSetUserPass(UserInfo user) throws Exception {
		Integer flag = userInfoDao.reSetUserPass(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean changeUserPass(UserInfo user) throws Exception{
		Integer flag = userInfoDao.changeUserPass(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public UserInfo login(UserInfo user) {
		return userInfoDao.login(user);
	}
	public List findByUserName(UserInfo s) {
		return userInfoDao.findByUserName(s);
	}
	public List findAclInfoByUserName(String s) {
		return userInfoDao.findAclInfoByUserName(s);
	}
	public List findSysMailInfo()
	{
		return userInfoDao.findSysMailInfo();
	}
	public List findByAllModule()
	{
		return userInfoDao.findByAllModule();
	}
	public int findByCount()
	{
		return userInfoDao.findByCount();
	}
	public List findAllUsers(Page p)
	{
		return userInfoDao.findAllUsers(p);
	}
	public List findAllAclLevel()
	{
		return userInfoDao.findAllAclLevel();
	}
	public List findAllSs()
	{
		return userInfoDao.findAllSs();
	}
	public UserInfo findByUserId(Integer s)
	{
		return userInfoDao.findByUserId(s);
	}
	public void addUserLogInfo(LogInfo a)
	{
		userInfoDao.addUserLogInfo(a);
	}
	public MemberJfgz findJfgzByCode(String s)
	{
		return userInfoDao.findJfgzByCode(s);
	}	
	public boolean addJfxx(MemberJfxf a)
	{
		Integer flag = userInfoDao.addJfxx(a);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public MemberJfxf findJfxfByCond(MemberJfxf a)
	{
		return userInfoDao.findJfxfByCond(a);
	}
}
