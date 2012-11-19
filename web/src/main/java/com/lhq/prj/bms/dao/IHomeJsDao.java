package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.HomeJs;
/**    
 * IHomeJsDao.java Create on 2012-8-4
 * @author andchen
 * @version 1.0  
 */

public interface IHomeJsDao {
	public Integer saveHomeJs(HomeJs s);
	public Integer deleteHomeJsById(Integer s);
	public Integer updateHomeJsBase(HomeJs s) throws Exception;
	public Integer updateHomeJsShbj(HomeJs s) throws Exception;
	public HomeJs findHomeJsById(Integer s);
	public List findAllHomeJsByUserId(Integer s);
	public List findAllHomeJsAByUserId(HomeJs s);
	public List findBADocByEjUser(Integer i);
}
