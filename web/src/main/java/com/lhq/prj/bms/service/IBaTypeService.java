package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.BaType;

/**    
 * IBaTypeService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IBaTypeService {
	void saveBaType(BaType x);
	boolean deleteBaType(Integer s);
	boolean updateBaType(BaType x) throws Exception;
	List findAllBaType();
}

