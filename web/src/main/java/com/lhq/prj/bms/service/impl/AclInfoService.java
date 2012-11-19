package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IAclInfoDao;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IAclInfoService;
import com.lhq.prj.bms.core.Page;

/**
 * AclInfoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class AclInfoService implements IAclInfoService{
	private IAclInfoDao aclInfoDao;

	public void setAclInfoDao(IAclInfoDao aDao) {
		this.aclInfoDao = aDao;
	}
	public boolean deleteByAclInfo(Integer s) {
		Integer flag = aclInfoDao.deleteByAclInfo(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void saveAclInfo(AclInfo a) {
		aclInfoDao.saveAclInfo(a);
	}
	public List findByUserName(AclInfo a) {
		return (List) aclInfoDao.findByUserName(a);
	}
	public UserInfo findUserById(UserInfo a) {
		return (UserInfo) aclInfoDao.findUserById(a);
	}
	public int findByCount()
	{
		return aclInfoDao.findByCount();
	}
	public List findAllAclInfo(Page p) {
		return (List) aclInfoDao.findAllAclInfo(p);
	}
	public List findAllAclLevel() {
		return (List) aclInfoDao.findAllAclLevel();
	}
	public List findAclByAdd(AclInfo s) {
		return (List) aclInfoDao.findAclByAdd(s);
	}
	public AclInfo findAclById(Integer s) {
		return aclInfoDao.findAclById(s);
	}
	public boolean chgAclSx(AclInfo a) throws Exception {
		Integer flag = aclInfoDao.chgAclSx(a);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateAclInfo(AclInfo a) throws Exception {
		Integer flag = aclInfoDao.updateAclInfo(a);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void addAclLogInfo(LogInfo a)
	{
		aclInfoDao.addAclLogInfo(a);
	}
}
