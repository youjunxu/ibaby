package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ISpTypeDao;
import com.lhq.prj.bms.po.LogInfo;

public class SpTypeDao extends SqlMapClientDaoSupport implements ISpTypeDao{
	public List findAllSpType()
	{
		return getSqlMapClientTemplate().queryForList("SpType.findAllSpType");
	}
	public void addSpTypeLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}

}
