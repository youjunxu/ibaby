package com.lhq.prj.bms.dao;

import com.lhq.prj.bms.po.NetXx;

public interface INetXxDao {
	public void saveNetXx(NetXx a);
	public NetXx findNetXx();
	public Integer updateNetXx(NetXx a) throws Exception;
}
