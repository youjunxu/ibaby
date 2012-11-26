package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.dao.IMemberJfgzDao;

public class MemberJfgzDao extends SqlMapClientDaoSupport implements IMemberJfgzDao{
	public Integer saveJfgz(MemberJfgz m)
	{
		return (Integer)getSqlMapClientTemplate().insert("MemberJfgz.save", m);
	}
	public Integer deleteJfgzById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("MemberJfgz.deleteById", s);
	}
	public Integer updateJfgz(MemberJfgz s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("MemberJfgz.updateJfgz", s);
	}
	public MemberJfgz findJfgzByCode(String s){
		return (MemberJfgz)getSqlMapClientTemplate().queryForObject("MemberJfgz.findJfgzByCode",s);
	}

	public List findAllJfgz()
	{
		return (List)getSqlMapClientTemplate().queryForList("MemberJfgz.findAllJfgz");
	}
	public void addJfgzLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}

}
