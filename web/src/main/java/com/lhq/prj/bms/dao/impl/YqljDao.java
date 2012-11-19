package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IYqljDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Yqlj;

public class YqljDao  extends SqlMapClientDaoSupport implements IYqljDao{
	public void saveYqlj(Yqlj a)
	{
		getSqlMapClientTemplate().insert("Yqlj.save",a);
	}
	public Integer deleteYqljById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("Yqlj.deleteById",s);
	}
	public Integer updateYqlj(Yqlj s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("Yqlj.updateYqlj",s);
	}
	public List findAllYqlj()
	{
		return (List)getSqlMapClientTemplate().queryForList("Yqlj.findAllYqlj");
	}
	public Yqlj findYqljById(Integer s)
	{
		return (Yqlj)getSqlMapClientTemplate().queryForObject("Yqlj.findYqljById",s);
	}
	public void addLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}

}
