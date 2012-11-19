package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.HomeJs;
/**    
 * IHomeJsService.java Create on 2012-8-4
 * @author andchen
 * @version 1.0  
 */

public interface IHomeJsService {
	Integer saveHomeJs(HomeJs s);
	boolean deleteHomeJsById(Integer s);
	boolean updateHomeJsBase(HomeJs s) throws Exception;
	boolean updateHomeJsShbj(HomeJs s) throws Exception;
	HomeJs findHomeJsById(Integer s);
	List findAllHomeJsByUserId(Integer s);
	List findAllHomeJsAByUserId(HomeJs s);
	List findBADocByEjUser(Integer i);
}
