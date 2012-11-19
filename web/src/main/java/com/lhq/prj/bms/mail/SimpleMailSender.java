package com.lhq.prj.bms.mail;

import java.util.List;
import java.util.Properties;  
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;   

/**  
* 简单邮件发送器，可单发、群发  
* @author andchen
*/   
public class SimpleMailSender  {   
	/*
	 * 发送邮件的props文件
	 */
	private final transient Properties props=System.getProperties();
	/*
	 * 邮件服务器登录验证
	 */
	private transient MailAuthenticator authenticator;
	/*
	 *邮箱session 
	 */
	private transient Session session;
	/*
	 *初始化邮件发送器 
	 *@param smtpHostName
	 *SMTP邮件服务器
	 *@param username
	 *发送邮件的用户名
	 *@param password
	 *发送邮件的密码
	 */
	public SimpleMailSender(final String smtpHostName,final String userName,final String password)
	{
		init(userName,password,smtpHostName);
	}
	/*
	 * 初始化邮件发送器
	 *@param username
	 *发送邮件的用户名(地址)，并以此解析smtp服务器地址
	 *@param password
	 *发送邮件的密码
	 */
	public SimpleMailSender(final String userName,final String password)
	{
		/*
		 * 通过邮箱地址解析出smtp服务器，对大多数邮箱管用
		 */
		final String smtpHostName="smtp."+userName.split("@")[1];
		init(userName,password,smtpHostName);
	}
	/*
	 * 初始化
	 *@param username
	 *发送邮件的用户名(地址)
	 *@param password
	 *密码
	 *@param smtpHostName
	 *SMTP服务器
	 */
	private void init(String username,String password,String smtpHostName)
	{
		//初始化props
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.host",smtpHostName);
		//验证
		authenticator=new MailAuthenticator(username,password);
		//创建sesssion
		session=Session.getInstance(props,authenticator);
	}
	/*
	 * 发送邮件
	 * @param recipient
	 * 收件人邮箱地址
	 * @param subject
	 * 邮件主题
	 * @param content
	 * 邮件内容
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void send(String recipient,String subject,Object content) throws AddressException,MessagingException
	{
		//创建mime类型邮件
		final MimeMessage message=new MimeMessage(session);
		//设置发信人
		
		message.setFrom(new InternetAddress(authenticator.getUserName()));
		//设置收件人
		message.setRecipient(RecipientType.TO, new InternetAddress(recipient));
		//设置主题
		message.setSubject(subject);
		//设置邮件内容
		message.setContent(content.toString(),"text/html;charset=utf-8");
		//发送
		Transport.send(message);
	}
	/*
	 * 群发邮件
	 * @param recipients
	 * 收件人们
	 * @param subject
	 * 主题
	 * @param content
	 * 邮件内容
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void send(List<String> recipients,String subject,Object content)
	throws AddressException,MessagingException{
		//创建mime类型邮件
		final MimeMessage message=new MimeMessage(session);
		//设置发信人
		message.setFrom(new InternetAddress(authenticator.getUserName()));
		//设置收件人们
		final int num=recipients.size();
		InternetAddress[] addresses=new InternetAddress[num];
		for (int i=0;i<num;i++)
		{
			addresses[i]=new InternetAddress(recipients.get(i));
		}
		message.setRecipients(RecipientType.TO, addresses);
		//设置主题
		message.setSubject(subject);
		//设置邮件内容
		message.setContent(content.toString(),"text/html;charset=utf-8");
		//发送
		Transport.send(message);
	}
}   

