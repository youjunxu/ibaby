package com.lhq.prj.bms.service.impl;

import java.util.List;
import com.lhq.prj.bms.dao.IMailInfoDao;
import com.lhq.prj.bms.service.IMailInfoService;

public class MailInfoService implements IMailInfoService{
	private IMailInfoDao mailInfoDao;

	public void setMailInfoDao(IMailInfoDao aDao) {
		this.mailInfoDao = aDao;
	}
	public List findMailInfo() {
		return (List) mailInfoDao.findMailInfo();
	}
}
