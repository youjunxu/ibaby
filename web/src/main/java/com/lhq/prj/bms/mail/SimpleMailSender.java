package com.lhq.prj.bms.mail;

import java.util.List;
import java.util.Properties;  
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;   

/**  
* ���ʼ����������ɵ�����Ⱥ��  
* @author andchen
*/   
public class SimpleMailSender  {   
	/*
	 * �����ʼ���props�ļ�
	 */
	private final transient Properties props=System.getProperties();
	/*
	 * �ʼ���������¼��֤
	 */
	private transient MailAuthenticator authenticator;
	/*
	 *����session 
	 */
	private transient Session session;
	/*
	 *��ʼ���ʼ������� 
	 *@param smtpHostName
	 *SMTP�ʼ�������
	 *@param username
	 *�����ʼ����û���
	 *@param password
	 *�����ʼ�������
	 */
	public SimpleMailSender(final String smtpHostName,final String userName,final String password)
	{
		init(userName,password,smtpHostName);
	}
	/*
	 * ��ʼ���ʼ�������
	 *@param username
	 *�����ʼ����û���(��ַ)�����Դ˽���smtp��������ַ
	 *@param password
	 *�����ʼ�������
	 */
	public SimpleMailSender(final String userName,final String password)
	{
		/*
		 * ͨ�������ַ������smtp���������Դ�����������
		 */
		final String smtpHostName="smtp."+userName.split("@")[1];
		init(userName,password,smtpHostName);
	}
	/*
	 * ��ʼ��
	 *@param username
	 *�����ʼ����û���(��ַ)
	 *@param password
	 *����
	 *@param smtpHostName
	 *SMTP������
	 */
	private void init(String username,String password,String smtpHostName)
	{
		//��ʼ��props
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.host",smtpHostName);
		//��֤
		authenticator=new MailAuthenticator(username,password);
		//����sesssion
		session=Session.getInstance(props,authenticator);
	}
	/*
	 * �����ʼ�
	 * @param recipient
	 * �ռ��������ַ
	 * @param subject
	 * �ʼ�����
	 * @param content
	 * �ʼ�����
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void send(String recipient,String subject,Object content) throws AddressException,MessagingException
	{
		//����mime�����ʼ�
		final MimeMessage message=new MimeMessage(session);
		//���÷�����
		
		message.setFrom(new InternetAddress(authenticator.getUserName()));
		//�����ռ���
		message.setRecipient(RecipientType.TO, new InternetAddress(recipient));
		//��������
		message.setSubject(subject);
		//�����ʼ�����
		message.setContent(content.toString(),"text/html;charset=utf-8");
		//����
		Transport.send(message);
	}
	/*
	 * Ⱥ���ʼ�
	 * @param recipients
	 * �ռ�����
	 * @param subject
	 * ����
	 * @param content
	 * �ʼ�����
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public void send(List<String> recipients,String subject,Object content)
	throws AddressException,MessagingException{
		//����mime�����ʼ�
		final MimeMessage message=new MimeMessage(session);
		//���÷�����
		message.setFrom(new InternetAddress(authenticator.getUserName()));
		//�����ռ�����
		final int num=recipients.size();
		InternetAddress[] addresses=new InternetAddress[num];
		for (int i=0;i<num;i++)
		{
			addresses[i]=new InternetAddress(recipients.get(i));
		}
		message.setRecipients(RecipientType.TO, addresses);
		//��������
		message.setSubject(subject);
		//�����ʼ�����
		message.setContent(content.toString(),"text/html;charset=utf-8");
		//����
		Transport.send(message);
	}
}   

