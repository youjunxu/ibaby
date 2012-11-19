package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.Tsjy;
import com.lhq.prj.bms.core.Page;
/**    
 * ITsjyDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface ITsjyDao {
	public Integer saveTsjy(Tsjy t);
	public Integer saveTsjyHf(Tsjy t);
	public Integer deleteTsjyById(Integer s);
	public List findAllTsjy(Page p);
	public int findByCount();
	public Tsjy findTsjyById(Integer s);
}

