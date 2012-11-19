package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.Spgg;
import com.lhq.prj.bms.service.ISpggService;
/**
 * SpggAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class SpggAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private ISpggService spggService;
	private Spgg spgg;
	private boolean success;
	private Integer ggId;
	private String mkCode;
	private String strTitle;
	private String strContent;
	private Integer userId;
	private String strAuthor;
	private String dtCrea;
	private String dstJsp;
	private String tip;
	private Integer flagEdit;	//0--查看  1--编辑

	public Integer getGgId() {
		return ggId;
	}
	public void setGgId(Integer s) {
		this.ggId = s;
	}
	public String getMkCode() {
		return mkCode;
	}
	public void setMkCode(String s) {
		this.mkCode = s;
	}
	public String getStrTitle() {
		return strTitle;
	}
	public void setStrTitle(String s) {
		this.strTitle = s;
	}
	public String getStrContent() {
		return strContent;
	}
	public void setStrContent(String s) {
		this.strContent = s;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getStrAuthor() {
		return strAuthor;
	}
	public void setStrAuthor(String s) {
		this.strAuthor = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
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

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Spgg getSpgg() {
		return spgg;
	}

	public void setSpgg(Spgg l) {
		this.spgg = l;
	}

	public void setSpggService(ISpggService l) {
		this.spggService = l;
	}
	public String saveSpgg()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		Spgg gg=new Spgg();
		gg.setMkCode(mkCode);
		gg.setStrTitle(strTitle);
		gg.setStrContent(strContent);
		gg.setUserId(userId);
		gg.setStrAuthor(strAuthor);

		sdt=getStringDateShort();
		gg.setDtCrea(sdt);
		Integer i=spggService.saveSpgg(gg);
		this.tip="成功提交";
		this.dstJsp="sysmanaA.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功发布系统公告");
		spggService.addGgLogInfo(lg);

		success=true;
		return SUCCESS;
	}
	public String updateSpgg() throws Exception 
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		sdt=getStringDateShort();
		Spgg gg=spggService.findSpggById(ggId);
		gg.setStrTitle(strTitle);
		gg.setStrContent(strContent);
		gg.setMkCode(mkCode);

		success=spggService.updateSpgg(gg);
		this.tip="成功提交";
		this.dstJsp="sysmanaA.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功更新系统公告文章");
		spggService.addGgLogInfo(lg);
		
		return SUCCESS;
	}
	public String deleteSpgg()
	{
		UserInfo _user=(UserInfo)getSession().getAttribute("user");
		if (_user==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}

		success=spggService.deleteSpggById(ggId);
		this.tip="成功删除";
		this.dstJsp="sysmanaA.action";

		//写日志
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(_user.getUserId());
		lg.setUserName(_user.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("成功删除公告文章");
		spggService.addGgLogInfo(lg);
		return SUCCESS;
	}
	public String sysGgOpen()
	{
		Spgg s=spggService.findSpggById(ggId);
		getRequest().setAttribute("waitOpen_spggDoc", s);
		getRequest().setAttribute("waitOpen_Edit", flagEdit);

		success=true;
		return SUCCESS;
	}
	public String prevActGgOpen()
	{
		Spgg s=spggService.findSpggById(ggId);
		getRequest().setAttribute("waitOpen_spggDoc", s);

		success=true;
		return SUCCESS;
	}
	public String sysmanaA()
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
		int iz=spggService.findByCount();
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

		List l=spggService.findAllSpgg(p);
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
