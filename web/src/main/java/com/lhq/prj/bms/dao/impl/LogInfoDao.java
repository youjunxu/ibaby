package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ILogInfoDao;
import com.lhq.prj.bms.po.LogInfo;

public class LogInfoDao extends SqlMapClientDaoSupport implements ILogInfoDao{
	public void addLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	public Integer deleteLogInfo(LogInfo s)
	{
		return getSqlMapClientTemplate().delete("LogInfo.deleteLogInfo", s);
	}
	public List findAllLogInfo(LogInfo s)
	{
		return getSqlMapClientTemplate().queryForList("LogInfo.findAllLogInfo",s);
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("LogInfo.findByCount");
	}
	public List findAllLogxx(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("LogInfo.findAllLogxx",p);
	}
}
