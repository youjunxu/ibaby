package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;
import java.io.File;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LineIgo;
import com.lhq.prj.bms.po.LineIgoM;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.ILineIgoService;
/**
 * LineIgoAction.java Create on 2012-6-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LineIgoAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private ILineIgoService lineIgoService;
	private LineIgo lineIgo;
	private boolean success;
	private Integer igoId;
	private Integer igoTypeId;
	private String igoTypeName;
	private Integer brandId;
	private String brandName;
	private String igoName;
	private String igoOriginal;
	private String igoSection;
	private double igoGuide;
	private String igoShmcA;
	private String igoShmcB;
	private String igoShLink;
	private Integer igoXy;
	private Integer userId;
	private String userName;
	private String dtUpdate;
	private String spImg;
	private String strZbmc;
	private String strZbdw;
	private File fiSpImg;
	private String dstJsp;
	private String tip;
	private Integer smallVal;
	private Integer bigVal;

	public Integer getIgoId() {
		return igoId;
	}
	public void setIgoId(Integer s) {
		this.igoId = s;
	}
	public Integer getIgoTypeId() {
		return igoTypeId;
	}
	public void setIgoTypeId(Integer s) {
		this.igoTypeId = s;
	}
	public String getIgoTypeName() {
		return igoTypeName;
	}
	public void setIgoTypeName(String s) {
		this.igoTypeName = s;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer s) {
		this.brandId = s;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String s) {
		this.brandName = s;
	}
	public String getIgoName() {
		return igoName;
	}
	public void setIgoName(String s) {
		this.igoName = s;
	}
	public String getIgoOriginal() {
		return igoOriginal;
	}
	public void setIgoOriginal(String s) {
		this.igoOriginal = s;
	}
	public String getIgoSection() {
		return igoSection;
	}
	public void setIgoSection(String s) {
		this.igoSection = s;
	}
	public Double getIgoGuide() {
		return igoGuide;
	}
	public void setIgoGuide(Double s) {
		this.igoGuide = s;
	}
	public String getIgoShmcA() {
		return igoShmcA;
	}
	public void setIgoShmcA(String s) {
		this.igoShmcA = s;
	}
	public String getIgoShmcB() {
		return igoShmcB;
	}
	public void setIgoShmcB(String s) {
		this.igoShmcB = s;
	}
	public String getIgoShLink() {
		return igoShLink;
	}
	public void setIgoShLink(String s) {
		this.igoShLink = s;
	}
	public Integer getIgoXy() {
		return igoXy;
	}
	public void setIgoXy(Integer s) {
		this.igoXy = s;
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
	public String getDtUpdate() {
		return dtUpdate;
	}
	public void setDtUpdate(String s) {
		this.dtUpdate = s;
	}
	public String getSpImg() {
		return spImg;
	}
	public void setSpImg(String s) {
		this.spImg = s;
	}
	public String getStrZbmc() {
		return strZbmc;
	}
	public void setStrZbmc(String s) {
		this.strZbmc = s;
	}
	public String getStrZbdw() {
		return strZbdw;
	}
	public void setStrZbdw(String s) {
		this.strZbdw = s;
	}

	public File getFiSpImg() {
		return fiSpImg;
	}
	public void setFiSpImg(File s) {
		this.fiSpImg = s;
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
	public Integer getSmallVal() {
		return smallVal;
	}
	public void setSmallVal(Integer s) {
		this.smallVal = s;
	}
	public Integer getBigVal() {
		return bigVal;
	}
	public void setBigVal(Integer s) {
		this.bigVal = s;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public LineIgo getLineIgo() {
		return lineIgo;
	}

	public void setLineIgo(LineIgo l) {
		this.lineIgo = l;
	}

	public void setLineIgoService(ILineIgoService l) {
		this.lineIgoService = l;
	}
	
	public String sysmanaG()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}

		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=lineIgoService.findByCount();
		int li=0;
		int ls=0;
		String[] objLmp;
		Integer intLmp;
	
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

		List l=lineIgoService.findAllIgo(p);
		List lf=new ArrayList();
		if (iz>=ls)
		{
			for (intLmp=(ls);intLmp<l.size();intLmp++)
			{
				if (intLmp<=(ls+li+1))
				{
					lf.add(l.get(intLmp));
				}else
				{
					break;
				}
			}
		}

		getRequest().setAttribute("sysList_disp", lf);
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
	public String firstIGO()
	{
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		String tmpc = getRequest().getParameter("guide");
		int iz=0;
		int li=0;
		int ls=0;
		String[] objLmp;
		Integer intLmp;
		String strCurType="";
		String strCurGuide="";
		String strCurBrand="";
	
		li=7;
		ls=0;
		if (tmpa!=null)
		{
			li=Integer.valueOf(tmpa);
		}
		if (tmpb!=null)
		{
			ls=Integer.valueOf(tmpb);
		}
		strCurGuide="";
		if (tmpc!=null)
		{
			if (tmpc.equals("1"))
			{
				smallVal=0;
				bigVal=50;
				strCurGuide="0-49元";
			}else
			{
				if (tmpc.equals("2"))
				{
					smallVal=50;
					bigVal=100;
					strCurGuide="50-99元";
				}else
				{
					if (tmpc.equals("3"))
					{
						smallVal=100;
						bigVal=200;
						strCurGuide="100-199元";
					}else
					{
						if (tmpc.equals("4"))
						{
							smallVal=200;
							bigVal=500;
							strCurGuide="200-499元";
						}else
						{
							if (tmpc.equals("5"))
							{
								smallVal=500;
								bigVal=1000;
								strCurGuide="500-999元";
							}else
							{
								if (tmpc.equals("6"))
								{
									smallVal=1000;
									bigVal=null;
									strCurGuide="1000元以上";
								}else
								{
									smallVal=0;
									bigVal=0;
								}
							}
						}
					}
				}
			}
		}else
		{
			smallVal=0;
			bigVal=0;
		}
		getRequest().setAttribute("wait_guideMc", strCurGuide);
		if (smallVal==0 && bigVal==0)
		{
			getRequest().setAttribute("wait_guideId", 0);
		}else
		{
			getRequest().setAttribute("wait_guideId", Integer.valueOf(tmpc));
		}
		strCurType="";
		if (igoTypeId==null)
		{
			getRequest().setAttribute("wait_typeId", 0);
			igoTypeId=0;
		}else
		{
			getRequest().setAttribute("wait_typeId", igoTypeId);
			//获取类型名称
			SpType sy=lineIgoService.findAllTypeById(igoTypeId);
			if (sy!=null) strCurType=sy.getSpTypeName();
			getRequest().setAttribute("wait_typeMc", strCurType);
		}
		strCurBrand="";
		if (brandId==null)
		{
			getRequest().setAttribute("wait_brandId", 0);
		}else
		{
			getRequest().setAttribute("wait_brandId", brandId);
			//获取品牌名称
			SpBrand sr=lineIgoService.findBrandById(brandId);
			if (sr!=null) strCurBrand=sr.getBrandName();
			getRequest().setAttribute("wait_brandMc", strCurBrand);
		}
		
		p.setLimit(li);
		p.setStart(ls);
		List ld;
		if ((smallVal==0 && bigVal==0) & brandId==null & igoTypeId==0)
		{
			iz=lineIgoService.findByCount();
			ld=lineIgoService.findAllIgoA(p);
		}else
		{
			LineIgoM ml=new LineIgoM();
			if (brandId==0)
			{
				ml.setBrandId(null);
			}else
			{
				ml.setBrandId(brandId);
			}
			if (smallVal>0 || bigVal>0)
			{
				ml.setSmallVal(smallVal);
				ml.setBigVal(bigVal);
			}
			if (igoTypeId==0)
			{
				ml.setIgoTypeId(null);
			}else
			{
				ml.setIgoTypeId(igoTypeId);
			}
			ld=lineIgoService.findIgoByCond(ml);
			iz=ld.size();
		}
		List lf=new ArrayList();
		if (iz>=ls)
		{
			for (intLmp=(ls);intLmp<ld.size();intLmp++)
			{
				if (intLmp<=(ls+li+1))
				{
					lf.add(ld.get(intLmp));
				}else
				{
					break;
				}
			}
		}
		getRequest().setAttribute("sysList_disp", lf);
		getRequest().setAttribute("sysCount_disp", iz);

		List lb=lineIgoService.findAllSpType();
		List lc=null;
		List lp=null;
		if (igoTypeId==0)
		{
			lc=lineIgoService.findFirstBrandByXh();
			lp=lineIgoService.findAllSpBrand();
		}else
		{
			lc=lineIgoService.findFirstBrandByTypeXh(igoTypeId);
			lp=lineIgoService.findBrandByType(igoTypeId);
		}
		getRequest().setAttribute("sysList_lxdisp", lb);
		getRequest().setAttribute("sysList_ppdisp", lc);
		getRequest().setAttribute("sysList_allppdisp", lp);
		
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
	public String prevNewIgo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		List lb=lineIgoService.findAllSpType();
		getRequest().setAttribute("waitList_lx", lb);
		
		success=true;
		return SUCCESS;
	}
	public String prevEditIgo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		LineIgo ig=lineIgoService.findIgoById(igoId);
		getRequest().setAttribute("waitEdit_doc", ig);
		List lb=lineIgoService.findAllSpType();
		getRequest().setAttribute("waitList_lx", lb);
		List lx=lineIgoService.findBrandByType(ig.getIgoTypeId());
		getRequest().setAttribute("waitList_pp", lx);
		
		success=true;
		return SUCCESS;
	}
	public String prevSeekIgo()
	{
		LineIgo ig=lineIgoService.findIgoById(igoId);
		getRequest().setAttribute("waitDisp_doc", ig);
		
		success=true;
		return SUCCESS;
	}
	public String prevASeekIgo()
	{
		LineIgo ig=lineIgoService.findIgoById(igoId);
		getRequest().setAttribute("waitDisp_doc", ig);
		
		success=true;
		return SUCCESS;
	}
	public String saveIgo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath="";
		String strNewName="";

		String sdt;
		LineIgo ig=new LineIgo();
		ig.setIgoTypeId(igoTypeId);
		ig.setIgoTypeName(igoTypeName);
		ig.setBrandId(brandId);
		ig.setBrandName(brandName);
		ig.setIgoName(igoName);
		ig.setIgoOriginal(igoOriginal);
		ig.setIgoSection(igoSection);
		ig.setIgoGuide(igoGuide);
		ig.setIgoShmcA(igoShmcA);
		ig.setIgoShmcB(igoShmcB);
		ig.setIgoShLink(igoShLink);
		ig.setIgoXy(igoXy);
		ig.setUserId(userId);
		ig.setUserName(userName);
		ig.setStrZbdw(strZbdw);
		ig.setStrZbmc(strZbmc);
		sdt=getStringDateShort();
		ig.setDtUpdate(sdt);
		
		if (spImg!=null && fiSpImg!=null)
		{
			strNewPath=strPrjPath+"/graph/lmxx/";
			strNewName=MyUtils.upload(spImg, strNewPath, fiSpImg);
			ig.setSpImg(strNewName);
		}
				
		lineIgoService.saveLineIgo(ig);
		this.tip="成功提交";
		this.dstJsp="sysmanaG.action";

		success=true;
		return SUCCESS;
	}
	public String deleteIgoImg() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		LineIgo idg=lineIgoService.findIgoById(igoId);
		if (idg==null)
		{
			this.tip="操作失败，无此记录！";
			this.dstJsp="sysmanaG.action";
			success=true;
			return SUCCESS;
		}
		
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath="";
		String strNewName="";

		LineIgo ig=new LineIgo();
		ig.setIgoId(igoId);
		
		strNewPath=strPrjPath+"/graph/lmxx/";
		if (idg.getSpImg()!=null)
		{
			if (!"".equals(idg.getSpImg()))
			{
				MyUtils.delFile(strNewPath+idg.getSpImg());
			}
		}
		ig.setSpImg("");
				
		this.tip="成功删除原有图片！";
		this.dstJsp="sysmanaG.action";
		success=lineIgoService.updateIgo(ig);
		return SUCCESS;
	}
	public String updateIgo() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		LineIgo idg=lineIgoService.findIgoById(igoId);
		if (idg==null)
		{
			this.tip="操作失败，无此记录！";
			this.dstJsp="sysmanaG.action";
			success=true;
			return SUCCESS;
		}
		
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath="";
		String strNewName="";

		LineIgo ig=new LineIgo();
		ig.setIgoId(igoId);
		ig.setIgoTypeId(igoTypeId);
		ig.setIgoTypeName(igoTypeName);
		ig.setBrandId(brandId);
		ig.setBrandName(brandName);
		ig.setIgoName(igoName);
		ig.setIgoOriginal(igoOriginal);
		ig.setIgoSection(igoSection);
		ig.setIgoGuide(igoGuide);
		ig.setIgoShmcA(igoShmcA);
		ig.setIgoShmcB(igoShmcB);
		ig.setIgoShLink(igoShLink);
		ig.setIgoXy(igoXy);
		ig.setStrZbdw(strZbdw);
		ig.setStrZbmc(strZbmc);
		
		strNewPath=strPrjPath+"/graph/lmxx/";
		if (spImg!=null && fiSpImg!=null)
		{
			if (idg.getSpImg()!=null)
			{
				if (!"".equals(idg.getSpImg()))
				{
					MyUtils.delFile(strNewPath+idg.getSpImg());
				}
			}
			strNewName=MyUtils.upload(spImg, strNewPath, fiSpImg);
			ig.setSpImg(strNewName);
		}
				
		this.tip="成功提交！";
		this.dstJsp="sysmanaG.action";
		success=lineIgoService.updateIgo(ig);
		return SUCCESS;
	}
	public String deleteIgoById()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath=strPrjPath+"/graph/lmxx/";
		LineIgo ig=lineIgoService.findIgoById(igoId);
		if (ig==null)
		{
			this.tip="操作失败，无此记录！";
			this.dstJsp="sysmanaG.action";
			success=true;
			return SUCCESS;
		}
		//删除igo图片
		if (ig.getSpImg()!=null)
		{
			if (!"".equals(ig.getSpImg()))
			{
				MyUtils.delFile(strNewPath+ig.getSpImg());
			}
		}
		
		success=lineIgoService.deleteIgoById(igoId);
		this.tip="成功删除！";
		this.dstJsp="sysmanaG.action";
		return SUCCESS;
	}
}
