package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;

/**    
 * ILogInfoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ILogInfoDao {
	public void addLogInfo(LogInfo x);
	public Integer deleteLogInfo(LogInfo s);
	public List findAllLogInfo(LogInfo x);
	public int findByCount();
	public List findAllLogxx(Page p);
}
