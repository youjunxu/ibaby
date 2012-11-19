package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.ILogInfoService;
/**
 * LogInfoAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class LogInfoAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private ILogInfoService logInfoService;
	private LogInfo logInfo;
	private boolean success;
	private Integer logId;
	private Integer userId;
	private String userName;
	private String czDate;
	private String operatorDesc;
	private String cName;
	private String logIp;
	private String strContent;
	private String tip;
	private String dstJsp;

	public Integer getLogId() {
		return logId;
	}
	public void setLogId(Integer s) {
		this.logId = s;
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
	public String getCzDate() {
		return czDate;
	}
	public void setCzDate(String s) {
		this.czDate = s;
	}
	public String getOperatorDesc() {
		return operatorDesc;
	}
	public void setOperatorDesc(String s) {
		this.operatorDesc = s;
	}
	public String getCName() {
		return cName;
	}
	public void setCName(String s) {
		this.cName = s;
	}
	public String getLogIp() {
		return logIp;
	}
	public void setLogIp(String s) {
		this.logIp = s;
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

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public LogInfo getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(LogInfo l) {
		this.logInfo = l;
	}

	public void setLogInfoService(ILogInfoService l) {
		this.logInfoService = l;
	}
	public String sysmanaD()
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
		int iz=logInfoService.findByCount();
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

		List l=logInfoService.findAllLogxx(p);
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
	public String addLogInfo()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		String cname=(String)getRequest().getAttribute("cname");
		String strDesc=(String)getRequest().getAttribute("logDesc");
		String strLb=(String)getRequest().getAttribute("logType");
		
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName(cname);
		lg.setOperatorDesc(strDesc);
		logInfoService.addLogInfo(lg);
		
		if (strLb.equals("LOGIN"))
		{
			return "LOGIN";
		}
		if (strLb.equals("BA_ADD"))
		{
			return "BAADD";
		}
		if (strLb.equals("BA_UPDATE"))
		{
			return "BAUPD";
		}
		
		success=true;
		return SUCCESS;
	}
}
