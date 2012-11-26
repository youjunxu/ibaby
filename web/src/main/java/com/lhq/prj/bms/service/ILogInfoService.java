package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
/**    
 * ILogInfoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ILogInfoService {
	void addLogInfo(LogInfo log);
	boolean deleteLogInfo(LogInfo s);
	List findAllLogInfo(LogInfo s);
	int findByCount();
	List findAllLogxx(Page p);
}
