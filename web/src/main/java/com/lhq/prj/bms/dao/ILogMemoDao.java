package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LogMemo;

/**    
 * ILogMemoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ILogMemoDao {
	public void addLogMemo(LogMemo x);
	public Integer deleteLogMemo(LogMemo s);
	public List findAllLogMemo(LogMemo x);

}
