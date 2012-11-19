<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
function check()
{
	var frm = document.form1;
	var t1='';
	var t2='';
	
	if(frm.userName.value==""){
		alert("用户名不能为空!");
		document.form1.userName.focus();
		return ;
	}else
	{
		if(frm.userOldPass.value=="" || frm.userPass.value==""){
	    	alert("新旧密码不能为空!");
	    	frm.userOldPass.focus();
			return ;
		}else {
			t1=frm.userOldPass.value;
			t2=frm.userPass.value;
			if (strlen(t1)<6 || strlen(t1)>20)
			{
				alert('请输入正确的原密码');
				return ;
			}
			if (strlen(t2)<6 || strlen(t2)>20)
			{
				alert('请输入正确的新密码');
				return ;
			}
			if (!isLetterNumber(frm.userPass.value))
			{
				alert('请输入正确的新密码');
				return ;
			}
		
			if(frm.userPass.value!=frm.userAPass.value){
		    	alert("二次新密码不一致!");
		    	frm.userPass.value='';
		    	frm.userAPass.value='';
	    		frm.userPass.focus();
				return ;
			}
		}
	}
	if (confirm('确实修改密码吗？'))
	{
		frm.submit();
	}
}
function toContent()
{
	var t1='';
	t1='<%=basePath%>/myPersonContent.action';
	location.href=t1;
}
function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action';
	location.href=t1;
}
function init_userPass(sid)
{
	var frm = document.form1;
	var objA=document.getElementById('tip_userPassA');
	var objB=document.getElementById('tip_userPassB');
	
	if (sid=='1')
	{
		objA.innerHTML='<font color=red>只能用字母或字母+数字，6-20个字符,首字符必须是字母</font>';
		objA.className='';
	}else
	{
		objB.innerHTML='<font color=red>只能用字母或字母+数字，6-20个字符,首字符必须是字母</font>';
		objB.className='';
	}
}
function check_userPass(sid)
{
	var frm = document.form1;
	var t1='';
	var t2='';
	var objA=document.getElementById('tip_userPassA');
	var objB=document.getElementById('tip_userPassB');

	t1=frm.userPass.value;
	t2=frm.userAPass.value;
	if (sid=='1')
	{
		if(t1==""){
			objA.innerHTML='<font color=red>请输入正确的新密码</font>';
			return ;
		}
		if (strlen(t1)<6 || strlen(t1)>20)
		{
			objA.innerHTML='<font color=red>请输入正确的新密码2</font>';
			objA.className='validation-summary';
			return ;
		}
		if (!isLetterNumber(frm.userPass.value))
		{
			objA.innerHTML='<font color=red>请输入正确的新密码3</font>';
			objA.className='validation-summary';
			return ;
		}
		objA.innerHTML='';
		objA.className='validation-right';
	}else
	{
		if (strlen(t2)<6 || strlen(t2)>20)
		{
			objB.innerHTML='<font color=red>请输入正确的新密码</font>';
			objB.className='validation-summary';
			return ;
		}
		if (!isLetterNumber(frm.userAPass.value))
		{
			objB.innerHTML='<font color=red>请输入正确的新密码</font>';
			objB.className='validation-summary';
			return ;
		}
		if(frm.userPass.value!=frm.userAPass.value){
    		frm.userAPass.focus();
			objB.innerHTML='<font color=red>2次新密码不一致</font>';
			objB.className='validation-summary';
		}else
		{
			objB.innerHTML='';
			objB.className='validation-right';
		}
	}
}
</script>  
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='width:100px;font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">BASEINFO</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td ></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=95% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr style='width:189px;height:165px;'>
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >
				<s:action name="myPageLeft" executeResult="true" >
					<s:param name="leftMk">XGMM</s:param>
				</s:action>
    		</td>
	    	</tr>
	    	</table>
    	</td>
    	</tr>
    	<tr>
    	<td></td>
    	</tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
    	<table border='0' cellspacing='0' cellpadding='0' width=95% height=100% style='margin-left:30px;' >
    	<tr style='height:5px;'><td ></td></tr>
    	<tr>
    	<td>
		  	<s:form method="post" action="changeUserPass" name="form1" theme="simple">
		  	<input type='hidden' name='userId' value='<%=ej.getUserId()%>' />
		  	<input type='hidden' name='userName' value='<%=ej.getUserName()%>' />
			<TABLE cellSpacing=0 cellPadding=0 width=418 border=0 align=center>
				<TBODY>
					<TR>
					<TD height=15 colspan=2></TD>
					</TR>
					<TR>
					<TD align=right width=100>
						<SPAN class=content_black_bold>用户名：</SPAN>
					</td><td>
						<%=ej.getUserName()%>
					</TD>
					</TR>
					<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
					<TR><TD height=8 colspan=2></TD></TR>
					<TR>
					<TD align=right>
						<SPAN class=content_black_bold>原密码：</SPAN>
					</td><td>
						<FONT class=form><INPUT class=form value=""
								style="WIDTH: 150px" type="password" maxLength=32
								name="userOldPass" minlength="6"> </FONT>
					</TD>
					</TR>
					<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
					<TR><TD height=8 colspan=2></TD></TR>
					<TR>
					<TD align=right>
						<SPAN class=content_black_bold>新密码：</SPAN>
					</td><td>
						<FONT class=form><INPUT class=form value="" onfocus='init_userPass(1)' 
								style="WIDTH: 150px" type="password" onBlur="check_userPass(1)" 
								name="userPass" > </FONT>
						</TD>
					</TR>
					<TR>
					<td></td><td>
							<span id='tip_userPassA' style='color:red;'>只能用字母或字母+数字，6-20个字符,首字符必须是字母</span>
						</TD>
					</TR>
					<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
					<TR><TD height=8 colspan=2></TD></TR>
					<TR>
						<TD align=right>
							<SPAN class=content_black_bold>确认密码：</SPAN>
						</td><td>
							<FONT class=form><INPUT class=form value="" onfocus='init_userPass(2)' 
								style="WIDTH: 150px" type="password" onBlur="check_userPass(2)" 
								name="userAPass" > </FONT>
							</TD>
						</TR>
						<TR>
						<td></td><td>
							<span id='tip_userPassB' style='color:red;'>只能用字母或字母+数字，6-20个字符,首字符必须是字母</span>
						</TD>
					</TR>
					<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
					<TR><TD height=8 colspan=2></TD></TR>
					<TR>
						<TD noWrap align='center' colspan=2>
							<span style="padding-right: 20px;">
							<input type="button" onclick='check()' value="提  交"/></span>
						</TD>
					</TR>
					<TR><TD height=20 colspan=2></TD></TR>
				</TBODY>
			</TABLE>
			</s:form>
    	</td>
    	</tr>
   		</table>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
	