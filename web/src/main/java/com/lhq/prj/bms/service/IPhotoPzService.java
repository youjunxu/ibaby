package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PhotoMemo;
import com.lhq.prj.bms.po.PhotoPz;
import com.lhq.prj.bms.core.Page;
/**    
 * IPhotoPzService.java Create on 2012-5-4
 * @author andchen
 * @version 1.0  
 */
public interface IPhotoPzService {
	Integer savePhotoPz(PhotoPz pz);
	Integer savePhotoMemo(PhotoMemo s);
	boolean deletePhotoPzById(Integer s);
	boolean deletePhotoMemoById(Integer s);
	boolean deletePhotoMemoByXcId(Integer s);
	boolean updatePhotoPz(PhotoPz s) throws Exception;
	boolean updatePhotoMemoA(PhotoMemo s) throws Exception;
	boolean updatePhotoMemoB(PhotoMemo s) throws Exception;
	boolean updatePhotoMemoC(PhotoMemo s) throws Exception;
	List findPhotoPzById(Integer s);
	PhotoPz findPhotoPzByXId(Integer s);
	PhotoMemo findXcfmByXcId(Integer s);
	PhotoMemo findXcfmPassByXcId(Integer s);
	PhotoPz findPhotoPzByAcl(PhotoPz s);
	List findPhotoMemoByUId(Integer s);
	PhotoMemo findPhotoMemoByPId(Integer s);
	List findPhotoMemoByXcId(Integer s);
	List findPhotoMemoPassByXcId(Integer s);
	List findAllWaitShByPhoto(Page p);
	int findWaitShByCount();
	void addPhotoLogInfo(LogInfo a);
}
