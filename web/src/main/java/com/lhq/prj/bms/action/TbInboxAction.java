package com.lhq.prj.bms.action;

import java.util.ArrayList;
import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.UserEj;
import com.lhq.prj.bms.po.TbInbox;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.ITbInboxService;
/**
 * TbInboxAction.java Create on 2012-8-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class TbInboxAction extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private ITbInboxService tbInboxService;
	private TbInbox tbInbox;
	private boolean success;
	private Integer xxId;
	private Integer sendUserId;
	private String sendUserName;
	private Integer recUserId;
	private String recUserName;
	private String dtSend;
	private String xxTitle;
	private String xxBody;
	private Integer ydBj;
	private Integer xsOut;
	private Integer xsIn;
	private Integer hfXxId;
	private String tip;
	private String dstJsp;
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public TbInbox getTbInbox() {
		return tbInbox;
	}

	public void setTbInbox(TbInbox l) {
		this.tbInbox = l;
	}

	public void setTbInboxService(ITbInboxService l) {
		this.tbInboxService = l;
	}
	public Integer getXxId() {
		return xxId;
	}
	public void setXxId(Integer s) {
		this.xxId = s;
	}
	public Integer getSendUserId() {
		return sendUserId;
	}
	public void setSendUserId(Integer s) {
		this.sendUserId = s;
	}
	public String getSendUserName() {
		return sendUserName;
	}
	public void setSendUserName(String s) {
		this.sendUserName = s;
	}
	public Integer getRecUserId() {
		return recUserId;
	}
	public void setRecUserId(Integer s) {
		this.recUserId = s;
	}
	public String getRecUserName() {
		return recUserName;
	}
	public void setRecUserName(String s) {
		this.recUserName = s;
	}
	public String getDtSend() {
		return dtSend;
	}
	public void setDtSend(String s) {
		this.dtSend = s;
	}
	public String getXxTitle() {
		return xxTitle;
	}
	public void setXxTitle(String s) {
		this.xxTitle = s;
	}
	public String getXxBody() {
		return xxBody;
	}
	public void setXxBody(String s) {
		this.xxBody = s;
	}
	public Integer getYdBj() {
		return ydBj;
	}
	public void setYdBj(Integer s) {
		this.ydBj = s;
	}
	public Integer getXsOut() {
		return xsOut;
	}
	public void setXsOut(Integer s) {
		this.xsOut = s;
	}
	public Integer getXsIn() {
		return xsIn;
	}
	public void setXsIn(Integer s) {
		this.xsIn = s;
	}
	public Integer getHfXxId() {
		return hfXxId;
	}
	public void setHfXxId(Integer s) {
		this.hfXxId = s;
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

	public String myInBox()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		List lb=tbInboxService.findInboxByUser(ui.getUserId());
		
		getRequest().setAttribute("waitDisp_xxzs", lb.size());
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
		getRequest().setAttribute("sysCount_disp", iz);
		getRequest().setAttribute("waitDisp_inbox", lf);
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);

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
	public String myOutBox()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		List lb=tbInboxService.findOutboxByUser(ui.getUserId());
		
		getRequest().setAttribute("waitDisp_xxzs", lb.size());
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
		if (lb.size()>ls)
		{
			intTmp=ls+li;
			if (iz<intTmp) intTmp=iz;
			for (intLmp=ls;intLmp<intTmp;intLmp++)
			{
				lf.add(lb.get(intLmp));
			}
		}
		getRequest().setAttribute("sysCount_disp", iz);
		getRequest().setAttribute("waitDisp_outbox", lf);
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);

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
	public String prevSendNewMsg()
	{
		UserInfo ue=(UserInfo)getSession().getAttribute("user");
		if (ue==null)
		{
			this.tip="请您首先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		if (recUserId!=null)
		{
			UserEj uj=tbInboxService.findEjById(recUserId);
			getRequest().setAttribute("waitRec_userId", recUserId);
			getRequest().setAttribute("waitRec_userName", uj.getUserName());
		}else
		{
			List hy=tbInboxService.findAllFriendsById(ue.getUserId());
			getRequest().setAttribute("waitRec_hy", hy);
		}
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ue.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		success=true;
		return SUCCESS;
	}
	public String deleteMsgByInbox()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		String[] objLmp;
		
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		
		objLmp=tip.split(",");
		Integer intLmp;
		Integer intTmp;
		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
			intTmp=Integer.valueOf(objLmp[intLmp]);
			TbInbox tb=tbInboxService.findInboxById(intTmp);
			if (tb==null )
			{
				this.tip="非法操作！";
				this.dstJsp="myInBox.action";
				success=false;
				return SUCCESS;
			}
			if (!tb.getRecUserId().equals(ui.getUserId()))
			{
				this.tip="非法操作！";
				this.dstJsp="myInBox.action";
				success=false;
				return SUCCESS;
			}
			if (tb.getXsOut()==0)
			{
				success=tbInboxService.deleteTbInboxById(intTmp);
			}else
			{
				success=tbInboxService.deleteTbInboxByIn(intTmp);
			}
		}
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		
		this.tip="成功删除！";
		this.dstJsp="myInBox.action";
		success=true;
		return SUCCESS;
	}
	public String deleteMsgByOutbox()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		String[] objLmp;
		
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		
		objLmp=tip.split(",");
		Integer intLmp;
		Integer intTmp;
		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
			intTmp=Integer.valueOf(objLmp[intLmp]);
			TbInbox tb=tbInboxService.findInboxById(intTmp);
			if (tb==null )
			{
				this.tip="非法操作1！";
				this.dstJsp="myInBox.action";
				return "input";
			}
			if (!tb.getSendUserId().equals(ui.getUserId()))
			{
				this.tip="非法操作2！";
				this.dstJsp="myInBox.action";
				return "input";
			}
			if (tb.getXsIn()==0)
			{
				success=tbInboxService.deleteTbInboxById(intTmp);
			}else
			{
				success=tbInboxService.deleteTbInboxByOut(intTmp);
			}
		}
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		
		this.tip="成功删除！";
		this.dstJsp="myOutBox.action";
		success=true;
		return SUCCESS;
	}
	public String sendNewMsg()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		TbInbox tb=new TbInbox();
		tb.setRecUserId(recUserId);
		UserEj uj=tbInboxService.findEjById(recUserId);
		tb.setRecUserName(uj.getNickName());
		String sdt=getStringDateShort();
		tb.setDtSend(sdt);
		tb.setSendUserId(ui.getUserId());
		tb.setSendUserName(ui.getNickName());
		tb.setXxBody(xxBody);
		tb.setXxTitle(xxTitle);
		tb.setYdBj(0);
		tb.setXsOut(1);
		tb.setXsIn(1);
		tb.setHfXxId(0);
		tbInboxService.saveTbInbox(tb);
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		
		this.tip="成功发送站内信件！";
		this.dstJsp="myInBox.action";
		
		success=true;
		return SUCCESS;
	}
	public String sendHfMsg()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		TbInbox tb=new TbInbox();
		tb.setRecUserId(recUserId);
		UserEj uj=tbInboxService.findEjById(recUserId);
		tb.setRecUserName(uj.getNickName());
		String sdt=getStringDateShort();
		tb.setDtSend(sdt);
		tb.setSendUserId(ui.getUserId());
		tb.setSendUserName(ui.getUserName());
		tb.setXxBody(xxBody);
		tb.setXxTitle(xxTitle);
		tb.setYdBj(0);
		tb.setXsOut(1);
		tb.setXsIn(1);
		tb.setHfXxId(hfXxId);
		tbInboxService.saveTbInbox(tb);
		
		this.tip="成功发送站内信件！";
		this.dstJsp="myInBox.action";
		
		success=true;
		return SUCCESS;
	}
	public String prevOpenInboxMsg() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		TbInbox tb=tbInboxService.findInboxById(xxId);
		if (tb!=null)
		{
			if (tb.getYdBj()==0)
			{
				success=tbInboxService.updateInBoxSeek(xxId);
			}
		}
		TbInbox tc=tbInboxService.findInboxById(xxId);
		getRequest().setAttribute("waitDisp_doc",tc);
		if (tc.getSendUserName().equals("admin"))
		{
			getRequest().setAttribute("waitDisp_send","系统管理员");
		}else
		{
			getRequest().setAttribute("waitDisp_send",tc.getSendUserName());
		}
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		
		
		success=true;
		return SUCCESS;
	}
	public String prevOpenOutboxMsg() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="非法操作，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		TbInbox tb=tbInboxService.findInboxById(xxId);
		getRequest().setAttribute("waitDisp_doc",tb);
		UserEj ue=tbInboxService.findEjById(tb.getRecUserId());
		getRequest().setAttribute("waitDisp_rec",ue);
		//新信件数
		Integer intNew=tbInboxService.findNewInboxCountByUser(ui.getUserId());
		getRequest().setAttribute("sysNewIn_zs", intNew);
		success=true;
		return SUCCESS;
	}
}
