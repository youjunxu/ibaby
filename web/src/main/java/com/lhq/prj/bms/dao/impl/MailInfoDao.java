package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IMailInfoDao;

public class MailInfoDao extends SqlMapClientDaoSupport implements IMailInfoDao{
	public List findMailInfo()
	{
		return getSqlMapClientTemplate().queryForList("MailInfo.findMailInfo");
	}

}
