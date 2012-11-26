package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IHomeJsDao;
import com.lhq.prj.bms.po.HomeJs;
import java.util.List;

public class HomeJsDao extends SqlMapClientDaoSupport implements IHomeJsDao{
	public Integer saveHomeJs(HomeJs s)
	{
		return (Integer)getSqlMapClientTemplate().insert("HomeJs.save", s);
	}
	public Integer deleteHomeJsById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("HomeJs.deleteById", s);
	}
	public Integer updateHomeJsBase(HomeJs s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("HomeJs.updateHomeJsMain",s);
	}
	public Integer updateHomeJsShbj(HomeJs s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("HomeJs.updateHomeJsShbj",s);
	}
	public HomeJs findHomeJsById(Integer s)
	{
		return (HomeJs)getSqlMapClientTemplate().queryForObject("HomeJs.findHomeJsById",s);
	}
	public List findAllHomeJsByUserId(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("HomeJs.findAllHomeJsByUserId",s);
	}
	public List findAllHomeJsAByUserId(HomeJs s)
	{
		return (List)getSqlMapClientTemplate().queryForList("HomeJs.findAllHomeJsAByUserId",s);
	}
	public List findBADocByEjUser(Integer i)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findBADocByUserId",i);
	}

}
