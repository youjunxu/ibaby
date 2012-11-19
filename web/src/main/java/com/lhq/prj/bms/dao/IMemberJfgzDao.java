package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
/**    
 * IMemberJfgzDao.java Create on 2012-7-4
 * @author andchen
 * @version 1.0  
 */
public interface IMemberJfgzDao {
	public Integer saveJfgz(MemberJfgz m);
	public Integer deleteJfgzById(Integer s);
	public Integer updateJfgz(MemberJfgz s) throws Exception;
	public MemberJfgz findJfgzByCode(String s);
	public List findAllJfgz();
	public void addJfgzLogInfo(LogInfo a);
}
