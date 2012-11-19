package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
/**    
 * ISpTypeService.java Create on 2012-6-4
 * @author andchen
 * @version 1.0  
 */
public interface ISpTypeService {
	List findAllSpType();
	void addSpTypeLogInfo(LogInfo a);
}
