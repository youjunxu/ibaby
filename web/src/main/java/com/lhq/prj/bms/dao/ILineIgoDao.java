package com.lhq.prj.bms.dao;

import com.lhq.prj.bms.po.LineIgo;
import com.lhq.prj.bms.po.LineIgoM;
import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.po.SpBrand;

/**    
 * ILineIgoDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */

public interface ILineIgoDao {
	public Integer saveLineIgo(LineIgo user);
	public Integer deleteIgoById(Integer s);
	public Integer updateIgo(LineIgo s) throws Exception;
	public int findByCount();
	public List findAllIgo(Page p);
	public List findAllIgoA(Page p);
	public List findAllSpType();
	public List findAllSpBrand();
	public List findBrandByType(Integer s);
	public LineIgo findIgoById(Integer p);
	public List findIgoByCond(LineIgoM p);
	public SpType findAllTypeById(Integer s);
	public SpBrand findBrandById(Integer s);
	public List findFirstBrandByXh();
	public List findFirstBrandByTypeXh(Integer s);
}
