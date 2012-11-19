package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ILogMemoDao;
import com.lhq.prj.bms.po.LogMemo;

public class LogMemoDao extends SqlMapClientDaoSupport implements ILogMemoDao{
	public void addLogMemo(LogMemo a)
	{
		getSqlMapClientTemplate().insert("LogMemo.save", a);
	}
	public Integer deleteLogMemo(LogMemo s)
	{
		return getSqlMapClientTemplate().delete("LogMemo.deleteLogMemo", s);
	}
	public List findAllLogMemo(LogMemo s)
	{
		return getSqlMapClientTemplate().queryForList("LogMemo.findAllLogMemo",s);
	}
}
