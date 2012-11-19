package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.XtModule;

/**    
 * IXtModuleService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IXtModuleService {
	void saveModule(XtModule x);
	boolean deleteModule(Integer s);
	boolean updateModule(XtModule x) throws Exception;
	List findByAllModule();
}
