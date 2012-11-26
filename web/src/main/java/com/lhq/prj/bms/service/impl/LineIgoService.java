package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.ILineIgoDao;
import com.lhq.prj.bms.po.LineIgo;
import com.lhq.prj.bms.po.LineIgoM;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.service.ILineIgoService;
import com.lhq.prj.bms.core.Page;

/**
 * AclLevelService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class LineIgoService implements ILineIgoService{
	private ILineIgoDao lineIgoDao;

	public void setLineIgoDao(ILineIgoDao aDao) {
		this.lineIgoDao = aDao;
	}
	public int saveLineIgo(LineIgo user)
	{
		return lineIgoDao.saveLineIgo(user);
	}
	public boolean deleteIgoById(Integer s)
	{
		Integer flag=lineIgoDao.deleteIgoById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updateIgo(LineIgo s) throws Exception
	{
		Integer flag=lineIgoDao.updateIgo(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public int findByCount()
	{
		return lineIgoDao.findByCount();
	}
	public List findAllIgo(Page p)
	{
		return lineIgoDao.findAllIgo(p);
	}
	public List findAllIgoA(Page p)
	{
		return lineIgoDao.findAllIgoA(p);
	}
	public List findAllSpType()
	{
		return lineIgoDao.findAllSpType();
	}
	public List findAllSpBrand()
	{
		return lineIgoDao.findAllSpBrand();
	}
	public List findBrandByType(Integer s)
	{
		return lineIgoDao.findBrandByType(s);
	}
	public LineIgo findIgoById(Integer p)
	{
		return lineIgoDao.findIgoById(p);
	}
	public List findIgoByCond(LineIgoM p)
	{
		return lineIgoDao.findIgoByCond(p);
	}
	public SpType findAllTypeById(Integer s)
	{
		return lineIgoDao.findAllTypeById(s);
	}
	public SpBrand findBrandById(Integer s)
	{
		return lineIgoDao.findBrandById(s);
	}
	public List findFirstBrandByXh()
	{
		return lineIgoDao.findFirstBrandByXh();
	}
	public List findFirstBrandByTypeXh(Integer s)
	{
		return lineIgoDao.findFirstBrandByTypeXh(s);
	}
}
