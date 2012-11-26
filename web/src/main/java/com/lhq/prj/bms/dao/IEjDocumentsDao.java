package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.UserEj;
/**    
 * IEjDocumentsDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IEjDocumentsDao {
	public UserEj findEjById(Integer i);
	public List findAllDocByUserId(Integer i);
	public List findBADocByEjUser(Integer i);
	public List findBADocAByEjUser(Integer i);
	public List findAllHomeJsByUserId(Integer s);
}
