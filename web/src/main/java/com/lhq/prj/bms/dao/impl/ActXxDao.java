package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IActXxDao;
import com.lhq.prj.bms.po.ActLy;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.ActXx;
import com.lhq.prj.bms.core.Page;
public class ActXxDao extends SqlMapClientDaoSupport implements IActXxDao{
	public Integer saveActXx(ActXx a)
	{
		return (Integer)getSqlMapClientTemplate().insert("ActXx.save", a);
	}
	public Integer updateActXx(ActXx s) throws Exception {
		return getSqlMapClientTemplate().update("ActXx.updateActXx", s);
	}
	public Integer deleteActXxById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("ActXx.deleteById", s);
	}
	public BaDocSh findBADOCSH()
	{
		return (BaDocSh)getSqlMapClientTemplate().queryForObject("BaDocSh.findBaDocSh");
	}
	public int findByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("ActXx.findByCount");
	}
	public List findAllActXx(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("ActXx.findAllActXx",p);
	}
	public int findJxzActXxCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("ActXx.findJxzActXxCount");
	}
	public List findAllJxzActXx(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("ActXx.findAllActXxA",p);
	}
	public int findEndActXxCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("ActXx.findEndActXxCount");
	}
	public List findAllEndActXx(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("ActXx.findAllActXxB",p);
	}
	public ActXx findActXxById(Integer s)
	{
		return (ActXx)getSqlMapClientTemplate().queryForObject("ActXx.findActXxById", s);
	}
	public void addActLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	
	public List findAllLySpgg()
	{
		return (List)getSqlMapClientTemplate().queryForList("Spgg.findAllLySpgg");
	}
	public Integer saveActLy(ActLy s)
	{
		return (Integer)getSqlMapClientTemplate().insert("ActLy.save",s);
	}
	public Integer deleteActLyById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("ActLy.deleteById",s);
	}
	public List findAllLyByAct(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("ActLy.findAllLyByAct",s);
	}
	public List findAllActLy()
	{
		return (List)getSqlMapClientTemplate().queryForList("ActLy.findAllActLy");
	}
	public ActLy findActLyById(Integer s)
	{
		return (ActLy)getSqlMapClientTemplate().queryForObject("ActLy.findActLyById",s);
	}

}
