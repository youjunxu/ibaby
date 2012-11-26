package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.po.ActLy;
import com.lhq.prj.bms.po.BaDocSh;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.ActXx;
import com.lhq.prj.bms.core.Page;
/**    
 * IActXxDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface IActXxDao {
	public Integer saveActXx(ActXx a);
	public Integer deleteActXxById(Integer s);
	public BaDocSh findBADOCSH();
	public int findByCount();
	public List findAllActXx(Page p);
	public int findJxzActXxCount();
	public List findAllJxzActXx(Page p);
	public int findEndActXxCount();
	public List findAllEndActXx(Page p);
	public ActXx findActXxById(Integer s);
	public Integer updateActXx(ActXx g) throws Exception;
	public void addActLogInfo(LogInfo a);
	public List findAllLySpgg();
	public Integer saveActLy(ActLy s);
	public Integer deleteActLyById(Integer s);
	public List findAllLyByAct(Integer s);
	public List findAllActLy();
	public ActLy findActLyById(Integer s);
}
