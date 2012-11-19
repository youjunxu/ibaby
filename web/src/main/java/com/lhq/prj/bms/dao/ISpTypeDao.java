package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;

/**    
 * ISpTypeDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ISpTypeDao {
	public List findAllSpType();
	public void addSpTypeLogInfo(LogInfo a);
}
