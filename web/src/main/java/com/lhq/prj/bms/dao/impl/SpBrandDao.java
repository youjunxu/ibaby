package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ISpBrandDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;

public class SpBrandDao extends SqlMapClientDaoSupport implements ISpBrandDao{
	public Integer saveSpBrand(SpBrand s)
	{
		return (Integer) getSqlMapClientTemplate().insert("SpBrand.save",s);
	}
	public Integer saveSpType(SpType s)
	{
		return (Integer) getSqlMapClientTemplate().insert("SpType.save",s);
	}
	public Integer updateSpType(SpType s) throws Exception
	{
		return (Integer) getSqlMapClientTemplate().update("SpType.updateSpType",s);
	}
	public Integer updateSpBrandA(SpBrand s) throws Exception
	{
		return (Integer) getSqlMapClientTemplate().update("SpBrand.updateSpBrandA",s);
	}
	public Integer updateSpBrandB(SpBrand s) throws Exception
	{
		return (Integer) getSqlMapClientTemplate().update("SpBrand.updateSpBrandB",s);
	}
	public Integer updateSpBrandC() throws Exception
	{
		return (Integer) getSqlMapClientTemplate().update("SpType.updateSpBrandC");
	}
	public List findAllSpBrand()
	{
		return (List) getSqlMapClientTemplate().queryForList("SpBrand.findAllSpBrand");
	}
	public List findAllSpType()
	{
		return (List) getSqlMapClientTemplate().queryForList("SpType.findAllSpType");
	}
	public List findBrandByType(Integer s)
	{
		return (List) getSqlMapClientTemplate().queryForList("SpBrand.findBrandByType",s);
	}
	public SpBrand findBrandById(Integer s)
	{
		return (SpBrand) getSqlMapClientTemplate().queryForObject("SpBrand.findBrandById",s);
	}
	public int findPpByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("SpType.findPpByCount");
	}
	public List findAllSpTypeByPage(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("SpType.findAllSpTypeByPage",p);
	}
	public int findSpxhByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("SpBrand.findSpxhByCount");
	}
	public List findAllSpxhByPage(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("SpBrand.findAllSpxhByPage",p);
	}
	public Integer deleteSpTypeById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("SpType.deleteById", s);
	}
	public Integer deleteSpBrandById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("SpBrand.deleteById", s);
	}
	public Integer deleteSpBrandAById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("SpBrand.deleteBySpId", s);
	}
	public void addSpLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	
	public SpType findTypeById(Integer s)
	{
		return (SpType)getSqlMapClientTemplate().queryForObject("SpType.findAllTypeById",s);
	}
	public List findFirstBrandByXh()
	{
		return (List)getSqlMapClientTemplate().queryForList("SpBrand.findFirstBrandByXh");
	}
}
