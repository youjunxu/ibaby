package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Yqlj;

public interface IYqljDao {
	public void saveYqlj(Yqlj a);
	public Integer deleteYqljById(Integer s);
	public Integer updateYqlj(Yqlj s) throws Exception;
	public List findAllYqlj();
	public Yqlj findYqljById(Integer s);
	public void addLogInfo(LogInfo a);
}
