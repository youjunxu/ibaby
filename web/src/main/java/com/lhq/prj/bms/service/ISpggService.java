package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.core.Page;
/**    
 * ISpggService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ISpggService {
	Integer saveSpgg(Spgg a);
	boolean updateSpgg(Spgg a) throws Exception;
	boolean deleteSpggById(Integer s);
	int findByCount();
	List findAllSpgg(Page p);
	Spgg findSpggById(Integer s);
	void addGgLogInfo(LogInfo a);
}
