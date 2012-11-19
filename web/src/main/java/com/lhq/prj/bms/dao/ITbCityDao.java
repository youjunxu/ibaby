package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.TbCity;
import com.lhq.prj.bms.core.Page;
/**    
 * ITbCityDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ITbCityDao {
	public void saveCity(TbCity c);
	public Integer deleteByCity(Integer s);
	public Integer updateCity(TbCity s) throws Exception;
	public int findByCount();
	public List findAllCity(Page page);
	public TbCity findCityById(Integer s);
	public List findCityBySs(String s);
	public List findAllSs();
}
