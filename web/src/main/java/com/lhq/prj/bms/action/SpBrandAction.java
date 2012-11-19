package com.lhq.prj.bms.action;

import java.util.List;
import java.io.File;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.po.SpBrand;
import com.lhq.prj.bms.po.SpType;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.service.ISpBrandService;
import com.lhq.prj.bms.core.Page;
/**
 * SpBrandAction.java Create on 2012-6-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SpBrandAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private ISpBrandService spBrandService;
	private SpBrand spBrand;
	private boolean success;
	private Integer brandId;
	private Integer spTypeId;
	private String spTypeName;
	private String brandName;
	private String brandImg;
	private File fiBrandImg;
	private Integer dispXh;
	private String zbName;
	private String zbDw;
	private List typeBrandList;
	private String dstJsp;
	private String tip;
	private Integer flagEdit;	//0--查看  1--编辑

	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public SpBrand getSpBrand() {
		return spBrand;
	}
	public void setSpBrand(SpBrand l) {
		this.spBrand = l;
	}

	public void setSpBrandService(ISpBrandService l) {
		this.spBrandService = l;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer s) {
		this.brandId = s;
	}
	public Integer getSpTypeId() {
		return spTypeId;
	}
	public void setSpTypeId(Integer s) {
		this.spTypeId = s;
	}
	public String getSpTypeName() {
		return spTypeName;
	}
	public void setSpTypeName(String s) {
		this.spTypeName = s;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String s) {
		this.brandName = s;
	}
	public String getBrandImg() {
		return brandImg;
	}
	public void setBrandImg(String s) {
		this.brandImg = s;
	}
	public File getFiBrandImg() {
		return fiBrandImg;
	}
	public void setFiBrandImg(File s) {
		this.fiBrandImg = s;
	}
	public Integer getDispXh() {
		return dispXh;
	}
	public void setDispXh(Integer s) {
		this.dispXh = s;
	}

	public String getZbName() {
		return zbName;
	}
	public void setZbName(String s) {
		this.zbName = s;
	}
	public String getZbDw() {
		return zbDw;
	}
	public void setZbDw(String s) {
		this.zbDw = s;
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
	public Integer getFlagEdit() {
		return flagEdit;
	}
	public void setFlagEdit(Integer s) {
		if (s==null)
		{
			this.flagEdit=0;
		}else
		{
			this.flagEdit = s;
		}
	}

	public List getTypeBrandList()
	{
		return typeBrandList;
	}
	public void setTypeBrandList(List s)
	{
		this.typeBrandList=s;
	}
	
	public String findBrandByType()
	{
		getRequest().removeAttribute("reqListCondBrand");
		List l=spBrandService.findBrandByType(spTypeId);
		typeBrandList=l;
		
		SpType sp=spBrandService.findTypeById(spTypeId);
		if (sp!=null)
		{
			this.spTypeName=sp.getSpTypeName();
			this.zbName=sp.getZbName();
			this.zbDw=sp.getZbDw();
			success = true;
		}else
		{
			success = false;
		}
		
		success=true;
		return SUCCESS;
	}
	public String sysmanaLX()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=spBrandService.findPpByCount();
		int li=0;
		int ls=0;
		String[] objLmp;
		
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

		List l=spBrandService.findAllSpTypeByPage(p);
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
	public String sysmanaPP()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=spBrandService.findPpByCount();
		int li=0;
		int ls=0;
		String[] objLmp;
		
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

		List l=spBrandService.findAllSpxhByPage(p);
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
	public String deleteSpTypeById()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		success=spBrandService.deleteSpTypeById(spTypeId);
		success=spBrandService.deleteSpBrandAById(spTypeId);
		this.tip="成功删除";
		this.dstJsp="sysmanaLX.action";
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除类型");
		spBrandService.addSpLogInfo(lg);
		
		return SUCCESS;
	}
	public String deleteSpBrandById()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath;
		SpBrand sp=spBrandService.findBrandById(brandId);
		if (sp.getBrandImg()!=null)
		{
			if (!"".equals(sp.getBrandImg()))
			{
				strNewPath=strPrjPath+"/graph/lmxx/";
				MyUtils.delFile(strNewPath+sp.getBrandImg());
			}
		}
		success=spBrandService.deleteSpBrandById(brandId);
		this.tip="成功删除";
		this.dstJsp="sysmanaPP.action";
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除品牌");
		spBrandService.addSpLogInfo(lg);
		return SUCCESS;
	}
	public String sysSpppOpen()
	{
		SpBrand la=spBrandService.findBrandById(brandId);
		getRequest().setAttribute("waitEdit_doc", la);
		List lb=spBrandService.findAllSpType();
		getRequest().setAttribute("waitList_lx", lb);
		
		success=true;
		return SUCCESS;
	}
	public String sysPrevNew()
	{
		List lb=spBrandService.findAllSpType();
		getRequest().setAttribute("waitList_lx", lb);
		
		success=true;
		return SUCCESS;
	}
	public String saveSpType()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		SpType p=new SpType();
		p.setSpTypeName(spTypeName);
		p.setZbName(zbName);
		p.setZbDw(zbDw);
		Integer i=spBrandService.saveSpType(p);
		this.tip="成功提交";
		this.dstJsp="sysmanaLX.action";
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功新增类型");
		spBrandService.addSpLogInfo(lg);
		
		success=true;
		return SUCCESS;
	}
	public String updateSpType() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		SpType sp=new SpType();
		sp.setSpTypeId(spTypeId);
		sp.setSpTypeName(spTypeName);
		sp.setZbName(zbName);
		sp.setZbDw(zbDw);
		success=spBrandService.updateSpType(sp);
		SpBrand sa=new SpBrand();
		sa.setSpTypeId(spTypeId);
		sa.setSpTypeName(spTypeName);
		success=spBrandService.updateSpBrandB(sa);

		this.tip="成功提交";
		this.dstJsp="sysmanaLX.action";
		success=true;

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新商品类型");
		spBrandService.addSpLogInfo(lg);

		return SUCCESS;
	}
	public String saveSpBrand()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		SpBrand p=new SpBrand();
		p.setBrandName(brandName);
		p.setSpTypeId(spTypeId);
		p.setSpTypeName(spTypeName);
		p.setDispXh(dispXh);

		if (brandImg==null || fiBrandImg==null)
		{
			this.tip="未上传图片或更新失败！";
			this.dstJsp="sysmanaPP.action";
			return SUCCESS;
		}

		String strPrjPath=getSession().getServletContext().getRealPath("/");
		String strNewPath="";
		String strNewName="";
		strNewPath=strPrjPath+"/graph/lmxx/";
			
		strNewName=MyUtils.upload(brandImg, strNewPath, fiBrandImg);
		p.setBrandImg(strNewName);

		Integer i=spBrandService.saveSpBrand(p);
		this.tip="成功提交";
		this.dstJsp="sysmanaPP.action";
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功新增品牌");
		spBrandService.addSpLogInfo(lg);
		
		success=true;
		return SUCCESS;
	}
	public String updateSpBrandA() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		SpBrand p=spBrandService.findBrandById(brandId);
		if (p==null)
		{
			this.tip="更新失败！";
			this.dstJsp="sysmanaPP.action";
			return "input";
		}
		p.setBrandName(brandName);
		p.setSpTypeId(spTypeId);
		p.setSpTypeName(spTypeName);
		p.setDispXh(dispXh);
		if (brandImg!=null && !"".equals(brandImg))
		{
			String strPrjPath=getSession().getServletContext().getRealPath("/");
			String strNewPath="";
			String strNewName="";
			strNewPath=strPrjPath+"/graph/lmxx/";
			
			if (p.getBrandImg()!=null)
			{
				if (!"".equals(p.getBrandImg()))
				{
					MyUtils.delFile(strNewPath+p.getBrandImg());
				}
			}
			
			strNewName=MyUtils.upload(brandImg, strNewPath, fiBrandImg);
			p.setBrandImg(strNewName);
		}
 
		success=spBrandService.updateSpBrandA(p);
		if (success)
		{
			this.tip="成功提交";
			//写日志
			LogInfo lg=new LogInfo();
			lg.setCzDate(getStringDateShort());
			lg.setLogIp(getRequest().getRemoteAddr());
			lg.setUserId(_user.getUserId());
			lg.setUserName(_user.getUserName());
			lg.setCName("SYS");
			lg.setOperatorDesc("成功更新品牌");
			spBrandService.addSpLogInfo(lg);
		}else
		{
			this.tip="提交失败！";
		}
		this.dstJsp="sysmanaPP.action";
		return SUCCESS;
	}
	public String prevEditSpType()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		SpType sp=spBrandService.findTypeById(spTypeId);
		if (sp==null)
		{
			this.tip="调用错误！";
			this.dstJsp="sysmanaLX.action";
			return "input";
		}
		getRequest().setAttribute("waitEdit_lx", sp);
		success=true;
		return SUCCESS;
	}
}
