package com.lhq.prj.bms.service;

import com.lhq.prj.bms.po.NetXx;

public interface INetXxService {
	void saveNetXx(NetXx a);
	NetXx findNetXx();
	boolean updateNetXx(NetXx a) throws Exception;
}
