package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.service.IMemberJfgzService;
import com.lhq.prj.bms.dao.IMemberJfgzDao;

public class MemberJfgzService implements IMemberJfgzService{
	private IMemberJfgzDao memberJfgzDao;
	
	public void setMemberJfgzDao(IMemberJfgzDao m)
	{
		this.memberJfgzDao=m;
	}
	public Integer saveJfgz(MemberJfgz a) {
		return memberJfgzDao.saveJfgz(a);
	}
	public boolean deleteJfgzById(Integer s) {
		Integer flag = memberJfgzDao.deleteJfgzById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateJfgz(MemberJfgz a) throws Exception {
		Integer flag = memberJfgzDao.updateJfgz(a);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public MemberJfgz findJfgzByCode(String s)
	{
		return memberJfgzDao.findJfgzByCode(s);
	}
	public List findAllJfgz()
	{
		return memberJfgzDao.findAllJfgz();
	}
	public void addJfgzLogInfo(LogInfo a)
	{
		memberJfgzDao.addJfgzLogInfo(a);
	}
}
