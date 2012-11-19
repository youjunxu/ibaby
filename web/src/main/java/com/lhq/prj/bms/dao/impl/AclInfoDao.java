package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IAclInfoDao;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.core.Page;
/**
 * AclInfoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class AclInfoDao extends SqlMapClientDaoSupport implements IAclInfoDao{
	public void saveAclInfo(AclInfo a)
	{
		getSqlMapClientTemplate().insert("AclInfo.save", a);
	}
	public Integer deleteByAclInfo(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("AclInfo.deleteById", s);
	}
	public Integer updateAclInfo(AclInfo s)
	{
		return (Integer)getSqlMapClientTemplate().update("AclInfo.updateAclInfo", s);
	}
	public List findByUserName(AclInfo s)
	{
		return (List)getSqlMapClientTemplate().queryForList("AclInfo.findByUserName", s);
	}
	public AclInfo findAclById(Integer s)
	{
		return (AclInfo)getSqlMapClientTemplate().queryForObject("AclInfo.findAclById", s);
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("AclInfo.findByCount");
	}
	public List findAllAclInfo(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("AclInfo.findAllAclInfo",p);
	}
	public UserInfo findUserById(UserInfo s){
		return (UserInfo)getSqlMapClientTemplate().queryForObject("UserInfo.findByUserName",s);
	}

	public List findAllAclLevel()
	{
		return (List)getSqlMapClientTemplate().queryForList("AclLevel.findAllAclLevel");
	}
	public List findAclByAdd(AclInfo s)
	{
		return (List)getSqlMapClientTemplate().queryForList("AclInfo.findAclByAdd",s);
	}
	public Integer chgAclSx(AclInfo a) throws Exception {
		return getSqlMapClientTemplate().update("AclInfo.chgAclSx", a);
	}
	public void addAclLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}

}
