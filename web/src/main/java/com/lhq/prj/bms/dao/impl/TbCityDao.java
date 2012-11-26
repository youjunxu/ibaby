package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ITbCityDao;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.core.Page;
public class TbCityDao extends SqlMapClientDaoSupport implements ITbCityDao{
	public void saveCity(TbCity a)
	{
		getSqlMapClientTemplate().insert("TbCity.save", a);
	}
	public Integer deleteByCity(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("TbCity.deleteByCity", s);
	}
	public Integer updateCity(TbCity s) throws Exception {
		return getSqlMapClientTemplate().update("TbCity.updateCity", s);
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("TbCity.findByCount");
	}
	public List findAllSs()
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findAllSs");
	}
	public List findAllCity(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findAllCity",p);
	}
	public List findCityBySs(String p)
	{
		return (List)getSqlMapClientTemplate().queryForList("TbCity.findCityBySs",p);
	}
	public TbCity findCityById(Integer p)
	{
		return (TbCity)getSqlMapClientTemplate().queryForObject("TbCity.findCityById",p);
	}
}
