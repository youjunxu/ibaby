package com.lhq.prj.bms.service;

import java.util.List;
import com.lhq.prj.bms.po.SysSearch;

public interface ISysSearchService {
	List findAllDocInfoByCond(SysSearch s);
}
