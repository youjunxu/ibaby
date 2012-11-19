package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;

public interface ISpBrandDao {
	public Integer saveSpType(SpType p);
	public Integer saveSpBrand(SpBrand p);
	public Integer updateSpType(SpType p) throws Exception;
	public Integer updateSpBrandA(SpBrand p) throws Exception;
	public Integer updateSpBrandB(SpBrand p) throws Exception;
	public Integer updateSpBrandC() throws Exception;
	public List findAllSpBrand();
	public List findBrandByType(Integer s);
	public SpBrand findBrandById(Integer s);
	public int findPpByCount();
	public List findAllSpType();
	public List findAllSpTypeByPage(Page p);
	public int findSpxhByCount();
	public List findAllSpxhByPage(Page p);
	public Integer deleteSpTypeById(Integer s);
	public Integer deleteSpBrandById(Integer s);
	public Integer deleteSpBrandAById(Integer s);
	public void addSpLogInfo(LogInfo a);
	public SpType findTypeById(Integer s);
	public List findFirstBrandByXh();
}
