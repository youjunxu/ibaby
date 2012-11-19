package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;

public interface IMemberJfgzService {
	Integer saveJfgz(MemberJfgz m);
	boolean deleteJfgzById(Integer s);
	boolean updateJfgz(MemberJfgz s) throws Exception;
	MemberJfgz findJfgzByCode(String s);
	List findAllJfgz();
	void addJfgzLogInfo(LogInfo a);
}
