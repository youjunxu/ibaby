package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.Tsjy;
import com.lhq.prj.bms.core.Page;
/**    
 * ITsjyService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface ITsjyService {
	Integer saveTsjy(Tsjy s);
	boolean saveTsjyHf(Tsjy s);
	boolean deleteTsjyById(Integer s);
	List findAllTsjy(Page p);
	int findByCount();
	Tsjy findTsjyById(Integer s);
}
