package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LmBaxy;
import com.lhq.prj.bms.po.BaType;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.po.MemberJfxf;
import com.lhq.prj.bms.po.PingLun;
import com.lhq.prj.bms.po.SeekLog;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserInfo;

/**    
 * ILmBaxyService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface ILmBaxyService {
	Integer saveBaxy(LmBaxy x);
	Integer saveSeekLog(SeekLog a);
	void saveBADOCSH(BaDocSh a);
	boolean updateBADOCSH(BaDocSh a);
	BaDocSh findBADOCSH();
	List findSpggByBaxy();
	boolean deleteBaxy(Integer s);
	boolean updateBaReaders(Integer x);
	boolean updateBaxyShbj(LmBaxy s);
	boolean updateBaPlzans(Integer x);
	boolean updateBaPlxhs(Integer x);
	boolean updateBaPlhands(Integer x);
	boolean updateBaPlyms(Integer x);
	boolean updateBaPlcais(Integer x);
	boolean updateBaxy(LmBaxy x) throws Exception;
	boolean updatePingLun(PingLun s);
	List findNoYytBaxy();
	List findBaxyByCond(LmBaxy x);
	BaType findBalxByCond(BaType x);
	List findAllBalx();
	List findBaxyByFirstA();
	List findBaxyByFirstB();
	List findBaxyByFirstC();
	List findBaxyByFirstD();
	List findBaxyByFirstE();
	List findBaxyByFirstF();
	void addBaLogInfo(LogInfo a);
	Integer addUserJfxx(MemberJfxf a);
	MemberJfgz findJfgzByCode(String s);
	boolean updateUser(UserInfo user) throws Exception ;
	UserInfo findByUseId(Integer s);
	List findSeekLogByInfo(SeekLog s);
	Integer saveTbInbox(TbInbox a);
	List findBaxyByAllSys();
}

