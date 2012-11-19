package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.service.IAclInfoService;
/**
 * AclInfoAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class AclInfoAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private IAclInfoService aclInfoService;
	private AclInfo aclInfo;
	private boolean success;
	private Integer aclId;
	private Integer userId;
	private String userName;
	private Integer aclLevel;
	private String aclDes;
	private String dtAvil;
	private String dtSxrq;
	private String mkCode;
	private String mkName;
	private String strContent;
	private String tip;
	private String dstJsp;
	private Integer flagEdit;
	
	public Integer getAclId() {
		return aclId;
	}
	public void setAclId(Integer s) {
		this.aclId = s;
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
	public Integer getAclLevel() {
		return aclLevel;
	}
	public void setAclLevel(Integer s) {
		this.aclLevel = s;
	}
	public String getAclDes() {
		return aclDes;
	}
	public void setAclDes(String s) {
		this.aclDes = s;
	}
	public String getDtAvil() {
		return dtAvil;
	}
	public void setDtAvil(String s) {
		this.dtAvil = s;
	}
	public String getDtSxrq() {
		return dtSxrq;
	}
	public void setDtSxrq(String s) {
		this.dtSxrq = s;
	}
	public String getMkCode() {
		return mkCode;
	}
	public void setMkCode(String s) {
		this.mkCode = s;
	}
	public String getMkName() {
		return mkName;
	}
	public void setMkName(String s) {
		this.mkName = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
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
		this.flagEdit = s;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public AclInfo getAclInfo() {
		return aclInfo;
	}

	public void setAclInfo(AclInfo l) {
		this.aclInfo = l;
	}

	public void setAclInfoService(IAclInfoService l) {
		this.aclInfoService = l;
	}
	public String saveAclInfo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		AclInfo ad=new AclInfo();
		ad.setMkCode(mkCode);
		ad.setUserName(userName);
		ad.setAclLevel(aclLevel);
		UserInfo u=new UserInfo();
		u.setUserName(userName);
		UserInfo ua=aclInfoService.findUserById(u);
		if (ua==null)
		{
			this.tip="对不起，该用户不存在！";
			this.dstJsp="sysmanaC.action";
			success=false;
		}else
		{
			List lb=aclInfoService.findAclByAdd(ad);
			if (lb.size()>0)
			{
				this.tip="对不起，该用户已设置过该模块权限！";
				this.dstJsp="sysmanaC.action";
				success=false;
			}else
			{
				String sdt=getStringDateShort();
				AclInfo ac=new AclInfo();
				ac.setMkCode(mkCode);
				ac.setUserId(ua.getUserId());
				ac.setUserName(userName);
				ac.setAclLevel(aclLevel);
				ac.setAclDes(aclDes);
				ac.setDtAvil(sdt);
				ac.setDtSxrq(null);
				ac.setMkName(mkName);
				ac.setStrContent(strContent);
				aclInfoService.saveAclInfo(ac);

				//写日志
				LogInfo lg=new LogInfo();
				lg.setCzDate(getStringDateShort());
				lg.setLogIp(getRequest().getRemoteAddr());
				lg.setUserId(_user.getUserId());
				lg.setUserName(_user.getUserName());
				lg.setCName("SYS");
				lg.setOperatorDesc("成功新增权限");
				aclInfoService.addAclLogInfo(lg);
				
				this.tip="成功提交";
				this.dstJsp="sysmanaC.action";
				success=true;
			}
		}
		
		return SUCCESS;
	}
	public String sysmanaC()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=(int)aclInfoService.findByCount();
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
		List l=aclInfoService.findAllAclInfo(p);
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
	public String deleteAclInfo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		this.tip="成功删除";
		this.dstJsp="sysmanaC.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除权限");
		aclInfoService.addAclLogInfo(lg);

		success=aclInfoService.deleteByAclInfo(aclId);
		return SUCCESS;
	}
	public String chgAclSx() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}

		String sdt=getStringDateShort();
		AclInfo a=new AclInfo();
		a.setAclId(aclId);
		a.setDtSxrq(sdt);
		success=aclInfoService.chgAclSx(a);
		
		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功设置权限的有效性");
		aclInfoService.addAclLogInfo(lg);
		
		this.tip="成功处理";
		this.dstJsp="sysmanaC.action";
		return SUCCESS;
	}
	public String updateAclInfo() throws Exception
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		AclInfo a=new AclInfo();
		a.setAclId(aclId);
		a.setAclDes(aclDes);
		a.setAclLevel(aclLevel);
		a.setStrContent(strContent);
		success=aclInfoService.updateAclInfo(a);

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新权限");
		aclInfoService.addAclLogInfo(lg);

		this.tip="成功修改";
		this.dstJsp="sysmanaC.action";
		return SUCCESS;
	}
	public String sysAclOpen()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="非法操作，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		AclInfo s=aclInfoService.findAclById(aclId);
		List l=aclInfoService.findAllAclLevel();
		getRequest().setAttribute("waitOpen_aclDoc", s);
		getRequest().setAttribute("waitOpen_Edit", flagEdit);
		getRequest().setAttribute("waitOpen_aclLevel", l);

		success=true;
		return SUCCESS;
	}
}
