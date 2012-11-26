package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IEjDocumentsDao;
import com.lhq.prj.bms.po.UserEj;
/**
 * EjDocumentsDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */

public class EjDocumentsDao extends SqlMapClientDaoSupport implements IEjDocumentsDao{
	public UserEj findEjById(Integer i)
	{
		return (UserEj)getSqlMapClientTemplate().queryForObject("UserEj.findEjById",i);
	}
	public List findAllDocByUserId(Integer i)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findAllDocByUserId",i);
	}
	public List findBADocByEjUser(Integer i)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findBADocByUserId",i);
	}
	public List findBADocAByEjUser(Integer i)
	{
		return (List)getSqlMapClientTemplate().queryForList("EjDocuments.findBADocAByUserId",i);
	}
	public List findAllHomeJsByUserId(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("HomeJs.findAllHomeJsByUserId",s);
	}

}
