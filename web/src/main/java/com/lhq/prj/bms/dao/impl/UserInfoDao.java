package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IUserInfoDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.core.Page;
/**
 * UserInfoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class UserInfoDao extends SqlMapClientDaoSupport implements IUserInfoDao {
	public Integer saveUser(UserInfo user) {
		return (Integer)getSqlMapClientTemplate().insert("UserInfo.save", user);
	}
	public Integer saveLmBaej(LmBaej user) {
		return (Integer)getSqlMapClientTemplate().insert("LmBaej.save", user);
	}
	public Integer updateUser(UserInfo user) throws Exception {
		return getSqlMapClientTemplate().update("UserInfo.updateUser", user);
	}
	public Integer validateUserReg(UserInfo user) throws Exception {
		return getSqlMapClientTemplate().update("UserInfo.updateValidateUser", user);
	}
	public Integer changeUserPass(UserInfo user) throws Exception {
		return getSqlMapClientTemplate().update("UserInfo.changeUserPass", user);
	}
	public Integer reSetUserPass(UserInfo user) throws Exception {
		return getSqlMapClientTemplate().update("UserInfo.reSetUserPass", user);
	}
	public UserInfo login(UserInfo user) {
		return (UserInfo) getSqlMapClientTemplate().queryForObject("UserInfo.login",user);
	}
	public List findByUserName(UserInfo s){
		return (List)getSqlMapClientTemplate().queryForList("UserInfo.findByUserName",s);
	}
	public List findAclInfoByUserName(String s)
	{
		return (List)getSqlMapClientTemplate().queryForList("AclInfo.findByUserName", s);
	}
	public List findSysMailInfo()
	{
		return (List)getSqlMapClientTemplate().queryForList("MailInfo.findMailInfo");
	}
	public List findByAllModule()
	{
		return (List)getSqlMapClientTemplate().queryForList("XtModule.findByAllModule");
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("UserInfo.findByCount");
	}
	public List findAllUsers(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("UserInfo.findAllUsers",p);
	}
	public List findAllAclLevel()
	{
		return (List)getSqlMapClientTemplate().queryForList("AclLevel.findAllAclLevel");
	}
	public List findAllSs()
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findAllSs");
	}
	public UserInfo findByUserId(Integer s)
	{
		return (UserInfo)getSqlMapClientTemplate().queryForObject("UserInfo.findByUseId",s);
	}
	public void addUserLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	public MemberJfgz findJfgzByCode(String s)
	{
		return (MemberJfgz)getSqlMapClientTemplate().queryForObject("MemberJfgz.findJfgzByCode",s);
	}
	public Integer addJfxx(MemberJfxf a)
	{
		return (Integer)getSqlMapClientTemplate().insert("MemberJfxf.save", a);
	}
	public MemberJfxf findJfxfByCond(MemberJfxf a)
	{
		return (MemberJfxf)getSqlMapClientTemplate().queryForObject("MemberJfxf.findJfxfByCond", a);
	}
}
