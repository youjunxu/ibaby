package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.MemberJfgz;
import com.lhq.prj.bms.service.IMemberJfgzService;
/**
 * MemberJfgzAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberJfgzAction extends BaseAction {
	public static final String SUCCESS_MANAGER = "success_manager";
	private IMemberJfgzService memberJfgzService;
	private MemberJfgz memberJfgz;
	private boolean success;

	private Integer gzId;
	private String gzCode;
	private Float jfs;
	private String dtUpdate;
	private String strContent;
	private Integer userId;
	private String userName;
	private String jfDw;
	private String tip;
	private String dstJsp;
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public MemberJfgz getMemberJfgz() {
		return memberJfgz;
	}

	public void setMemberJfgz(MemberJfgz l) {
		this.memberJfgz = l;
	}

	public void setMemberJfgzService(IMemberJfgzService l) {
		this.memberJfgzService = l;
	}

	public Integer getGzId()
	{
		return gzId;
	}
	public void setGzId(Integer s)
	{
		this.gzId=s;
	}
	public String getGzCode()
	{
		return gzCode;
	}
	public void setGzCode(String s)
	{
		this.gzCode=s;
	}
	public Float getJfs()
	{
		return jfs;
	}
	public void setJfs(Float s)
	{
		this.jfs=s;
	}
	public String getDtUpdate()
	{
		return dtUpdate;
	}
	public void setDtUpdate(String s)
	{
		this.dtUpdate=s;
	}
	public String getStrContent()
	{
		return strContent;
	}
	public void setStrContent(String s)
	{
		this.strContent=s;
	}
	public Integer getUserId()
	{
		return this.userId;
	}
	public void setUserId(Integer s)
	{
		this.userId=s;
	}
	public String getUserName()
	{
		return this.userName;
	}
	public void setUserName(String s)
	{
		this.userName=s;
	}
	public String getJfDw()
	{
		return this.jfDw;
	}
	public void setJfDw(String s)
	{
		this.jfDw=s;
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
	public String sysmanaJf()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="�Ƿ�������������¼��";
			this.dstJsp="login.jsp";
			return "input";
		}
		List la=memberJfgzService.findAllJfgz();
		getRequest().setAttribute("sysList_disp", la);
		
		success=true;
		return SUCCESS;
	}

	public String saveJfgz()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="�Ƿ�������������¼��";
			this.dstJsp="login.jsp";
			return "input";
		}
		MemberJfgz mg=new MemberJfgz();
		mg.setGzCode(gzCode);
		mg.setJfs(jfs);
		mg.setStrContent(strContent);
		String sdt=getStringDateShort();
		mg.setDtUpdate(sdt);
		mg.setUserId(ui.getUserId());
		mg.setUserName(ui.getUserName());
		mg.setJfDw(jfDw);
		memberJfgzService.saveJfgz(mg);
		
		//д��־
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ui.getUserId());
		lg.setUserName(ui.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("�ɹ��������ֹ�����Ϣ");
		memberJfgzService.addJfgzLogInfo(lg);

		this.tip="�ɹ������µĻ��ֹ����ڿ�����Ա�޸���ش������ܿ�ͨ�˹���";
		this.dstJsp="sysmanaJf.action";
		success=true;
		return SUCCESS;
	}
	public String prevEditJfgz() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="�Ƿ�������������¼��";
			this.dstJsp="login.jsp";
			return "input";
		}
		MemberJfgz mg=memberJfgzService.findJfgzByCode(gzCode);
		if (mg==null)
		{
			this.tip="δ�ҵ��ù���";
			this.dstJsp="error.jsp";
			return "input";
		}
		getRequest().setAttribute("waitEdit_doc", mg);
		success=true;
		return SUCCESS;
	}
	public String updateJfgz() throws Exception
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="�Ƿ�������������¼��";
			this.dstJsp="login.jsp";
			return "input";
		}
		MemberJfgz mg=memberJfgzService.findJfgzByCode(gzCode);
		if (mg==null)
		{
			this.tip="δ�ҵ��ù���";
			this.dstJsp="sysmanaJf.action";
			return "input";
		}
		mg.setJfs(jfs);
		mg.setStrContent(strContent);
		String sdt=getStringDateShort();
		mg.setDtUpdate(sdt);
		mg.setUserId(ui.getUserId());
		mg.setUserName(ui.getUserName());
		mg.setJfDw(jfDw);
		
		//д��־
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ui.getUserId());
		lg.setUserName(ui.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("�ɹ����»��ֹ�����Ϣ");
		memberJfgzService.addJfgzLogInfo(lg);

		this.tip="�ɹ������µĻ��ֹ����ڿ�����Ա�޸���ش������ܿ�ͨ�˹���";
		this.dstJsp="sysmanaJf.action";
		success=memberJfgzService.updateJfgz(mg);
		return SUCCESS;
	}
	public String deleteJfgzById()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="�Ƿ�������������¼��";
			this.dstJsp="login.jsp";
			return "input";
		}
		success=memberJfgzService.deleteJfgzById(gzId);
		
		//д��־
		LogInfo lg=new LogInfo();
		lg.setCzDate(getStringDateShort());
		lg.setLogIp(getRequest().getRemoteAddr());
		lg.setUserId(ui.getUserId());
		lg.setUserName(ui.getUserName());
		lg.setCName("SYS");
		lg.setOperatorDesc("�ɹ�ɾ�����ֹ�����Ϣ");
		memberJfgzService.addJfgzLogInfo(lg);

		this.tip="�ɹ�ɾ���˹���";
		this.dstJsp="sysmanaJf.action";
		return SUCCESS;
	}
}
