package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.AclInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.Tsjy;
import com.lhq.prj.bms.service.IAclInfoService;
import com.lhq.prj.bms.service.ITsjyService;
/**
 * TsjyAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class TsjyAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private ITsjyService tsjyService;
	private Tsjy tsjy;
	private boolean success;
	private Integer tsjyId;
	private String jyTitle;
	private Integer fbUserId;
	private String fbUserName;
	private String dtFbrq;
	private String strContent;
	private String ipAddr;
	private Integer hfUserId;
	private String hfUserName;
	private String dtHfrq;
	private String hfContent;
	private String tip;
	private String dstJsp;

	public Integer getTsjyId() {
		return tsjyId;
	}
	public void setTsjyId(Integer s) {
		this.tsjyId = s;
	}
	public String getJyTitle() {
		return jyTitle;
	}
	public void setJyTitle(String s) {
		this.jyTitle = s;
	}
	public Integer getFbUserId() {
		return fbUserId;
	}
	public void setFbUserId(Integer s) {
		this.fbUserId = s;
	}
	public String getFbUserName() {
		return fbUserName;
	}
	public void setFbUserName(String s) {
		this.fbUserName = s;
	}
	public String getDtFbrq() {
		return dtFbrq;
	}
	public void setDtFbrq(String s) {
		this.dtFbrq = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String s) {
		this.ipAddr = s;
	}
	public Integer getHfUserId() {
		return hfUserId;
	}
	public void setHfUserId(Integer s) {
		this.hfUserId = s;
	}
	public String getHfUserName() {
		return hfUserName;
	}
	public void setHfUserName(String s) {
		this.hfUserName = s;
	}
	public String getDtHfrq() {
		return dtHfrq;
	}
	public void setDtHfrq(String s) {
		this.dtHfrq = s;
	}
	public String getHfContent() {
		return hfContent;
	}
	public void setHfContent(String s) {
		this.hfContent = s;
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

	public Tsjy getTsjy() {
		return tsjy;
	}

	public void setTsjy(Tsjy l) {
		this.tsjy = l;
	}

	public void setTsjyService(ITsjyService l) {
		this.tsjyService = l;
	}
	public String saveTsjy()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Tsjy ts=new Tsjy();
		String sdt;
		Integer ilmp;
		ts.setJyTitle(jyTitle);
		
		sdt=getStringDateShort();
		ts.setDtFbrq(sdt);
		ts.setDtHfrq(null);
		ts.setFbUserId(ui.getUserId());
		ts.setFbUserName(ui.getNickName());
		ts.setHfContent(null);
		ts.setHfUserId(hfUserId);
		ts.setHfUserName(null);
		ts.setIpAddr(getRemoteAddr());
		ts.setStrContent(strContent);
		
		ilmp=tsjyService.saveTsjy(ts);
		
		this.tip="成功提交！";
		this.dstJsp="prevTsjyIndex.action";
		success=true;
		return SUCCESS;
	}
	public String saveTsjyHf()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(!(strUserAcl.indexOf("906")>=0))
		{
			this.tip="对不起，您无权更新记录！！！";
			this.dstJsp="login.jsp";
			return "input";
		}

		Tsjy ts=tsjyService.findTsjyById(tsjyId);
		if (ts==null)
		{
			this.tip="对不起，非法操作！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		sdt=getStringDateShort();
		ts.setDtHfrq(sdt);

		ts.setHfContent(hfContent);
		ts.setHfUserId(ui.getUserId());
		ts.setHfUserName(ui.getNickName());
		
		success=tsjyService.saveTsjyHf(ts);
		this.tip="成功回复！";
		this.dstJsp="prevTsjyIndex.action";
		return SUCCESS;
	}
	public String deleteTsjy()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Tsjy tj=tsjyService.findTsjyById(tsjyId);
		if (tj==null)
		{
			this.tip="对不起，没有待删除信息！";
			this.dstJsp="error.jsp";
			return "input";
		}
		success=tsjyService.deleteTsjyById(tsjyId);
		this.tip="成功删除";
		this.dstJsp="prevTsjyIndex.action";
		return SUCCESS;
	}
	public String prevTsjyHf()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String strUserAcl=(String)getSession().getAttribute("userAcl");
		if(strUserAcl.indexOf("906")<0)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		Tsjy tj=tsjyService.findTsjyById(tsjyId);
		if (tj==null)
		{
			this.tip="对不起，没有待回复信息！";
			this.dstJsp="manager.jsp";
			return "input";
		}
		getRequest().setAttribute("waitEdit_doc", tj);
		success=true;
		return SUCCESS;
	}
	public String prevTsjyIndex()
	{
		Page p=new Page();
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=tsjyService.findByCount();
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
		
		List l=tsjyService.findAllTsjy(p);
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
}
