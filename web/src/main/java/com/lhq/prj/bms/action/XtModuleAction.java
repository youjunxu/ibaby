package com.lhq.prj.bms.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.XtModule;
import com.lhq.prj.bms.service.IAclInfoService;
import com.lhq.prj.bms.service.IUserInfoService;
import com.lhq.prj.bms.service.IXtModuleService;

public class XtModuleAction extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private IXtModuleService xtModuleService;
	private XtModule xtModule;
	private boolean success;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public XtModule getXtModule() {
		return xtModule;
	}

	public void setXtModule(XtModule x) {
		this.xtModule = x;
	}

	public void setXtModuleService(IXtModuleService x) {
		this.xtModuleService = x;
	}
	public List findByAllModuleInfo()
	{
		return (List)xtModuleService.findByAllModule(); 
	}
	public void setNoLoginAcl(){
		String strRetu="";
		List macl;
		Integer uacl=0;
		Integer ilmp=0;
		
		uacl=0;
		strRetu="";
		//ÄäÃûÕß
		uacl=0;
		macl=findByAllModuleInfo();
		if (macl.size()>0)
		{
			for(ilmp=0;ilmp<macl.size();ilmp=ilmp+1)
			{
				XtModule x=(XtModule)macl.get(ilmp);
				if (x.getNoLoginAcl()!="")
				{
					if (strRetu!="") strRetu=strRetu+",";
					strRetu=strRetu+x.getMkCode()+x.getUserAcl();
				}
			}
		}
		
		getSession().setAttribute("flagUser",uacl);
		getSession().setAttribute("userAcl",strRetu);
	}
	
}
