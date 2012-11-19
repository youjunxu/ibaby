package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.core.Page;
/**    
 * ITbCityService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ITbCityService {
	void saveCity(TbCity c);
	Boolean deleteByCity(Integer s);
	Boolean updateCity(TbCity s) throws Exception;
	int findByCount();
	List findAllCity(Page page);
	List findCityBySs(String s);
	TbCity findCityById(Integer s);
	List findAllSs();
}
