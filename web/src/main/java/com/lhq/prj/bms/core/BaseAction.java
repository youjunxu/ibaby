package com.lhq.prj.bms.core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.lhq.prj.bms.mail.SimpleMailSender;
import com.lhq.prj.bms.po.MailInfo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ObjectFactory;
//import com.sun.java.util.jar.pack.Package.Class.Method;
import java.lang.reflect.Method;

import java.util.*;
import java.text.*;
import com.lhq.prj.bms.mail.*;
import com.lhq.prj.bms.service.IMailInfoService;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	private IMailInfoService mailInfoService;
	public String jsonString;

	public void setMailInfoService(IMailInfoService l) {
		this.mailInfoService = l;
	}
	public void outJsonString(String str) {
		getResponse().setContentType("text/javascript;charset=UTF-8");
		outString(str);
	}

	public void outString(String str) {
		try {
			PrintWriter out = getResponse().getWriter();
			out.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void outXMLString(String xmlStr) {
		getResponse().setContentType("application/xml;charset=UTF-8");
		outString(xmlStr);
	}

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	public HttpSession getSession() {
		return getRequest().getSession();
	}

	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}
	
	public String getRealyPath(String path) {
		return getServletContext().getRealPath(path);
	}
	public String getStringDateShort() { 
		Date currentTime = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String dateString = formatter.format(currentTime); 
		return dateString; 
	}
	public String getStringDateOnly() { 
		Date currentTime = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		String dateString = formatter.format(currentTime); 
		return dateString; 
	}
	public String getRemoteAddr(){
		String ip=getRequest().getHeader("x-forwarded-for");
		if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip=getRequest().getHeader("Proxy-Client-IP");
		}
		if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip=getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip=getRequest().getRemoteAddr();
		}
		return ip;
	}
	public boolean mailSendToUser(String strEmail,String strSubject,String strBody,String strFromU,String strFromP,String strSmtp)
	{
		//获得邮件配置信息
		List l;
		
        //这个类主要来发送邮件  
        SimpleMailSender sms=new SimpleMailSender(strSmtp,strFromU,strFromP);
        try{
        	sms.send(strEmail, strSubject, strBody);
			return true;
        }catch(Exception e)
        {
        	System.out.print("发送邮件失败！");
			return false;
        }
	}
}
