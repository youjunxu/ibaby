package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import java.util.List;
import com.lhq.prj.bms.dao.ITsjyDao;
import com.lhq.prj.bms.po.Tsjy;
import com.lhq.prj.bms.core.Page;
/**
 * TsjyDao.java Create on 2012-6-4
 * @author andchen
 * @version 1.0
 */

public class TsjyDao extends SqlMapClientDaoSupport implements ITsjyDao{
	public Integer saveTsjy(Tsjy a)
	{
		return (Integer)getSqlMapClientTemplate().insert("Tsjy.save", a);
	}
	public Integer saveTsjyHf(Tsjy a)
	{
		return (Integer)getSqlMapClientTemplate().update("Tsjy.saveTsjyHf", a);
	}
	public Integer deleteTsjyById(Integer s)
	{
		return (Integer) getSqlMapClientTemplate().delete("Tsjy.deleteById", s);
	}
	public List findAllTsjy(Page p)
	{
		return (List) getSqlMapClientTemplate().queryForList("Tsjy.findAllTsjy",p);
	}
	public int findByCount()
	{
		return (Integer) getSqlMapClientTemplate().queryForObject("Tsjy.findByCount");
	}
	public Tsjy findTsjyById(Integer s)
	{
		return (Tsjy) getSqlMapClientTemplate().queryForObject("Tsjy.findTsjyById", s);
	}

}
