package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.service.ITbCityService;
import com.lhq.prj.bms.dao.ITbCityDao;
import com.lhq.prj.bms.core.Page;
/**    
 * TbCityService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public class TbCityService implements ITbCityService{
	ITbCityDao tbCityDao;
	public void setTbCityDao(ITbCityDao d)
	{
		this.tbCityDao=d;
	}
	public void saveCity(TbCity c)
	{
		tbCityDao.saveCity(c);
	}
	public Boolean deleteByCity(Integer s)
	{
		Integer flag = tbCityDao.deleteByCity(s);
		if (flag != null) {
			return true;
		}
		return false;	
	}
	public Boolean updateCity(TbCity s) throws Exception
	{
		Integer flag = tbCityDao.updateCity(s);
		if (flag != null) {
			return true;
		}
		return false;	
	}
	public List findAllSs()
	{
		return tbCityDao.findAllSs();
	}
	public int findByCount()
	{
		return tbCityDao.findByCount();
	}
	public List findAllCity(Page page)
	{
		return tbCityDao.findAllCity(page);
	}
	public TbCity findCityById(Integer s)
	{
		return tbCityDao.findCityById(s);
	}
	public List findCityBySs(String s)
	{
		return tbCityDao.findCityBySs(s);
	}
}
