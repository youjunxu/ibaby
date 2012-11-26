package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.XtModule;

/**    
 * IXtModuleDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IXtModuleDao {
	public void saveModule(XtModule x);
	public Integer deleteModule(Integer s);
	public Integer updateModule(XtModule x);
	public List findByAllModule();
}
