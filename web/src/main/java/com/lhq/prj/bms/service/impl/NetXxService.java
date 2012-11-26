package com.lhq.prj.bms.service.impl;

import com.lhq.prj.bms.po.NetXx;
import com.lhq.prj.bms.service.INetXxService;
import com.lhq.prj.bms.dao.INetXxDao;

public class NetXxService implements INetXxService{
	public INetXxDao netXxDao;
	public void setNetXxDao(INetXxDao a)
	{
		this.netXxDao=a;
	}
	public void saveNetXx(NetXx a)
	{
		netXxDao.saveNetXx(a);
	}
	public NetXx findNetXx()
	{
		return netXxDao.findNetXx();
	}
	public boolean updateNetXx(NetXx a) throws Exception
	{
		Integer flag =netXxDao.updateNetXx(a);
		if (flag != null) {
			return true;
		}
		return false;
	}

}
