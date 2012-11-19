package com.lhq.prj.bms.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.PhotoPz;
import com.lhq.prj.bms.po.PhotoMemo;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IPhotoPzService;
/**
 * PhotoPzAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class PhotoPzAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private IPhotoPzService photoPzService;
	private PhotoPz photoPz;
	private boolean success;
	private Integer xcId;
	private String xcTitle;
	private Integer photoId;
	private Integer userId;
	private String userName;
	private String strTitle;
	private String wjName;
	private String dtCrea;
	private Integer xcStatus;
	private Integer phStatus;
	private String xcPassword;
	private Integer sfFm;
	private Integer photoWidth;
	private Integer photoHeight;
	private String tip;
	private String dstJsp;
	private File fiWjName;
	private static final String graphPath="graph/people";

	private String strMemoPhoto;
	
	public Integer getXcId() {
		return xcId;
	}
	public void setXcId(Integer s) {
		this.xcId = s;
	}
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer s) {
		this.photoId = s;
	}
	public String getXcTitle() {
		return xcTitle;
	}
	public void setXcTitle(String s) {
		this.xcTitle = s;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String s) {
		this.userName = s;
	}
	public String getWjName() {
		return wjName;
	}
	public void setWjName(String s) {
		this.wjName = s;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public Integer getXcStatus() {
		return xcStatus;
	}
	public void setXcStatus(Integer s) {
		this.xcStatus = s;
	}
	public Integer getPhStatus() {
		return phStatus;
	}
	public void setPhStatus(Integer s) {
		this.phStatus = s;
	}
	public String getXcPassword() {
		return xcPassword;
	}
	public void setXcPassword(String s) {
		this.xcPassword = MyUtils.str2MD5(s);
	}
	public Integer getSfFm() {
		return sfFm;
	}
	public void setSfFm(Integer s) {
		this.sfFm = s;
	}
	public Integer getPhotoWidth() {
		return photoWidth;
	}
	public void setPhotoWidth(Integer s) {
		this.photoWidth = s;
	}
	public Integer getPhotoHeight() {
		return photoHeight;
	}
	public void setPhotoHeight(Integer s) {
		this.photoHeight = s;
	}

	public String getTip() {
		return tip;
	}
	public void setTip(String s) {
		this.tip = s;
	}
	public String getDstJsp() {
		return dstJsp;
	}
	public void setDstJsp(String s) {
		this.dstJsp = s;
	}
	public String getStrMemoPhoto() {
		return strMemoPhoto;
	}
	public void setStrMemoPhoto(String s) {
		this.strMemoPhoto = s;
	}
	public void setFiWjName(File f)
	{
		this.fiWjName=f;
	}
	public File getFiWjName()
	{
		return fiWjName;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public PhotoPz getPhotoPz() {
		return photoPz;
	}

	public void setPhotoPz(PhotoPz l) {
		this.photoPz = l;
	}

	public void setPhotoPzService(IPhotoPzService l) {
		this.photoPzService = l;
	}
	public String savePhotoPz()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		String sdt;
		PhotoPz p=new PhotoPz();
		p.setUserId(userId);
		p.setUserName(userName);		
		p.setStrTitle(strTitle);

		sdt=getStringDateShort();
		p.setDtCrea(sdt);
		p.setXcStatus(xcStatus);
		p.setXcPassword(xcPassword);

		Integer i=photoPzService.savePhotoPz(p);
		this.tip="成功提交";
		this.dstJsp="myPersonPhoto.action";
		
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ej.getUserId());
		lg.setUserName(ej.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功新增相册");
		photoPzService.addPhotoLogInfo(lg);

		success=true;
		return SUCCESS;
	}
	public String deletePhotoPz()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoPz po=photoPzService.findPhotoPzByXId(xcId);
		if (po==null)
		{
			this.tip="更新失败";
			success=false;
			return SUCCESS;
		}
		success=photoPzService.deletePhotoMemoByXcId(xcId);
		success=photoPzService.deletePhotoPzById(xcId);
		this.tip="成功提交";
		
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ej.getUserId());
		lg.setUserName(ej.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除相册");
		photoPzService.addPhotoLogInfo(lg);

		return SUCCESS;
	}
	public String updatePhotoPz() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		String sdt;
		PhotoPz po=photoPzService.findPhotoPzByXId(xcId);
		if (po==null)
		{
			List la=photoPzService.findPhotoPzById(ej.getUserId());
			getRequest().setAttribute("waitDisp_xcxcxx",la);
			List lw=new ArrayList();
			List lb;
			Integer intAll;
			Integer intLmp;
			
			if (la.size()>0)
			{
				intAll=0;
				for (intLmp=0;intLmp<la.size();intLmp++)
				{
					PhotoPz pz=(PhotoPz)la.get(intLmp);
					List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
					if (lmp==null)
					{
						lw.add(0);
					}else
					{
						lw.add(lmp.size());
					}
					intAll=intAll+lmp.size();
				}
				getRequest().setAttribute("waitDisp_xcgs",lw);
				getRequest().setAttribute("waitDisp_zpall",intAll);
			}

			this.tip="更新失败";
			success=false;
			return SUCCESS;
		}
		PhotoPz p=new PhotoPz();
		p.setXcId(xcId);
		p.setUserId(userId);
		p.setUserName(userName);		
		p.setStrTitle(strTitle);

		sdt=getStringDateShort();
		p.setDtCrea(sdt);
		p.setXcStatus(xcStatus);
		p.setXcPassword(xcPassword);

		success=photoPzService.updatePhotoPz(p);
		this.tip="成功更新";
		
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ej.getUserId());
		lg.setUserName(ej.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新相册");
		photoPzService.addPhotoLogInfo(lg);

		success=true;
		return SUCCESS;
	}
	public String savePhotoMemo() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoMemo p=new PhotoMemo();
		p.setXcId(xcId);
		p.setXcTitle(xcTitle);
		p.setUserId(userId);
		p.setUserName(userName);
		p.setStrTitle(strTitle);
		sdt=getStringDateShort();
		p.setDtCrea(sdt);
		
		String strLmp;
		String[] arrSize;
		
		if (fiWjName==null || wjName==null || ej==null)
		{
			this.tip="上传失败";
			success=false;
			return SUCCESS;
		}
		strLmp=MyUtils.getSizeOfPic(fiWjName);
		strLmp=strLmp.substring(1, strLmp.length()-1);
		arrSize=strLmp.split(",");
		this.photoWidth=Integer.valueOf(arrSize[0]);
		this.photoHeight=Integer.valueOf(arrSize[1]);
		
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath="";
		String strNewName="";
		strNewPath=strPrjPath+"/"+graphPath+"/";
		strNewName=MyUtils.upload(wjName, strNewPath, fiWjName);

		p.setPhotoHeight(photoHeight);
		p.setPhotoWidth(photoWidth);
		p.setWjName(strNewName);
		p.setPhStatus(0);
		p.setSfFm(sfFm);

		Integer i=photoPzService.savePhotoMemo(p);
		this.tip="成功提交";
		this.dstJsp="myPersonPhoto.action?xcId="+String.valueOf(xcId);
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ej.getUserId());
		lg.setUserName(ej.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功上传照片");
		photoPzService.addPhotoLogInfo(lg);

		success=true;
		return SUCCESS;
	}
	public String updatePhotoMemo() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoMemo po=photoPzService.findPhotoMemoByPId(photoId);
		
		if (ej==null || po==null)
		{
			this.tip="上传失败";
			success=false;
			return SUCCESS;
		}
		
		PhotoMemo p=new PhotoMemo();
		p.setPhotoId(photoId);
		p.setXcId(xcId);
		p.setXcTitle(xcTitle);
		p.setStrTitle(strTitle);
		sdt=getStringDateShort();
		p.setDtCrea(sdt);
		p.setSfFm(sfFm);

		success=photoPzService.updatePhotoMemoC(p);
		this.tip="成功提交";
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ej.getUserId());
		lg.setUserName(ej.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新照片相关内容");
		
		photoPzService.addPhotoLogInfo(lg);
		success=true;
		return SUCCESS;
	}
	public String myXcWaitEdit()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoPz po=(PhotoPz)photoPzService.findPhotoPzByXId(xcId);
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_pzxx",po);
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		if (po==null)
		{
			this.tip="错误操作！";
			this.dstJsp="manager.jsp";
			return "input";
		}
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		
		success=true;
		return SUCCESS;
	}
	
	public String myPersonPhoto()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=0;
		int li=0;
		int ls=0;
		Integer intLmp;
		String[] objLmp;
		
		li=16;
		ls=0;
		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}
		if (ej.getPhotoStatus().equals(0))
		{
			success=false;
		}else
		{
			List la=photoPzService.findPhotoPzById(ej.getUserId());
			getRequest().setAttribute("waitDisp_xcxcxx",la);
			List lw=new ArrayList();
			List lb;
			Integer intAll;
			
			if (la.size()>0)
			{
				intAll=0;
				for (intLmp=0;intLmp<la.size();intLmp++)
				{
					PhotoPz pz=(PhotoPz)la.get(intLmp);
					List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
					if (lmp==null)
					{
						lw.add(0);
					}else
					{
						lw.add(lmp.size());
					}
					intAll=intAll+lmp.size();
				}
				getRequest().setAttribute("waitDisp_xcgs",lw);
				getRequest().setAttribute("waitDisp_zpall",intAll);
				if (xcId==null || xcId.equals(0))
				{
					lb=photoPzService.findPhotoMemoByUId(ej.getUserId());
				}else
				{
					lb=photoPzService.findPhotoMemoByXcId(xcId);
				}
				iz=lb.size();
				List lfin=new ArrayList();
				if (iz>=ls)
				{
					for (intLmp=ls;intLmp<(ls+li);intLmp++)
					{
						if (intLmp<iz)
						{
							lfin.add(lb.get(intLmp));
						}else
						{
							break;
						}
					}
				}
				getRequest().setAttribute("waitDisp_zpxx",lfin);
				getRequest().setAttribute("waitDisp_zpzs",iz);
				//总页数
				Double dblLmp=Math.floor(iz/li);
				Double dblTmp=dblLmp*li;
				if (dblTmp<iz)
				{
					dblLmp=dblLmp+1;
				}
				String strLmp=String.valueOf(dblLmp);
				objLmp=strLmp.split("\\.");
				strLmp=objLmp[0];
				Integer intPageZs=Integer.valueOf(strLmp);
				getRequest().setAttribute("sysPageZs_disp", intPageZs);
			
			}
			success=true;
		}
		
		return SUCCESS;
	}
	public String oPersonPhoto()
	{
		Integer intLmp;
		List la=photoPzService.findPhotoPzById(userId);
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
			
		if (la.size()>0)
		{
			List lp=new ArrayList();
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoPassByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				PhotoMemo om=photoPzService.findXcfmPassByXcId(pz.getXcId());
				lp.add(om);
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_fmxx",lp);
		}
		success=true;
		return SUCCESS;
	}
	public String opPersonPhoto()
	{
		PhotoPz pz=(PhotoPz)photoPzService.findPhotoPzByXId(xcId);
		Integer ii=(Integer)getSession().getAttribute("seekQtPhotoMemo");
		if (pz==null)
		{
			this.tip="对不起，错误操作！";
			this.dstJsp="manager.jsp";
			success=false;
			return "input";
		}
		if (pz.getXcStatus()==1)
		{
			if (ii==null)
			{
				this.tip="对不起，错误操作！";
				this.dstJsp="oPersonPhoto.action?userId="+String.valueOf(pz.getUserId());
				success=false;
				return "input";
			}else
			{
				if (ii!=1)
				{
					this.tip="对不起，错误操作！";
					this.dstJsp="oPersonPhoto.action?userId="+String.valueOf(pz.getUserId());
					success=false;
					return "input";
				}
			}
		}
		
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=0;
		int li=0;
		int ls=0;
		Integer intLmp;
		String[] objLmp;
		
		li=25;
		ls=0;
		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}
		List lmp=photoPzService.findPhotoMemoPassByXcId(xcId);
		getRequest().setAttribute("waitDisp_xcxx",pz);
		iz=lmp.size();
		List lfin=new ArrayList();
		for (intLmp=ls;intLmp<(ls+li);intLmp++)
		{
			if (intLmp<iz)
			{
				lfin.add(lmp.get(intLmp));
			}else
			{
				break;
			}
		}
		getRequest().setAttribute("waitDisp_zpxx",lfin);
		getRequest().setAttribute("sysCount_disp",iz);

		//总页数
		Double dblLmp=Math.floor(iz/li);
		Double dblTmp=dblLmp*li;
		if (dblTmp<iz)
		{
			dblLmp=dblLmp+1;
		}
		String strLmp=String.valueOf(dblLmp);
		objLmp=strLmp.split("\\.");
		strLmp=objLmp[0];
		Integer intPageZs=Integer.valueOf(strLmp);
		getRequest().setAttribute("sysPageZs_disp", intPageZs);
		
		
		success=true;
		return SUCCESS;
	}
	public String opaPersonPhoto()
	{
		Integer intLmp;
		Integer intTmp;
		Integer intPrev;
		Integer intNext;
		PhotoPz pz=(PhotoPz)photoPzService.findPhotoPzByXId(xcId);
		getRequest().setAttribute("waitDisp_xcxx",pz);
		PhotoMemo pm=photoPzService.findPhotoMemoByPId(photoId);
		getRequest().setAttribute("waitDisp_opendoc",pm);
		List lmp=photoPzService.findPhotoMemoPassByXcId(xcId);
		intPrev=-1;
		intNext=-1;
		if (lmp.size()>0)
		{
			intTmp=0;
			for (intLmp=0;intLmp<lmp.size();intLmp++)
			{
				PhotoMemo po=(PhotoMemo)lmp.get(intLmp);
				if (!photoId.equals(po.getPhotoId()))
				{
					if (intTmp==0)
					{
						intPrev=po.getPhotoId();
					}
					if (intTmp==1)
					{
						intNext=po.getPhotoId();
						break;
					}
				}else
				{
					intTmp=1;
				}
			}
		}
		getRequest().setAttribute("waitDisp_prevPh",intPrev);
		getRequest().setAttribute("waitDisp_nextPh",intNext);

		success=true;
		return SUCCESS;
	}
	public String photoGl()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}

		UserEj ou=(UserEj)getSession().getAttribute("waitDisp_ej");
		String sj=(String)getRequest().getParameter("BJ");
		List la=photoPzService.findPhotoPzById(ou.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx", la);
		Integer intAll;
		Integer intLmp;

		if (la.size()>0)
		{
			intAll=0;
			List lw=new ArrayList();
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}

		if(sj.equals("0"))
		{
			//创建相册
			getRequest().setAttribute("BJ", sj);
			return "createXc";
//			success=true;
//			return SUCCESS;
		}else
		{
			if(sj.equals("1"))
			{
				//上传照片
				getRequest().setAttribute("BJ", sj);
				PhotoPz pp=null;
				if (xcId!=null)
				{
					pp=photoPzService.findPhotoPzByXId(xcId);
				}
				getRequest().setAttribute("curXc", pp);

				return "uploadZp";
			}else
			{
				if(sj.equals("2"))
				{
					//打开照片
					if (photoId==null)
					{
						this.tip="对不起，操作失败！";
						this.dstJsp="error.jsp";
						return "input";
					}else
					{
						getRequest().setAttribute("BJ", sj);
						PhotoMemo pm=photoPzService.findPhotoMemoByPId(photoId);
						getRequest().setAttribute("waitDisp_zpcur", pm);
						//计算上一张
						List ln=null;
						if (xcId==0)
						{
							ln=photoPzService.findPhotoMemoByUId(ou.getUserId());
						}else
						{
							ln=photoPzService.findPhotoMemoByXcId(xcId);
						}
						Integer intPrev=0;
						Integer intNext=0;
						Integer intA=0;
						for (intLmp=0;intLmp<ln.size();intLmp++)
						{
							PhotoMemo mo=(PhotoMemo)ln.get(intLmp);
							if (mo.getPhotoId().equals(photoId))
							{
								intA=1;
							}else
							{
								if (intA==0)
								{
									intPrev=mo.getPhotoId();
								}else
								{
									intNext=mo.getPhotoId();
									break;
								}
							}
						}
						getRequest().setAttribute("waitDisp_zpprev", intPrev);
						getRequest().setAttribute("waitDisp_zpnext", intNext);
						getRequest().setAttribute("waitDisp_zpxc", xcId);
						
						return "openB";
					}
				}else
				{
					this.tip="非法操作！";
					this.dstJsp="error.jsp";
					return "input";
				}
			}
		}
	}
	public String deletePhotoMemoByid()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ou=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoMemo pn=photoPzService.findPhotoMemoByPId(photoId);
		if (pn==null)
		{
			this.tip="操作失败！";
			this.dstJsp="error.jsp";
			return "input";
		}
		success=photoPzService.deletePhotoMemoById(photoId);
		this.tip="成功删除";
		Integer intLmp;

		List la=photoPzService.findPhotoPzById(ou.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx", la);
		Integer intAll;
		if (la.size()>0)
		{
			intAll=0;
			List lw=new ArrayList();
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ou.getUserId());
		lg.setUserName(ou.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除照片");
		photoPzService.addPhotoLogInfo(lg);
		return SUCCESS;
	}
	public String waitUpdatePhotoMemo()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ou=(UserEj)getSession().getAttribute("waitDisp_ej");
		List la=photoPzService.findPhotoPzById(ou.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx", la);
		Integer intAll;
		Integer intLmp;

		if (la.size()>0)
		{
			intAll=0;
			List lw=new ArrayList();
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		PhotoMemo pn=photoPzService.findPhotoMemoByPId(photoId);
		if (pn==null)
		{
			this.tip="错误操作";
			this.dstJsp="error.jsp";
			return "input";
		}
		getRequest().setAttribute("waitEditPhoto", pn);
		return "success";
	}
	public String updatePhotoMemoB() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj ej=(UserEj)getSession().getAttribute("waitDisp_ej");
		PhotoMemo pn=photoPzService.findPhotoMemoByPId(photoId);
		PhotoMemo pm=new PhotoMemo();
		String sdt;
		
		if (pn==null)
		{
			this.tip="操作失败！";
			this.dstJsp="manager.jsp";
			return "input";
		}
		pm.setPhotoId(photoId);
		sdt=getStringDateShort();
		pm.setDtCrea(sdt);
		pm.setSfFm(1);
		success=photoPzService.updatePhotoMemoB(pm);

		this.tip="已成功设为封面";
		List la=photoPzService.findPhotoPzById(ej.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx",la);
		List lw=new ArrayList();
		List lb;
		Integer intAll;
		Integer intLmp;
		
		if (la.size()>0)
		{
			intAll=0;
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
		}
		
		return SUCCESS;
	}
	public String photoPzManage()
	{
		UserEj ou=(UserEj)getSession().getAttribute("waitDisp_ej");
		List la=photoPzService.findPhotoPzById(ou.getUserId());
		getRequest().setAttribute("waitDisp_xcxcxx", la);
		Integer intAll;
		Integer intLmp;

		if (la.size()>0)
		{
			intAll=0;
			List lw=new ArrayList();
			List lp=new ArrayList();
			for (intLmp=0;intLmp<la.size();intLmp++)
			{
				PhotoPz pz=(PhotoPz)la.get(intLmp);
				List lmp=photoPzService.findPhotoMemoByXcId(pz.getXcId());
				if (lmp==null)
				{
					lw.add(0);
				}else
				{
					lw.add(lmp.size());
				}
				PhotoMemo om=photoPzService.findXcfmByXcId(pz.getXcId());
				if (om==null)
				{
					if (lmp!=null)
					{
						om=(PhotoMemo)lmp.get(0);
					}
				}
				lp.add(om);
				intAll=intAll+lmp.size();
			}
			getRequest().setAttribute("waitDisp_xcgs",lw);
			getRequest().setAttribute("waitDisp_zpall",intAll);
			getRequest().setAttribute("waitDisp_fmxx",lp);
		}
		return "success";
	}
	public String checkPhotoAcl()
	{
		PhotoPz pa=new PhotoPz();
		pa.setXcId(xcId);
		pa.setXcPassword(xcPassword);
		pa.setXcStatus(1);
		PhotoPz pm=photoPzService.findPhotoPzByAcl(pa);
		getSession().removeAttribute("seekQtPhotoMemo");
		if (pm==null)
		{
			this.tip="对不起，密码错误或您无权查看该相册信息！";
			success = false;
		}else
		{
			success = true;
			this.tip="";
			getSession().setAttribute("seekQtPhotoMemo",1);
		}
		return SUCCESS;
	}
	public String sysmanaF()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=(int)photoPzService.findWaitShByCount();
		String[] objLmp;
		int li;
		int ls;
		
		li=10;
		ls=0;

		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}

		p.setLimit(li);
		p.setStart(ls);
		List l=photoPzService.findAllWaitShByPhoto(p);
		getRequest().setAttribute("sysList_disp", l);
		getRequest().setAttribute("sysCount_disp", iz);

		//总页数
		Double dblLmp=Math.floor(iz/li);
		Double dblTmp=dblLmp*li;
		if (dblTmp<iz)
		{
			dblLmp=dblLmp+1;
		}
		String strLmp=String.valueOf(dblLmp);
		objLmp=strLmp.split("\\.");
		strLmp=objLmp[0];
		Integer intPageZs=Integer.valueOf(strLmp);
		getRequest().setAttribute("sysPageZs_disp", intPageZs);

		success=true;
		return SUCCESS;
	}
	public String shPhotoPass() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Integer intLmp;
		String tmpa = getRequest().getParameter("waitPsList");
		String[] objLmp;
		String sacl=(String)getSession().getAttribute("userAcl");
		if (tmpa==null || sacl.indexOf("999")<0)
		{
			this.tip="对不起，您无权限操作！";
			this.dstJsp="sysmanaF.action";
			success=false;
			return SUCCESS;
		}
		if (phStatus!=1 && phStatus!=2 && phStatus!=3)
		{
			this.tip="非法调用！";
			this.dstJsp="sysmanaF.action";
			return "input";
		}
		objLmp=tmpa.split(",");
		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
			if (!objLmp[intLmp].isEmpty())
			{
				if (phStatus==1 || phStatus==2)
				{
					PhotoMemo pm=new PhotoMemo();
					pm.setPhotoId(Integer.valueOf(objLmp[intLmp]));
					pm.setPhStatus(phStatus);
					success=photoPzService.updatePhotoMemoA(pm);
				}else
				{
					photoPzService.deletePhotoMemoById(Integer.valueOf(objLmp[intLmp]));
				}
			}
		}
		this.tip="已成功处理！";
		this.dstJsp="sysmanaF.action";
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ui.getUserId());
		lg.setUserName(ui.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功审核照片");
		photoPzService.addPhotoLogInfo(lg);
		success=true;
		return SUCCESS;
	}
}
