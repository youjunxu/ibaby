package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.HomeJs;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IHomeJsService;
/**
 * HomeJsAction.java Create on 2012-8-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")

public class HomeJsAction extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private IHomeJsService homeJsService;
	private HomeJs homeJs;
	private boolean success;
	private Integer jsId;
	private String jsTitle;
	private Integer userId;
	private String userName;
	private String strContent;
	private String dtCrea;
	private String strMemo;
	private Integer docLevel;
	private String docPass;
	private Integer shBj;
	private String shRq;
	private Integer shUserId;
	private String shUserName;
	private String tip;
	private String dstJsp;

	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public HomeJs getHomeJs() {
		return homeJs;
	}
	public void setHomeJs(HomeJs l) {
		this.homeJs = l;
	}
	public void setHomeJsService(IHomeJsService l) {
		this.homeJsService = l;
	}
	public Integer getJsId() {
		return jsId;
	}
	public void setJsId(Integer s) {
		this.jsId = s;
	}
	public String getJsTitle() {
		return jsTitle;
	}
	public void setJsTitle(String s) {
		this.jsTitle = s;
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
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}
	public String getStrMemo() {
		return strMemo;
	}
	public void setStrMemo(String s) {
		this.strMemo = s;
	}
	public Integer getDocLevel() {
		return docLevel;
	}
	public void setDocLevel(Integer s) {
		this.docLevel = s;
	}
	public String getDocPass() {
		return docPass;
	}
	public void setDocPass(String s) {
		this.docPass = MyUtils.str2MD5(s);
	}
	public Integer getShBj() {
		return shBj;
	}
	public void setShBj(Integer s) {
		this.shBj = s;
	}
	public String getShRq() {
		return shRq;
	}
	public void setShRq(String s) {
		this.shRq = s;
	}

	public Integer getShUserId() {
		return shUserId;
	}
	public void setShUserId(Integer s) {
		this.shUserId = s;
	}
	public String getShUserName() {
		return shUserName;
	}
	public void setShUserName(String s) {
		this.shUserName = s;
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
	public String deleteHomeJsById()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		String[] objLmp;
		
		if (ui==null || jsId==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			success=false;
			return "input";
		}
		
		HomeJs tb=homeJsService.findHomeJsById(jsId);
		if (tb==null )
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return "input";
		}
		if (!tb.getUserId().equals(ui.getUserId()))
		{
			this.tip="您无权操作！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return "input";
		}
		success=homeJsService.deleteHomeJsById(jsId);
		
		this.tip="成功删除！";
		this.dstJsp="firstMyHomeJs.action";
		success=true;
		return SUCCESS;
	}
	public String prevNewHomeJs()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		UserEj eja=(UserEj)getSession().getAttribute("waitDisp_ej");
		if (eja==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		
		success=true;
		return SUCCESS;
	}
	public String prevOpenHomeJs()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		HomeJs hj=homeJsService.findHomeJsById(jsId);
		if (hj==null)
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return "input";
		}
		UserEj eja=(UserEj)getSession().getAttribute("waitDisp_ej");
		if (eja==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (_user==null)
		{
			if (hj.getDocLevel()!=0)
			{
				this.tip="作者设置了保密！";
				this.dstJsp="firstMyHomeJs.action";
				success=false;
				return "input";
			}
		}else
		{
			if (!_user.getUserId().equals(hj.getUserId()))
			{
				if (hj.getDocLevel()!=0)
				{
					this.tip="作者设置了保密！";
					this.dstJsp="firstMyHomeJs.action";
					success=false;
					return "input";
				}
			}
		}
		getRequest().setAttribute("waitOpen_doc", hj);
		
		success=true;
		return SUCCESS;
	}
	public String checkHomeJsAcl()
	{
		HomeJs hj=homeJsService.findHomeJsById(jsId);
		if (hj==null)
		{
			this.tip="非法操作！";
			success=false;
			return SUCCESS;
		}
		getSession().removeAttribute("homejsPass");
		if (hj.getDocLevel()==2)
		{
			if (docPass.equals(hj.getDocPass()))
			{
				getSession().setAttribute("homejsPass", 1);
				this.dstJsp="yes";
			}else
			{
				this.dstJsp="no";
				this.tip="错误密码！";
			}
		}else
		{
			this.tip="非法操作！";
			this.dstJsp="no";
		}
		
		success=true;
		return SUCCESS;
	}
	public String prevOpenQtJsDoc()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		HomeJs hj=homeJsService.findHomeJsById(jsId);
		if (hj==null)
		{
			this.tip="非法操作！";
			success=false;
			return "input";
		}
		if (_user==null)
		{
			if (hj.getDocLevel()==2)
			{
				Integer lp=(Integer)getSession().getAttribute("homejsPass");
				if (lp!=null)
				{
					if (lp!=1)
					{
						this.tip="作者设置了保密！";
						success=false;
						return "input";
					}
				}else
				{
					if (hj.getDocLevel()!=1)
					{
						this.tip="作者设置了保密！";
						success=false;
						return "input";
					}
				}
			}else
			{
				if (hj.getDocLevel()!=1)
				{
					this.tip="作者设置了保密！";
					success=false;
					return "input";
				}
			}
		}
		getRequest().setAttribute("waitOpen_doc", hj);
		
		success=true;
		return SUCCESS;
	}
	public String prevEditHomeJs()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		HomeJs hj=homeJsService.findHomeJsById(jsId);
		if (_user==null)
		{
			this.tip="请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (hj==null)
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			return "input";
		}
		if (!_user.getUserId().equals(hj.getUserId()))
		{
			this.tip="这不是您的文档！";
			this.dstJsp="firstMyHomeJs.action";
			return "input";
		}
		getRequest().setAttribute("waitEdit_doc", hj);
		
		success=true;
		return SUCCESS;
	}
	public String prevEditAclHomeJs()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		HomeJs hj=homeJsService.findHomeJsById(jsId);
		if (_user==null)
		{
			this.tip="请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (hj==null)
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			return "input";
		}
		if (!_user.getUserId().equals(hj.getUserId()))
		{
			this.tip="这不是您的文档！";
			this.dstJsp="firstMyHomeJs.action";
			return "input";
		}
		getRequest().setAttribute("waitEdit_doc", hj);
		
		success=true;
		return SUCCESS;
	}
	public String saveHomeJs()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		String sdt=getStringDateShort();
		HomeJs hs=new HomeJs();
		hs.setDocLevel(docLevel);
		hs.setDocPass(docPass);
		hs.setDtCrea(sdt);
		hs.setJsTitle(jsTitle);
		hs.setStrContent(strContent);
		
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (strMemo==null || "".equals(strMemo))
		{
			this.tip="请输入文档内容！";
			this.dstJsp="prevNewHomeJs.action";
			success=false;
			return SUCCESS;
		}
		hs.setStrMemo(strMemo);
		hs.setUserId(userId);
		hs.setUserName(userName);
		
		homeJsService.saveHomeJs(hs);
		this.tip="成功提交！";
		this.dstJsp="firstMyHomeJs.action";
		success=true;
		return SUCCESS;
	}
	public String updateHomeJs() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (strMemo==null || "".equals(strMemo))
		{
			this.tip="请输入文档内容！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return SUCCESS;
		}
		HomeJs hs=homeJsService.findHomeJsById(jsId);
		if (hs==null)
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return SUCCESS;
		}
		hs.setJsTitle(jsTitle);
		hs.setStrContent(strContent);
		hs.setStrMemo(strMemo);
		this.tip="成功更新！";
		this.dstJsp="firstMyHomeJs.action";
		
		success=homeJsService.updateHomeJsBase(hs);
		return SUCCESS;
	}
	public String updateAclHomeJs() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		HomeJs hs=homeJsService.findHomeJsById(jsId);
		if (hs==null)
		{
			this.tip="非法操作！";
			this.dstJsp="firstMyHomeJs.action";
			success=false;
			return SUCCESS;
		}
		hs.setDocLevel(docLevel);
		hs.setDocPass(docPass);
		success=homeJsService.updateHomeJsBase(hs);
		this.tip="成功更新！";
		this.dstJsp="firstMyHomeJs.action";
		success=true;
		return SUCCESS;
	}
	public String updateShHomeJs() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt=getStringDateShort();
		HomeJs hs=new HomeJs();
		hs.setJsId(jsId);
		hs.setShUserId(shUserId);
		hs.setShUserName(shUserName);
		hs.setShBj(shBj);
		hs.setShRq(sdt);
		
		success=homeJsService.updateHomeJsBase(hs);
		return SUCCESS;
	}
	public String firstMyHomeJs()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		List lb=homeJsService.findAllHomeJsByUserId(ui.getUserId());
		
		getRequest().setAttribute("sysCount_zs", lb.size());
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=lb.size();
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
		List lf=new ArrayList();
		Integer intLmp;
		Integer intTmp;
		if (lb.size()>0)
		{
			intTmp=0;
			for (intLmp=0;intLmp<iz;intLmp++)
			{
				intTmp=intTmp+1;
				if (intTmp>ls && intTmp<=(ls+li))
				{
					lf.add(lb.get(intLmp));
				}
				if (intTmp>(intTmp+li))
				{
					break;
				}
			}
		}
		getRequest().setAttribute("waitDisp_js", lf);
		List le=homeJsService.findBADocByEjUser(ui.getUserId());
		getRequest().setAttribute("waitDisp_ba", le.size());

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
}
