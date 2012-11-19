package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.IPhotoPzDao;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PhotoPz;
import com.lhq.prj.bms.po.PhotoMemo;
import com.lhq.prj.bms.service.IPhotoPzService;
/**
 * PhotoPzService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
public class PhotoPzService implements IPhotoPzService{
	private IPhotoPzDao photoPzDao;

	public void setPhotoPzDao(IPhotoPzDao aDao) {
		this.photoPzDao = aDao;
	}
	public Integer savePhotoPz(PhotoPz a) {
		return (Integer)photoPzDao.savePhotoPz(a);
	}
	public Integer savePhotoMemo(PhotoMemo a) {
		return (Integer)photoPzDao.savePhotoMemo(a);
	}

	public boolean deletePhotoPzById(Integer s) {
		Integer flag = photoPzDao.deletePhotoPzById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deletePhotoMemoByXcId(Integer s) {
		Integer flag = photoPzDao.deletePhotoMemoByXcId(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean deletePhotoMemoById(Integer s) {
		Integer flag = photoPzDao.deletePhotoMemoById(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updatePhotoPz(PhotoPz s) throws Exception {
		Integer flag = photoPzDao.updatePhotoPz(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updatePhotoMemoA(PhotoMemo s) throws Exception {
		Integer flag = photoPzDao.updatePhotoMemoA(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updatePhotoMemoB(PhotoMemo s) throws Exception {
		Integer flag = photoPzDao.updatePhotoMemoB(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public boolean updatePhotoMemoC(PhotoMemo s) throws Exception {
		Integer flag = photoPzDao.updatePhotoMemoC(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public PhotoPz findPhotoPzByAcl(PhotoPz s)
	{
		return photoPzDao.findPhotoPzByAcl(s);
	}
	public List findPhotoPzById(Integer s) {
		return photoPzDao.findPhotoPzById(s);
	}
	public PhotoPz findPhotoPzByXId(Integer s) {
		return photoPzDao.findPhotoPzByXId(s);
	}
	public PhotoMemo findXcfmByXcId(Integer s)
	{
		return photoPzDao.findXcfmByXcId(s);
	}
	public PhotoMemo findXcfmPassByXcId(Integer s)
	{
		return photoPzDao.findXcfmPassByXcId(s);
	}
	public List findPhotoMemoByUId(Integer s) {
		return photoPzDao.findPhotoMemoByUId(s);
	}
	public PhotoMemo findPhotoMemoByPId(Integer s) {
		return photoPzDao.findPhotoMemoByPId(s);
	}
	public List findPhotoMemoByXcId(Integer s) {
		return photoPzDao.findPhotoMemoByXcId(s);
	}
	public List findPhotoMemoPassByXcId(Integer s) {
		return photoPzDao.findPhotoMemoPassByXcId(s);
	}
	public List findAllWaitShByPhoto(Page p)
	{
		return photoPzDao.findAllWaitShByPhoto(p);
	}
	public int findWaitShByCount()
	{
		return photoPzDao.findWaitShByCount();
	}
	public void addPhotoLogInfo(LogInfo a)
	{
		photoPzDao.addPhotoLogInfo(a);
	}
}
