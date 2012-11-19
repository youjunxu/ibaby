package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LineIgo;
import com.lhq.prj.bms.po.LineIgoM;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;

public interface ILineIgoService {
    int saveLineIgo(LineIgo user);
	boolean deleteIgoById(Integer s);
	boolean updateIgo(LineIgo s) throws Exception;
	int findByCount();
	List findAllIgo(Page p);
	List findAllIgoA(Page p);
	List findAllSpType();
	List findAllSpBrand();
	List findBrandByType(Integer s);
	LineIgo findIgoById(Integer p);
	List findIgoByCond(LineIgoM p);
	SpType findAllTypeById(Integer s);
	SpBrand findBrandById(Integer s);
	List findFirstBrandByXh();
	List findFirstBrandByTypeXh(Integer s);
}
