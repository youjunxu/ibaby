package com.lhq.prj.bms.action;

import java.util.List;
import java.util.ArrayList;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.po.EjDocuments;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.IEjDocumentsService;

/**
 * EjDocumentsAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class EjDocumentsAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private IEjDocumentsService ejDocumentsService;
	private EjDocuments ejDocuments;
	private boolean success;
	private Integer userId;
	private String strCurDispLb;
	private String tip;
	private String dstJsp;
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public EjDocuments getEjDocuments() {
		return ejDocuments;
	}

	public void setEjDocuments(EjDocuments l) {
		this.ejDocuments = l;
	}

	public void setEjDocumentsService(IEjDocumentsService l) {
		this.ejDocumentsService = l;
	}
	public void setUserId(Integer i)
	{
		this.userId=i;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setStrCurDispLb(String s)
	{
		this.strCurDispLb=s;
	}
	public String getStrCurDispLb()
	{
		return strCurDispLb;
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

	public String myPersonContent()
	{
		UserInfo ou=(UserInfo)getSession().getAttribute("user");
		if (ou==null)
		{
			this.tip="非法操作，请您登录！";
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

		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=0;
		int li=0;
		int ls=0;
		Integer intLmp;
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

//		List la=null;
		List lb=null;
		List lc=null;
		List lf=null;
		if (strCurDispLb==null)
		{
			strCurDispLb="ALL";
		}else
		{
			if (strCurDispLb.equals(""))
			{
				strCurDispLb="ALL";
			}
		}
		getRequest().setAttribute("sysLb_disp", strCurDispLb);
//		la=ejDocumentsService.findAllDocByUserId(ou.getUserId());
		lb=ejDocumentsService.findBADocByEjUser(ou.getUserId());
		lc=ejDocumentsService.findAllHomeJsByUserId(ou.getUserId());
		lf=lb;
//		getRequest().setAttribute("sysCountA_disp", la.size());
		getRequest().setAttribute("sysCountB_disp", lb.size());
		getRequest().setAttribute("sysCountC_disp", lc.size());
		iz=lf.size();
		List lfin=new ArrayList();
		if (iz>0)
		{
			for (intLmp=ls;intLmp<(ls+li);intLmp++)
			{
				if (intLmp<iz)
				{
					lfin.add(lf.get(intLmp));
				}else
				{
					break;
				}
			}
		}
		UserEj ej=ejDocumentsService.findEjById(ou.getUserId());
		getRequest().setAttribute("sysPerson_disp", ej);
		getRequest().setAttribute("sysList_disp", lfin);
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
	public String oPersonContent()
	{
		UserEj ej=(UserEj)getSession().getAttribute("waitListA_ej");
		if (ej==null)
		{
			if (userId==null)
			{
				this.tip="非法操作，请您登录！";
				this.dstJsp="login.jsp";
				return "input";
			}
			ej=ejDocumentsService.findEjById(userId);
			if (ej==null)
			{
				this.tip="非法操作，请您登录！";
				this.dstJsp="login.jsp";
				return "input";
			}
			getSession().setAttribute("waitListA_ej",ej);
		}
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=0;
		int li=0;
		int ls=0;
		Integer intLmp;
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

		List la=null;
		List lb=null;
		List lc=null;
		List lf=null;

		lb=ejDocumentsService.findBADocAByEjUser(userId);
		lc=ejDocumentsService.findAllHomeJsByUserId(userId);
		lf=lb;
		getRequest().setAttribute("sysCountB_disp", lb.size());
		getRequest().setAttribute("sysCountC_disp", lc.size());
		iz=lf.size();
		List lfin=new ArrayList();
		if (iz>=ls)
		{
			for (intLmp=ls;intLmp<(ls+li);intLmp++)
			{
				if (intLmp<iz)
				{
					lfin.add(lf.get(intLmp));
				}else
				{
					break;
				}
			}
		}
		getRequest().setAttribute("sysList_disp", lfin);
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
	public String oPersonJs()
	{
		String tmpa = getRequest().getParameter("limit");
		String tmpb = getRequest().getParameter("start");
		int iz=0;
		int li=0;
		int ls=0;
		Integer intLmp;
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

		List la=null;
		List lb=null;
		List lc=null;
		List lf=null;

		lb=ejDocumentsService.findBADocByEjUser(userId);
		lc=ejDocumentsService.findAllHomeJsByUserId(userId);
		lf=lc;
		getRequest().setAttribute("sysCountB_disp", lb.size());
		getRequest().setAttribute("sysCountC_disp", lc.size());
		iz=lf.size();
		List lfin=new ArrayList();
		if (iz>=ls)
		{
			for (intLmp=ls;intLmp<(ls+li);intLmp++)
			{
				if (intLmp<iz)
				{
					lfin.add(lf.get(intLmp));
				}else
				{
					break;
				}
			}
		}
		getRequest().setAttribute("sysList_disp", lfin);
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
