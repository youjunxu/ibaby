package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.LogMemo;

/**    
 * ILogMemoService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ILogMemoService {
	void addLogMemo(LogMemo x);
	boolean deleteLogMemo(LogMemo s);
	List findAllLogMemo(LogMemo s);
}
