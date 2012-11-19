package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.core.Page;
/**    
 * ISpggDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface ISpggDao {
	public Integer saveSpgg(Spgg a);
	public Integer deleteSpggById(Integer s);
	public int findByCount();
	public List findAllSpgg(Page p);
	public Spgg findSpggById(Integer s);
	public Integer updateSpgg(Spgg g) throws Exception;
	public void addGgLogInfo(LogInfo a);
}
