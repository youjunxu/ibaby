package com.lhq.prj.bms.action;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.po.NetXx;
import com.lhq.prj.bms.po.LogInfo;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.service.INetXxService;

@SuppressWarnings("serial")
public class NetXxAction extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private INetXxService netXxService;
	private NetXx netXx;
	private boolean success;
	private String aboutUs;
	private String xgSm;
	private String dtCrea;
	private Integer userId;
	private String nickName;
	private String tip;
	private String dstJsp;

	public String getAboutUs() {
		return aboutUs;
	}
	public void setAboutUs(String s) {
		this.aboutUs = s;
	}
	public String getXgSm() {
		return xgSm;
	}
	public void setXgSm(String s) {
		this.xgSm = s;
	}
	public String getDtCrea() {
		return dtCrea;
	}
	public void setDtCrea(String s) {
		this.dtCrea = s;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer s) {
		this.userId = s;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String s) {
		this.nickName = s;
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

	public NetXx getNetXx() {
		return netXx;
	}

	public void setNetXx(NetXx l) {
		this.netXx = l;
	}

	public void setNetXxService(INetXxService l) {
		this.netXxService = l;
	}
	public String saveNetXx()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		String sdt;
		NetXx nx=new NetXx();
		nx.setAboutUs(aboutUs);

		sdt=getStringDateShort();
		nx.setDtCrea(sdt);
		nx.setNickName(ui.getNickName());
		nx.setUserId(ui.getUserId());
		nx.setXgSm(xgSm);
		netXxService.saveNetXx(nx);
		this.tip="成功提交！";
		this.dstJsp="sysmanaNET.action";
		
		success=true;
		return SUCCESS;
	}
	public String updateNetXx() throws Exception
	{
		String sdt;
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		NetXx nx=netXxService.findNetXx();
		if (nx==null)
		{
			this.tip="处理失败！";
			this.dstJsp="sysmanaNET.action";
			return "input";
		}
		nx.setAboutUs(aboutUs);
		nx.setXgSm(xgSm);
		sdt=getStringDateShort();
		nx.setDtCrea(sdt);
		nx.setNickName(ui.getNickName());
		nx.setUserId(ui.getUserId());
		success=netXxService.updateNetXx(nx);
		this.tip="成功更新！";
		this.dstJsp="sysmanaNET.action";
		
		return SUCCESS;
	}
	public String sysmanaNET()
	{
		UserInfo ui=(UserInfo)getSession().getAttribute("user");
		if (ui==null)
		{
			this.tip="对不起，请您先登录！";
			this.dstJsp="login.jsp";
			return "input";
		}
		NetXx nx=netXxService.findNetXx();
		getRequest().setAttribute("waitDoc", nx);
		
		success=true;
		return SUCCESS;
	}
	public String prevOpenNetXx()
	{
		NetXx nx=netXxService.findNetXx();
		getRequest().setAttribute("waitDoc", nx);
		getRequest().setAttribute("waitLb", Integer.valueOf(tip));
		
		success=true;
		return SUCCESS;
	}
}
