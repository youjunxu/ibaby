package com.lhq.prj.bms.dao.impl;

import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.dao.IPhotoPzDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PhotoPz;
import com.lhq.prj.bms.po.PhotoMemo;
import com.lhq.prj.bms.core.Page;
/**
 * AclLevelDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class PhotoPzDao extends SqlMapClientDaoSupport implements IPhotoPzDao{
	public Integer savePhotoPz(PhotoPz a)
	{
		return (Integer)getSqlMapClientTemplate().insert("PhotoPz.save", a);
	}
	public Integer savePhotoMemo(PhotoMemo a)
	{
		return (Integer)getSqlMapClientTemplate().insert("PhotoMemo.save", a);
	}
	public Integer deletePhotoPzById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("PhotoPz.deleteById", s);
	}
	public Integer deletePhotoMemoById(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("PhotoMemo.deleteById", s);
	}
	public Integer deletePhotoMemoByXcId(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("PhotoMemo.deleteByXcId", s);
	}
	public Integer updatePhotoPz(PhotoPz s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("PhotoPz.updatePhotoPz", s);
	}
	
	public Integer updatePhotoMemoA(PhotoMemo s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("PhotoMemo.updatePhotoMemoA", s);
	}
	public Integer updatePhotoMemoB(PhotoMemo s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("PhotoMemo.updatePhotoMemoB", s);
	}
	public Integer updatePhotoMemoC(PhotoMemo s) throws Exception
	{
		return (Integer)getSqlMapClientTemplate().update("PhotoMemo.updatePhotoMemoC", s);
	}
	public List findPhotoPzById(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("PhotoPz.findPhotoPzById", s);
	}
	public PhotoPz findPhotoPzByXId(Integer s)
	{
		return (PhotoPz)getSqlMapClientTemplate().queryForObject("PhotoPz.findPhotoPzByXId", s);
	}
	public PhotoPz findPhotoPzByAcl(PhotoPz s)
	{
		return (PhotoPz)getSqlMapClientTemplate().queryForObject("PhotoPz.findPhotoPzByAcl", s);
	}
	
	public PhotoMemo findXcfmByXcId(Integer s)
	{
		return (PhotoMemo)getSqlMapClientTemplate().queryForObject("PhotoMemo.findXcfmByXcId", s);
	}
	public PhotoMemo findXcfmPassByXcId(Integer s)
	{
		return (PhotoMemo)getSqlMapClientTemplate().queryForObject("PhotoMemo.findXcfmPassByXcId", s);
	}
	public List findPhotoMemoByUId(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("PhotoMemo.findPhotoMemoByUId", s);
	}
	public PhotoMemo findPhotoMemoByPId(Integer s)
	{
		return (PhotoMemo)getSqlMapClientTemplate().queryForObject("PhotoMemo.findPhotoMemoByPId", s);
	}
	public List findPhotoMemoByXcId(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("PhotoMemo.findPhotoMemoByXcId", s);
	}
	public List findPhotoMemoPassByXcId(Integer s)
	{
		return (List)getSqlMapClientTemplate().queryForList("PhotoMemo.findPhotoMemoPassByXcId", s);
	}
	public List findAllWaitShByPhoto(Page p)
	{
		return (List)getSqlMapClientTemplate().queryForList("PhotoMemo.findPhotoByWaitSh", p);
	}
	public int findWaitShByCount()
	{
		return (Integer)getSqlMapClientTemplate().queryForObject("PhotoMemo.findPhotoCountByWaitSh");
	}
	public void addPhotoLogInfo(LogInfo a)
	{
		getSqlMapClientTemplate().insert("LogInfo.save", a);
	}

}
