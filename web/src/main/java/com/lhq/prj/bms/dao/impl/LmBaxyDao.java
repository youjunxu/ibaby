package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.ILmBaxyDao;
import com.lhq.prj.bms.po.LmBaxy;
import com.lhq.prj.bms.po.BaType;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PingLun;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.SeekLog;

public class LmBaxyDao extends SqlMapClientDaoSupport implements ILmBaxyDao{
	public Integer saveBaxy(LmBaxy a)
	{
		return (Integer)getSqlMapClientTemplate().insert("LmBaxy.save", a);
	}
	public Integer saveSeekLog(SeekLog a)
	{
		return (Integer)getSqlMapClientTemplate().insert("SeekLog.save", a);
	}
	public void saveBADOCSH(BaDocSh a)
	{
		getSqlMapClientTemplate().insert("BaDocSh.save", a);
	}
	public Integer updateBADOCSH(BaDocSh a)
	{
		return (Integer)getSqlMapClientTemplate().update("BaDocSh.update", a);
	}
	public BaDocSh findBADOCSH()
	{
		return (BaDocSh)getSqlMapClientTemplate().queryForObject("BaDocSh.findBaDocSh");
	}
	public List findSpggByBaxy()
	{
		return (List)getSqlMapClientTemplate().queryForList("Spgg.findSpggByBaxy");
	}
	public Integer deleteBaxy(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("LmBaxy.deleteById", s);
	}
	public Integer updateBaReaders(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaReaders", s);
	}
	public Integer updateBaxyShbj(LmBaxy s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaxyShbj", s);
	}
	public Integer updateBaPlzans(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaPlzans", s);
	}
	public Integer updateBaPlxhs(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaPlxhs", s);
	}
	public Integer updateBaPlhands(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaPlhands", s);
	}
	public Integer updateBaPlyms(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaPlyms", s);
	}
	public Integer updateBaPlcais(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaPlcais", s);
	}
	public Integer updateBaxy(LmBaxy s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("LmBaxy.updateBaxy", s);
	}
	public Integer updatePingLun(PingLun s)
	{
		return (Integer)getSqlMapClientTemplate().update("PingLun.save", s);
	}
	public List findNoYytBaxy()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByNoYyt");
	}
	public List findBaxyByCond(LmBaxy x)
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByCond",x);
	}
	public BaType findBalxByCond(BaType x)
	{
		return (BaType)getSqlMapClientTemplate().queryForObject("BaType.findBaTypeByCond",x);
	}
	
	public List findAllBalx()
	{
		return (List)getSqlMapClientTemplate().queryForList("BaType.findAllBaType");
	}
	public List findBaxyByFirstA()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstA");
	}
	public List findBaxyByFirstB()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstB");
	}
	public List findBaxyByFirstC()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstC");
	}
	public List findBaxyByFirstD()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstD");
	}
	public List findBaxyByFirstE()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstE");
	}
	public List findBaxyByFirstF()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByFirstF");
	}
	public void addBaLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}
	public Integer addUserJfxx(MemberJfxf a)
	{
		return (Integer)getSqlMapClientTemplate().insert("MemberJfxf.save", a);
	}
	public MemberJfgz findJfgzByCode(String s)
	{
		return (MemberJfgz)getSqlMapClientTemplate().queryForObject("MemberJfgz.findJfgzByCode",s);
	}
	public Integer updateUser(UserInfo user) throws Exception {
		return getSqlMapClientTemplate().update("UserInfo.updateUser", user);
	}
	public UserInfo findByUseId(Integer s)
	{
		return (UserInfo)getSqlMapClientTemplate().queryForObject("UserInfo.findByUseId",s);
	}
	public List findSeekLogByInfo(SeekLog s)
	{
		return (List)getSqlMapClientTemplate().queryForList("SeekLog.findSeekLogByInfo",s);
	}
	public Integer saveTbInbox(TbInbox a)
	{
		return (Integer)getSqlMapClientTemplate().insert("TbInbox.save", a);
	}
	public List findBaxyByAllSys()
	{
		return (List)getSqlMapClientTemplate().queryForList("LmBaxy.findBaxyByAllSys");
	}
}
