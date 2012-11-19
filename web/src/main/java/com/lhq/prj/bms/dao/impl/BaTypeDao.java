package com.lhq.prj.bms.dao.impl;


import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IBaTypeDao;
import com.lhq.prj.bms.po.BaType;

public class BaTypeDao extends SqlMapClientDaoSupport implements IBaTypeDao{
	public void saveBaType(BaType a)
	{
		getSqlMapClientTemplate().insert("BaType.save", a);
	}
	public Integer deleteBaType(Integer s)
	{
		return getSqlMapClientTemplate().delete("BaType.deleteBaType", s);
	}
	public Integer updateBaType(BaType s)
	{
		return getSqlMapClientTemplate().update("BaType.updateBaType", s);
	}
	public List findAllBaType()
	{
		return (List)getSqlMapClientTemplate().queryForList("BaType.findAllBaType");
	}

}
