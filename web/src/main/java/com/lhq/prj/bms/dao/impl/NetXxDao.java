package com.lhq.prj.bms.dao.impl;

import com.lhq.prj.bms.po.NetXx;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.INetXxDao;

public class NetXxDao extends SqlMapClientDaoSupport implements INetXxDao{
	public void saveNetXx(NetXx a)
	{
		getSqlMapClientTemplate().insert("NetXx.save", a);
	}
	public NetXx findNetXx()
	{
		return (NetXx)getSqlMapClientTemplate().queryForObject("NetXx.findNetXx");
	}
	public Integer updateNetXx(NetXx a) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("NetXx.updateNetXx", a);
	}

}
