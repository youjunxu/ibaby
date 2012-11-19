package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.ActLy;
import com.lhq.prj.bms.po.ActXx;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.core.Page;
/**    
 * IActXxService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IActXxService {
	Integer saveActXx(ActXx a);
	boolean deleteActXxById(Integer s);
	BaDocSh findBADOCSH();
	int findByCount();
	List findAllActXx(Page p);
	int findJxzActXxCount();
	List findAllJxzActXx(Page p);
	int findEndActXxCount();
	List findAllEndActXx(Page p);
	ActXx findActXxById(Integer s);
	boolean updateActXx(ActXx g) throws Exception;
	void addActLogInfo(LogInfo a);
	List findAllLySpgg();
	Integer saveActLy(ActLy user);
	boolean deleteActLyById(Integer s);
	List findAllLyByAct(Integer s);
	List findAllActLy();
	ActLy findActLyById(Integer s);
}
