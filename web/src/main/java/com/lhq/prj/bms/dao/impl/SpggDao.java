package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ISpggDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.core.Page;
public class SpggDao extends SqlMapClientDaoSupport implements ISpggDao{
	public Integer saveSpgg(Spgg a)
	{
		return (Integer)getSqlMapClientTemplate().insert("Spgg.save", a);
	}
	public Integer updateSpgg(Spgg s) throws Exception {
		return getSqlMapClientTemplate().update("Spgg.updateSpgg", s);
	}
	public Integer deleteSpggById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("Spgg.deleteById", s);
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("Spgg.findByCount");
	}
	public List findAllSpgg(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("Spgg.findAllSpgg",p);
	}
	public Spgg findSpggById(Integer s)
	{
		return (Spgg)getSqlMapClientTemplate().queryForObject("Spgg.findSpggById", s);
	}
	public void addGgLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
}
