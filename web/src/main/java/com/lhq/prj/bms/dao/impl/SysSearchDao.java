package com.lhq.prj.bms.dao.impl;

import java.util.List;
import com.lhq.prj.bms.po.SysSearch;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ISysSearchDao;
public class SysSearchDao extends SqlMapClientDaoSupport implements ISysSearchDao{
	public List findAllDocInfoByCond(SysSearch s)
	{
		return (List)getSqlMapClientTemplate().queryForList("SysSearch.findDocInfoByCondA", s);
	}
}
