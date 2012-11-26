<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>会员登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<style type="text/css">
#idABack{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: gray;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
#idBBack{display: none;  position: absolute;  top: 28%;  left: 36%;  width: 350;  height: 300;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>
<script LANGUAGE='Javascript'>
function check()
{
	var frm = document.form1;
	var t1=frm.userName.value;
	var t2=frm.userPass.value;
	var objU=document.getElementById('idUser');
	var objP=document.getElementById('idPass');
	if(t1==""){
//		alert("用户名不能为空!");
		objU.innerHTML='<font color=red><b>用户名不能为空</b></font>';
		document.form1.userName.focus();
		return false;
	}else
	{
		if(t2=="")
		{
//		    alert("登录密码不能为空!");
			objP.innerHTML='<font color=red><b>登录密码不能为空</b></font>';
			frm.userPass.focus();
		    return false;
		}else
		{
			SetLastUser(t1);
			if (frm.ckField.checked)
			{
                var expdate = new Date();
                expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));
                //將用戶名和密碼寫入到Cookie
                SetCookie(t1,t2, expdate);
			}else
			{
				ResetCookie(t1);
			}
			return true;
		}
	}
}
function SetLastUser(usr)
{
	var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";            
	var expdate = new Date();
	//當前時間加上兩周的時間
	expdate.setTime(expdate.getTime() + 14 * (24 * 60 * 60 * 1000));                
	SetCookie(id, usr, expdate);
}
function doLoad()
{
	GetLastUser();
}
function GetLastUser()
{
	var doc=document.forms[0];
	var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";
	var usr = GetCookie(id);
	if(usr != null)
	{
		doc.userName.value = usr;
	}else
	{
		doc.userName.value = "";
	}
	GetPwdAndChk();
}
//用戶名失去焦點時調用該方法
function GetPwdAndChk()
{
	var doc=document.forms[0];
	var usr = doc.userName.value;
	var pwd = GetCookie(usr); 
	if(pwd != null)
	{
		doc.ckField.checked = true;
		doc.userPass.value = pwd;
	}else
	{
		doc.ckField.checked = false;
		doc.userPass.value = "";
	}
}
function noRememberPass()
{
	var frmA = document.form1;
	var frmB = document.frm0;
	var objA=document.getElementById('idABack');
	var objB=document.getElementById('idBBack');

	objA.style.display='block';
	objB.style.display='block';
	frmB.n_userName.value=frmA.userName.value;
}
function toCheckPasA()
{
	var frm = document.frm0;
	if(frm.n_userName.value==""){
		alert("用户名不能为空!");
		frm.n_userName.focus();
	}else
	{
		location.href='<%=basePath%>/noRememberPass.action?userName='+frm.n_userName.value;
	}
}
function toCheckPasB()
{
	var objA=document.getElementById('idABack');
	var objB=document.getElementById('idBBack');

	objA.style.display='none';
	objB.style.display='none';
}
function doMyRegUser()
{
	location.href='<%=basePath%>/prevNewUser.action';
}
</script>  
  </head>
  <body onload='doLoad()'>

	<table cellspacing="0" cellpadding="0" border="0" style="width:892px;" align="center">
	<tr style='height:20px;'><td colspan=2></td></tr>
	<tr style='height:68px;' >
	<td align='left' valign='bottom' width=80% >
	<img src='<%=basePath%>/images/index_icon_10.gif' />
	</td>
	<td valign='bottom' align='center'>
		<table width=80% height=100% cellspacing="0" cellpadding="0" border="0" align="right" valign='middle'>
		<tr style='height:50%; ' ><td>&nbsp;</td></tr>
		<tr><td valign='middle'>
		<img src='<%=basePath%>/images/index_icon_03s.gif' />
		&nbsp;&nbsp;<a href='<%=basePath%>/index.jsp'>贝家爱首页</a>
		</td></tr>
		</table>
	</td>
	</tr>
	<tr style='height:20px;'><td colspan=2></td></tr>
	<tr style='height:420px;'>
	<td align='center' valign='middle' colspan=2 >
		<table cellspacing="0" cellpadding="0" border="0" style="height:420px;width:894px; background:url(<%=basePath%>/images/loginBk.jpg) no-repeat;" align="center" valign='middle'>
		<tr style='height:60px;'><td colspan=2></td></tr>
		<tr>
		<td align='left' valign='middle' colspan=2>
			<table border="0" cellspacing="0" cellpadding="0" align='center' style='width:100%; height:305px;' >
			<tr>
			<td style='width:440px;'>
				<table border="0" cellspacing="0" cellpadding="0" align='center' style='width:100%; height:100%;' >
				<tr style='height:50px;'><td></td></tr>
				<tr ><td align='center' valign='middle' style='font-size:16px;'>
				<font face='黑体' >第一次来到贝家爱？</font>
				</td></tr>
				<tr style='height:10px;'><td></td></tr>
				<tr ><td align='center' valign='middle' style='font-size:14px;'>
				贝家爱是专为父母全方位育儿的交流网站
				</td></tr>
				<tr style='height:30px;'><td></td></tr>
				<tr ><td valign='middle' align='center'>
				<input name="" type="image" src="<%=basePath%>/images/btnRegis.jpg"  onclick='doMyRegUser()'/>
				</td></tr>
				<tr style='height:30px;'><td></td></tr>
				</table>
			</td>
			<td align='left' valign='top'>
		  	<s:form method="post" action="login" name="form1" onsubmit="return check()" theme="simple">
				<table border="0" cellspacing="0" cellpadding="0" style='width:80%; margin-left:30px;' >
				<tr style='height:30px;'><td colspan=2></td></tr>
				<tr ><td style='font-size:16px;font-family:黑体;' colspan=2>登录到贝家爱</td></tr>
				<tr style='height:20px;'><td colspan=2></td></tr>
				<tr style='height:30px;'>
				<td align='right'>用户名：
				</td>
				<td>
				<FONT class=form><INPUT class=form value=""
						autocomplete="off" style="WIDTH: 250px"
						maxLength=28 name='userName' onclick="document.getElementById('idUser').innerHTML='';" /> </FONT>
				</td>
				</tr>
				<tr style='height:20px;'><td></td><td ><span id='idUser'></span></td></tr>
				<tr style='height:30px;'>
				<td align='right'>密    码：
				</td>
				<td>
				<FONT class=form><INPUT class=form value=""
						style="WIDTH: 250px" type="password" maxLength=32
						name="userPass" minlength="0" onclick="document.getElementById('idPass').innerHTML='';" /> </FONT>
				</td>
				</tr>
				<tr style='height:20px;'><td></td><td ><span id='idPass'></span></td></tr>
				<tr ><td colspan=2 align='center'>
				<input type='checkbox' value='' name='ckField' />
				&nbsp;&nbsp;记住我的帐号，下次访问自动登录
				</td></tr>
				<tr style='height:20px;'><td colspan=2></td></tr>
				<tr ><td colspan=2 align='center'>
				<input name="" type="image" src="<%=basePath%>/images/dl.jpg"  />
				&nbsp;&nbsp;<a href='#' onClick='noRememberPass()'><font color='#E16B11'>忘记密码？</font></a>
				</td></tr>
				<tr style='height:20px;'>
				<td colspan=2 align='center'>
					<font color=red><b><s:property value='tip'/></b></font>
				</td></tr>
				</table>
			</s:form>
			</td>
			</tr>
			</table>
		</td>
		</tr>
		<tr style='height:55px;'><td colspan=2></td></tr>
		</table>
	</td>
	</tr>
	<tr style='height:15px;'>
	<td colspan=2 align='center'>
		<table border="0" cellspacing="0" cellpadding="0" align='center' style='width:900px;'>
		<tr style='height:10px;'><td colspan=2>&nbsp;</td></tr>
		<tr>
		<td align=left valign="middle" width=58%>
		&nbsp;&nbsp;<span ><a href="#">关于我们</a> | <a href="#">相关声明</a> | <a href="<%=basePath%>/prevTsjyIndex.action">投诉与建议</a> | <a href="#">友情链接</a></span>
		</td>
		<td align='right' valign="middle">
			<font color='#AAAAAA'>Copyright © 1998 - 2012 www.begalove.com All Rights Reserved</font>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		</tr>
		</table>
	</td></tr>
	<tr style='height:20px;'><td colspan=2 ></td></tr>
	</table>
  </body>
<div  width=350 height=200 id='idABack' ></div>
<div  width=350 height=200 id='idBBack' >
<form name="frm0">
<table border="0" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" width=300 align="center">
	<tr style='height:20px;'><td></td></tr>
	<tr><td>请输入用户名：</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='text' name='n_userName' value='' size=10 />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='button' value='提交' onclick='toCheckPasA()' />
	&nbsp;&nbsp;<input type='button' value='放弃' onclick='toCheckPasB()' />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	</table>
</form>
 
</html>
