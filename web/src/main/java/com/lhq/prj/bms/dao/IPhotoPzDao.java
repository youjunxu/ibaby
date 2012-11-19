package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PhotoPz;
import com.lhq.prj.bms.po.PhotoMemo;
/**    
 * IPhotoPzDao.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IPhotoPzDao {
	public Integer savePhotoPz(PhotoPz pz);
	public Integer savePhotoMemo(PhotoMemo s);
	public Integer deletePhotoPzById(Integer s);
	public Integer deletePhotoMemoById(Integer s);
	public Integer deletePhotoMemoByXcId(Integer s);
	public Integer updatePhotoPz(PhotoPz s) throws Exception;
	public Integer updatePhotoMemoA(PhotoMemo s) throws Exception;
	public Integer updatePhotoMemoB(PhotoMemo s) throws Exception;
	public Integer updatePhotoMemoC(PhotoMemo s) throws Exception;
	public PhotoPz findPhotoPzByAcl(PhotoPz s);
	public List findPhotoPzById(Integer s);
	public PhotoPz findPhotoPzByXId(Integer s);
	public PhotoMemo findXcfmByXcId(Integer s);
	public PhotoMemo findXcfmPassByXcId(Integer s);
	public List findPhotoMemoByUId(Integer s);
	public PhotoMemo findPhotoMemoByPId(Integer s);
	public List findPhotoMemoByXcId(Integer s);
	public List findPhotoMemoPassByXcId(Integer s);
	public List findAllWaitShByPhoto(Page p);
	public int findWaitShByCount();
	public void addPhotoLogInfo(LogInfo a);
}
