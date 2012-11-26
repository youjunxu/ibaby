package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IActXxDao;
import com.lhq.prj.bms.po.ActLy;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.ActXx;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.service.IActXxService;

public class ActXxService implements IActXxService{
	private IActXxDao actXxDao;

	public void setActXxDao(IActXxDao aDao) {
		this.actXxDao = aDao;
	}
	public Integer saveActXx(ActXx s) {
		return (Integer)actXxDao.saveActXx(s);
	}
	public boolean updateActXx(ActXx s) throws Exception {
		Integer flag = actXxDao.updateActXx(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deleteActXxById(Integer s) {
		Integer flag = actXxDao.deleteActXxById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public BaDocSh findBADOCSH()
	{
		return actXxDao.findBADOCSH();
	}

	public int findByCount()
	{
		return actXxDao.findByCount();
	}
	public List findAllActXx(Page p) {
		return actXxDao.findAllActXx(p);
	}
	public int findJxzActXxCount()
	{
		return actXxDao.findJxzActXxCount();
	}
	public List findAllJxzActXx(Page p)
	{
		return actXxDao.findAllJxzActXx(p);
	}
	public int findEndActXxCount()
	{
		return actXxDao.findEndActXxCount();
	}
	public List findAllEndActXx(Page p)
	{
		return actXxDao.findAllEndActXx(p);
	}

	public ActXx findActXxById(Integer s) {
		return actXxDao.findActXxById(s);
	}
	public void addActLogInfo(LogInfo a)
	{
		actXxDao.addActLogInfo(a);
	}
	public List findAllLySpgg()
	{
		return actXxDao.findAllLySpgg();
	}
	public boolean deleteActLyById(Integer s) {
		Integer flag = actXxDao.deleteActLyById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public Integer saveActLy(ActLy a) {
		return actXxDao.saveActLy(a);
	}
	public List findAllLyByAct(Integer s) {
		return actXxDao.findAllLyByAct(s);
	}
	public List findAllActLy()
	{
		return actXxDao.findAllActLy();
	}
	public ActLy findActLyById(Integer s)
	{
		return actXxDao.findActLyById(s);
	}
}
