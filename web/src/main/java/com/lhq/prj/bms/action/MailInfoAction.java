package com.lhq.prj.bms.action;

import java.util.List;
import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.po.LmBaej;
import com.lhq.prj.bms.po.MailInfo;
import com.lhq.prj.bms.service.IMailInfoService;
/**
 * MailInfoAction.java Create on 2012-5-4
 * @author andchen
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MailInfoAction  extends BaseAction{
	public static final String SUCCESS_MANAGER = "success_manager";
	private IMailInfoService mailInfoService;
	private MailInfo mailInfo;
	private boolean success;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public MailInfo getMailInfo() {
		return mailInfo;
	}

	public void setMailInfo(MailInfo l) {
		this.mailInfo = l;
	}

	public void setMailInfoService(IMailInfoService l) {
		this.mailInfoService = l;
	}
	public List findAllMailInfo()
	{
		return mailInfoService.findMailInfo();
	}
}
