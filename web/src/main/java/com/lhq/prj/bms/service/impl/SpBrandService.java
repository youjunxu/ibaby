package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ISpBrandDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.service.ISpBrandService;
public class SpBrandService implements ISpBrandService{
	private ISpBrandDao spBrandDao;

	public void setSpBrandDao(ISpBrandDao aDao) {
		this.spBrandDao = aDao;
	}
	public Integer saveSpType(SpType p)
	{
		return spBrandDao.saveSpType(p);
	}
	public Integer saveSpBrand(SpBrand p)
	{
		return spBrandDao.saveSpBrand(p);
	}
	public boolean updateSpBrandA(SpBrand p) throws Exception
	{
		Integer flag = spBrandDao.updateSpBrandA(p);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateSpBrandB(SpBrand p) throws Exception
	{
		Integer flag = spBrandDao.updateSpBrandB(p);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateSpBrandC() throws Exception
	{
		Integer flag = spBrandDao.updateSpBrandC();
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateSpType(SpType p) throws Exception
	{
		Integer flag = spBrandDao.updateSpType(p);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public List findAllSpBrand() {
		return spBrandDao.findAllSpBrand();
	}
	public List findAllSpType()
	{
		return spBrandDao.findAllSpType();
	}
	public List findBrandByType(Integer s) {
		return spBrandDao.findBrandByType(s);
	}
	public SpBrand findBrandById(Integer s)
	{
		return spBrandDao.findBrandById(s);
	}
	public int findPpByCount()
	{
		return spBrandDao.findPpByCount();
	}
	public List findAllSpTypeByPage(Page p)
	{
		return spBrandDao.findAllSpTypeByPage(p);
	}
	public int findSpxhByCount()
	{
		return spBrandDao.findSpxhByCount();
	}
	public List findAllSpxhByPage(Page p)
	{
		return spBrandDao.findAllSpxhByPage(p);
	}
	public boolean deleteSpTypeById(Integer s)
	{
		Integer flag = spBrandDao.deleteSpTypeById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deleteSpBrandById(Integer s)
	{
		Integer flag = spBrandDao.deleteSpBrandById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deleteSpBrandAById(Integer s)
	{
		Integer flag = spBrandDao.deleteSpBrandAById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public void addSpLogInfo(LogInfo a)
	{
		spBrandDao.addSpLogInfo(a);
	}
	public SpType findTypeById(Integer s)
	{
		return spBrandDao.findTypeById(s);
	}
	public List findFirstBrandByXh()
	{
		return spBrandDao.findFirstBrandByXh();
	}
}
