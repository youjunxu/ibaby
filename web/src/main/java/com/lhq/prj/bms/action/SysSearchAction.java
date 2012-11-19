package com.lhq.prj.bms.action;

import java.util.List;
import java.util.ArrayList;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.po.SysSearch;
import com.lhq.prj.bms.service.ISysSearchService;
/**
 * SysSearchAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")

public class SysSearchAction extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private ISysSearchService sysSearchService;
	private SysSearch sysSearch;
	private boolean success;
	private String strBaCond;
	private Integer docId;
	private Integer limit;
	private Integer start;

	public String getStrBaCond() {
		return strBaCond;
	}
	public void setStrBaCond(String s) {
		this.strBaCond = s;
	}
	public Integer getDocId() {
		return docId;
	}
	public void setDocId(Integer s) {
		this.docId = s;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer s) {
		this.limit = s;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer s) {
		this.start = s;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public SysSearch getSysSearch() {
		return sysSearch;
	}

	public void setSysSearch(SysSearch l) {
		this.sysSearch = l;
	}

	public void setSysSearchService(ISysSearchService l) {
		this.sysSearchService = l;
	}
	public String searchSysDoc()
	{
		SysSearch s=new SysSearch();
		String[] objLmp;
		String[] objCond;
		Integer intLmp;
		objLmp=strBaCond.split(" ");
		String smpA;
		String smpB;
		int li=0;
		int ls=0;
		int iz;
		String strLmp="";
		String strTmp="";
		
		li=20;
		ls=0;
		if (limit!=null)
		{
			li=limit;
		}
		if (start!=null)
		{
			ls=start;
		}
		if (strBaCond==null || "".equals(strBaCond))
		{
			iz=0;
		}else
		{
			smpA="";
			smpB="";
			objLmp=strBaCond.split(" ");
			for (intLmp=0;intLmp<objLmp.length;intLmp++)
			{
				strLmp=objLmp[intLmp];
				strTmp="a.strTitle like '%"+strLmp+"%' or a.strContent like '%"+strLmp+"%'";
				strTmp=strTmp+" or a.strMemo like '%"+strLmp+"%'";
				if (smpA!="")
				{
					smpA=smpA+" or ";
				}
				smpA=smpA+strTmp;
				
				strTmp="a.actName like '%"+strLmp+"%' or a.actContent like '%"+strLmp+"%'";
				strTmp=strTmp+"	or a.jpjs like '%"+strLmp+"%'"; 
				if (smpB!="")
				{
					smpB=smpB+" or ";
				}
				smpB=smpB+strTmp;
			}
			
			s.setStrBaCond(smpA);
			s.setStrLyCond(smpB);
			List la=sysSearchService.findAllDocInfoByCond(s);
			iz=la.size();
			List lb=new ArrayList();
			if (iz>=ls)
			{
				for (intLmp=ls;intLmp<(ls+li);intLmp++)
				{
					if (intLmp<iz)
					{
						lb.add(la.get(intLmp));
					}else
					{
						break;
					}
				}
			}
			
			getRequest().setAttribute("waitList_result", lb);
		}
		getRequest().setAttribute("sysCount_disp", iz);
		getRequest().setAttribute("waitList_cond", strBaCond);
		
		//总页数
		Double dblLmp=Math.floor(iz/li);
		Double dblTmp=dblLmp*li;
		if (dblTmp<iz)
		{
			dblLmp=dblLmp+1;
		}
		strLmp=String.valueOf(dblLmp);
		objLmp=strLmp.split("\\.");
		strLmp=objLmp[0];
		Integer intPageZs=Integer.valueOf(strLmp);
		getRequest().setAttribute("sysPageZs_disp", intPageZs);
		
		success=true;
		return SUCCESS;
	}
	public String searchSysDocOld()
	{
		SysSearch s=new SysSearch();
		String[] objLmp;
		String[] objCond;
		Integer intLmp;
		objLmp=strBaCond.split(" ");
		String smp;
		int li=0;
		int ls=0;
		int iz;

		li=20;
		ls=0;
		if (limit!=null)
		{
			li=limit;
		}
		if (start!=null)
		{
			ls=start;
		}
		smp="";
		if (strBaCond==null || "".equals(strBaCond))
		{
			iz=0;
		}else
		{
			s.setStrBaCond(strBaCond);
			List la=sysSearchService.findAllDocInfoByCond(s);
			iz=la.size();
			List lb=new ArrayList();
			if (iz>=ls)
			{
				for (intLmp=ls;intLmp<(ls+li);intLmp++)
				{
					if (intLmp<iz)
					{
						lb.add(la.get(intLmp));
					}else
					{
						break;
					}
				}
			}
			
			getRequest().setAttribute("waitList_result", lb);
		}
		getRequest().setAttribute("sysCount_disp", iz);
		getRequest().setAttribute("waitList_cond", strBaCond);
		
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

