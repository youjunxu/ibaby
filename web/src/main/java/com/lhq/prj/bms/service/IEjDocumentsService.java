package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.UserEj;
/**    
 * IEjDocumentsService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IEjDocumentsService {
	UserEj findEjById(Integer i);
	List findAllDocByUserId(Integer i);
	List findBADocByEjUser(Integer i);
	List findBADocAByEjUser(Integer i);
	List findAllHomeJsByUserId(Integer s);
}
