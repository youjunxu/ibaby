package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IXtModuleDao;
import com.lhq.prj.bms.po.XtModule;

public class XtModuleDao extends SqlMapClientDaoSupport implements IXtModuleDao{
	public void saveModule(XtModule a)
	{
		getSqlMapClientTemplate().insert("XtModule.save", a);
	}
	public Integer deleteModule(Integer s)
	{
		return getSqlMapClientTemplate().delete("XtModule.deleteById", s);
	}
	public Integer updateModule(XtModule s)
	{
		return getSqlMapClientTemplate().update("XtModule.updateModule", s);
	}
	public List findByAllModule()
	{
		return getSqlMapClientTemplate().queryForList("XtModule.findByAllModule");
	}

}
