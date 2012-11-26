<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String sd=(String)request.getAttribute("regCode");
if (sd==null) sd="";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>会员修改口令</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
function hide_note(strSrcId)
{
	var frm = document.form1;
	var objS=document.getElementById(strSrcId);
	var t1='';
	var t2='';
	
	if (objS)
	{
		if (strSrcId=='tip_userPass' || strSrcId=='tip_userAPass')
		{
			objS.innerHTML='只能用字母或字母+数字，6-20个字符,首字符必须是字母';
			objS.className='';
		}
	}
}

function check_userPass()
{
	var frm = document.form1;
	var objS=document.getElementById('tip_userPass');
	var objT=document.getElementById('tip_userAPass');
	var t1='';
	var t2='';

	t1=frm.userPass.value;
	t2=frm.userAPass.value;
	if (t1=='')
	{
		objS.innerHTML='请输入口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	if (strlen(t1)<6 || strlen(t1)>20)
	{
		objS.innerHTML='请输入口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	if (!isLetterNumber(t1))
	{
		objS.innerHTML='请输入口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	if (t1!=t2)
	{
		objT.innerHTML='二次口令不一致';
		objT.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	objS.innerHTML='';
	objS.className='validation-right';
	resetFormErrcode('2');
	return true;
}
function check_userAPass()
{
	var frm = document.form1;
	var objS=document.getElementById('tip_userAPass');
	var objT=document.getElementById('tip_userPass');
	var t1='';
	var t2='';

	t1=frm.userPass.value;
	t2=frm.userAPass.value;
	if (t2=='')
	{
		objS.innerHTML='请输入确认口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}

	if (strlen(t1)<6 || strlen(t1)>20)
	{
		objS.innerHTML='请输入正确的口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	if (!isLetterNumber(t1))
	{
		objS.innerHTML='请输入正确的口令';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}

	if (t1!=t2)
	{
		objS.innerHTML='二次口令不一致';
		objS.className='validation-summary';
		setFormErrcode('2');
		return false;
	}
	objS.innerHTML='';
	objS.className='validation-right';
	objT.innerHTML='';
	objT.className='validation-right';
	resetFormErrcode('2');
	return true;
}

function check()
{
	var frm = document.form1;
	var t1='';
	
	if(frm.userName.value==""){
		alert("用户名不能为空!");
		frm.userName.focus();
		return ;
	}else
	{
		t1=frm.userPass.value;
		if (frm.regCode.value=='')
		{
			alert('非法调用！');
			return;
		}
			
		if (strlen(t1)<6 || strlen(t1)>20)
		{
			alert('请输入正确的密码');
    		return ;
		}
		if (!isLetterNumber(t1))
		{
			alert('请输入正确的密码');
    		return ;
		}
		
		if(frm.userPass.value!=frm.userAPass.value){
	    	alert("二次新密码不一致!");
	    	frm.userPass.value='';
	    	frm.userAPass.value='';
    		frm.userPass.focus();
    		return ;
		}else {
			frm.submit();
		}
	}
}
</script>  
<s:action name="setNoLoginAcl" executeResult="true" />
  </head>
  <body>
  	<s:action name="gvCurUserTopMenu" executeResult="true" />
<div class="wrap">
  	<s:form method="post" action="changeUserAPass" name="form1" theme="simple">
  	<input type=hidden name='regCode' value='<%=sd%>' /> 
		<TABLE cellSpacing=0 cellPadding=0 width=718 border=0 align=center>
			<TBODY>
				<TR>
					<TD height=15 colspan=3></TD>
				</TR>
				<TR>
					<TD align=right width=80>
						<SPAN class=content_black_bold>用户名：</SPAN>
					</td><td align='left' width=220>
						<s:property value='userName' />
						<INPUT type=hidden value="<s:property value='userName' />" name=userName readOnly>
						<br><font color="red"><s:property value="tip" /></font>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=right>
						<SPAN class=content_black_bold>新密码：</SPAN>
					</td><td  align='left'>
						<FONT class=form><INPUT class=form value=""
								style="WIDTH: 150px" type="password" maxLength=32
								name="userPass" minlength="6" onFocus="hide_note('tip_userPass')" onBlur="check_userPass()"> </FONT>
					</TD><td align='left'>
						<span id='tip_userPass'>只能用字母或字母+数字，6-20个字符,首字符必须是字母</span>
					</td>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=right>
						<SPAN class=content_black_bold>确认密码：</SPAN>
					</td><td align='left'>
						<FONT class=form><INPUT class=form value=""
								style="WIDTH: 150px" type="password" maxLength=32
								name="userAPass" minlength="6" onFocus="hide_note('tip_userAPass')" onBlur="check_userAPass()"> </FONT>
					</TD><td align='left'>
						<span id='tip_userPass'>只能用字母或字母+数字，6-20个字符,首字符必须是字母</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD noWrap align=center colspan=3>
						<span style="padding-right: 20px;"><input type="button" name="idBtnSubmit" value="提  交" onclick='check()'/></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</div>
  </body>
</html>
