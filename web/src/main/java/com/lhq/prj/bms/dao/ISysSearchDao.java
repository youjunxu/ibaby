package com.lhq.prj.bms.dao;

import java.util.List;
import com.lhq.prj.bms.po.SysSearch;

public interface ISysSearchDao {
	public List findAllDocInfoByCond(SysSearch s);
}
