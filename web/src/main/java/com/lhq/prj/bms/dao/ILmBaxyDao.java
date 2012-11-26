package com.lhq.prj.bms.dao;

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
 * ILmBaxyDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface ILmBaxyDao {
	public Integer saveBaxy(LmBaxy x);
	public Integer saveSeekLog(SeekLog a);
	public void saveBADOCSH(BaDocSh a);
	public Integer updateBADOCSH(BaDocSh a);
	public BaDocSh findBADOCSH();
	public List findSpggByBaxy();
	public Integer deleteBaxy(Integer s);
	public Integer updateBaReaders(Integer x);
	public Integer updateBaxyShbj(LmBaxy s);
	public Integer updateBaPlzans(Integer x);
	public Integer updateBaPlxhs(Integer x);
	public Integer updateBaPlhands(Integer x);
	public Integer updateBaPlyms(Integer x);
	public Integer updateBaPlcais(Integer x);
	public Integer updateBaxy(LmBaxy x) throws Exception;
	public Integer updatePingLun(PingLun s);
	public List findNoYytBaxy();
	public List findBaxyByCond(LmBaxy x);
	public BaType findBalxByCond(BaType x);
	public List findAllBalx();
	public List findBaxyByFirstA();
	public List findBaxyByFirstB();
	public List findBaxyByFirstC();
	public List findBaxyByFirstD();
	public List findBaxyByFirstE();
	public List findBaxyByFirstF();
	public void addBaLogInfo(LogInfo a);
	public Integer addUserJfxx(MemberJfxf a);
	public MemberJfgz findJfgzByCode(String s);
	public Integer updateUser(UserInfo user) throws Exception;
	public UserInfo findByUseId(Integer s);
	public List findSeekLogByInfo(SeekLog s);
	public Integer saveTbInbox(TbInbox a);
	public List findBaxyByAllSys();
}
