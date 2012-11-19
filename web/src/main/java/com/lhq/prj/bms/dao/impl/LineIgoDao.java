package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ILineIgoDao;
import com.lhq.prj.bms.po.LineIgo;
import com.lhq.prj.bms.po.LineIgoM;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.core.Page;
import java.util.List;
/**
 * LineIgoDao Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class LineIgoDao extends SqlMapClientDaoSupport implements ILineIgoDao{
	public Integer saveLineIgo(LineIgo a)
	{
		return (Integer)getSqlMapClientTemplate().insert("LineIgo.save", a);
	}
	public Integer deleteIgoById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("LineIgo.deleteById", s);
	}
	public Integer updateIgo(LineIgo s) throws Exception {
		return (Integer)getSqlMapClientTemplate().update("LineIgo.updateIgo", s);
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("LineIgo.findByCount");
	}
	public LineIgo findIgoById(Integer p)
	{
		return (LineIgo)getSqlMapClientTemplate().queryForObject("LineIgo.findIgoById",p);
	}
	public List findAllIgo(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("LineIgo.findAllIGO",p);
	}
	public List findAllIgoA(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("LineIgo.findAllIGOA",p);
	}
	public List findAllSpType()
	{
		return (List) getSqlMapClientTemplate().queryForList("SpType.findAllSpType");
	}
	public List findAllSpBrand()
	{
		return (List) getSqlMapClientTemplate().queryForList("SpBrand.findAllSpBrand");
	}
	public List findBrandByType(Integer s)
	{
		return (List) getSqlMapClientTemplate().queryForList("SpBrand.findBrandByType",s);
	}
	public List findIgoByCond(LineIgoM p)
	{
		return (List)getSqlMapClientTemplate().queryForList("LineIgo.findIgoByCond",p);
	}
	public SpType findAllTypeById(Integer s)
	{
		return (SpType)getSqlMapClientTemplate().queryForObject("SpType.findAllTypeById",s);
	}
	public SpBrand findBrandById(Integer s)
	{
		return (SpBrand)getSqlMapClientTemplate().queryForObject("SpBrand.findBrandById",s);
	}
	public List findFirstBrandByXh()
	{
		return (List)getSqlMapClientTemplate().queryForList("SpBrand.findFirstBrandByXh");
	}
	public List findFirstBrandByTypeXh(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("SpBrand.findFirstBrandByTypeXh",s);
	}

}
