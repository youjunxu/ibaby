package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Yqlj;

public interface IYqljService {
	void saveYqlj(Yqlj a);
	boolean deleteYqljById(Integer s);
	boolean updateYqlj(Yqlj s) throws Exception;
	List findAllYqlj();
	Yqlj findYqljById(Integer s);
	void addLogInfo(LogInfo a);
}
