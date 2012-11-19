package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.ILmBaxyDao;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LmBaxy;
import com.lhq.prj.bms.po.BaType;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.PingLun;
import com.lhq.prj.bms.po.SeekLog;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.ILmBaxyService;

public class LmBaxyService implements ILmBaxyService{
	private ILmBaxyDao lmBaxyDao;

	public void setLmBaxyDao(ILmBaxyDao aDao) {
		this.lmBaxyDao = aDao;
	}
	
	public void saveBADOCSH(BaDocSh a)
	{
		lmBaxyDao.saveBADOCSH(a);
	}
	public boolean updateBADOCSH(BaDocSh a)
	{
		Integer flag=lmBaxyDao.updateBADOCSH(a);
		if (flag!=null)
		{
			return true;
		}
		return false;
	}
	public BaDocSh findBADOCSH()
	{
		return lmBaxyDao.findBADOCSH();
	}
	public List findSpggByBaxy()
	{
		return lmBaxyDao.findSpggByBaxy();
	}
	
	public boolean deleteBaxy(Integer s) {
		Integer flag = lmBaxyDao.deleteBaxy(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	
	public Integer saveBaxy(LmBaxy a) {
		return lmBaxyDao.saveBaxy(a);
	}
	public Integer saveSeekLog(SeekLog a)
	{
		return lmBaxyDao.saveSeekLog(a);
	}
	public boolean updateBaReaders(Integer s) {
		Integer flag = lmBaxyDao.updateBaReaders(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaxyShbj(LmBaxy s)
	{
		Integer flag = lmBaxyDao.updateBaxyShbj(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaPlzans(Integer s) {
		Integer flag = lmBaxyDao.updateBaPlzans(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaPlxhs(Integer s) {
		Integer flag = lmBaxyDao.updateBaPlxhs(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaPlhands(Integer s) {
		Integer flag = lmBaxyDao.updateBaPlhands(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaPlyms(Integer s) {
		Integer flag = lmBaxyDao.updateBaPlyms(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaPlcais(Integer s) {
		Integer flag = lmBaxyDao.updateBaPlcais(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateBaxy(LmBaxy s) throws Exception{
		Integer flag = lmBaxyDao.updateBaxy(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updatePingLun(PingLun s) {
		Integer flag = lmBaxyDao.updatePingLun(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findNoYytBaxy() {
		return lmBaxyDao.findNoYytBaxy();
	}
	public List findBaxyByCond(LmBaxy x) {
		return lmBaxyDao.findBaxyByCond(x);
	}
	public BaType findBalxByCond(BaType x) {
		return lmBaxyDao.findBalxByCond(x);
	}
	public List findAllBalx()
	{
		return lmBaxyDao.findAllBalx();
	}
	public List findBaxyByFirstA()
	{
		return lmBaxyDao.findBaxyByFirstA();
	}
	public List findBaxyByFirstB()
	{
		return lmBaxyDao.findBaxyByFirstB();
	}
	public List findBaxyByFirstC()
	{
		return lmBaxyDao.findBaxyByFirstC();
	}
	public List findBaxyByFirstD()
	{
		return lmBaxyDao.findBaxyByFirstD();
	}
	public List findBaxyByFirstE()
	{
		return lmBaxyDao.findBaxyByFirstE();
	}
	public List findBaxyByFirstF()
	{
		return lmBaxyDao.findBaxyByFirstF();
	}
	public void addBaLogInfo(LogInfo a)
	{
		lmBaxyDao.addBaLogInfo(a);
	}
	public Integer addUserJfxx(MemberJfxf a)
	{
		return lmBaxyDao.addUserJfxx(a);
	}
	public MemberJfgz findJfgzByCode(String s)
	{
		return lmBaxyDao.findJfgzByCode(s);
	}
	public boolean updateUser(UserInfo user) throws Exception 
	{
		Integer flag = lmBaxyDao.updateUser(user);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public UserInfo findByUseId(Integer s)
	{
		return lmBaxyDao.findByUseId(s);
	}
	public List findSeekLogByInfo(SeekLog s)
	{
		return lmBaxyDao.findSeekLogByInfo(s);
	}
	public Integer saveTbInbox(TbInbox a)
	{
		return lmBaxyDao.saveTbInbox(a);
	}
	public List findBaxyByAllSys()
	{
		return lmBaxyDao.findBaxyByAllSys();
	}
}
