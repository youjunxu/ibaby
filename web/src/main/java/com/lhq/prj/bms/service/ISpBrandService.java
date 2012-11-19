package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;
/**    
 * ISpBrandService.java Create on 2012-6-4
 * @author andchen
 * @version 1.0  
 */
public interface ISpBrandService {
	Integer saveSpType(SpType p);
	Integer saveSpBrand(SpBrand p);
	boolean updateSpBrandA(SpBrand p) throws Exception;
	boolean updateSpBrandB(SpBrand p) throws Exception;
	boolean updateSpBrandC() throws Exception;
	boolean updateSpType(SpType p) throws Exception;
	List findAllSpBrand();
	List findAllSpType();
	List findBrandByType(Integer s);
	SpBrand findBrandById(Integer s);
	int findPpByCount();
	List findAllSpTypeByPage(Page p);
	int findSpxhByCount();
	List findAllSpxhByPage(Page p);
	boolean deleteSpTypeById(Integer s);
	boolean deleteSpBrandById(Integer s);
	boolean deleteSpBrandAById(Integer s);
	void addSpLogInfo(LogInfo a);
	SpType findTypeById(Integer s);
	List findFirstBrandByXh();
}
