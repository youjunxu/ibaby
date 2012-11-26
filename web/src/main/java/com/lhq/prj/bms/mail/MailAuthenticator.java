package com.lhq.prj.bms.mail;

import javax.mail.*;

/*
 * 服务器邮箱登录验证
 * @author andchen
*/
public class MailAuthenticator extends Authenticator{  
	private String userName;
	private String password;
	
    public MailAuthenticator(String username, String password) {   
        this.userName = username;   
        this.password = password;   
    }
    String getPassword()
    {
    	return password;
    }
    @Override
    protected PasswordAuthentication getPasswordAuthentication(){  
        return new PasswordAuthentication(userName, password);  
    }  
    String getUserName()
    {
    	return userName;
    }
    public void setPassword(String p)
    {
    	this.password=p;
    }
    public void setUserName(String p)
    {
    	this.userName=p;
    }
}  

