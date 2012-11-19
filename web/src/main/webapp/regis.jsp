<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>会员注册</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/regis_user.js"></script>
<script LANGUAGE='Javascript'>
function doChgSs()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.ssName,'1');
	t1='<%=basePath%>/findCityBySs.action?ssName='+encodeURI(encodeURI(t1));
	getByAjax(t1,'after_doChgSs');
}
function after_doChgSs()
{
	var doc=document.form1;
	var resp=xml_Http.responseText;
	var objM=null;
	var objN=null;
	var objP=null;
	var i=0;

//	alert(resp);
	eval('objM=('+resp+')');
	objN=objM.ssCityList;
	objP=doc.strCity;
	objP.length=1;
	objP.options[0].value='';
	objP.options[0].text='';
	for (i=0; i<objN.length; i++)
	{
		objP.length=objP.length+1;
		objP.options[objP.length-1].value=objN[i];
		objP.options[objP.length-1].text=objN[i];
	}
	
}
function hide_note(strSrcId)
{
	var frm = document.form1;
	var objS=document.getElementById(strSrcId);
	var t1='';
	var t2='';
	
	if (objS)
	{
		if (strSrcId=='tip_userName')
		{
			objS.innerHTML='只能用字母或字母+数字，3-20个字符,首字符必须是字母';
			objS.className='';
		}
		if (strSrcId=='tip_userPass' || strSrcId=='tip_userAPass')
		{
			objS.innerHTML='只能用字母或字母+数字，6-20个字符,首字符必须是字母';
			objS.className='';
		}
		if (strSrcId=='tip_nickName')
		{
			objS.innerHTML='请输入4-10个字符的中英文、数字、下划线';
			objS.className='';
		}
		if (strSrcId=='tip_sex')
		{
			objS.innerHTML='';
			objS.className='validation-right';
		}
		if (strSrcId=='tip_lxEmail')
		{
			objS.innerHTML='请输入邮箱';
			objS.className='';
		}
	}
}
function setFormErrcode(strXh)
{
	var frm = document.form1;
	var t1=frm.errcode.value;
	var t2=','+strXh+',';
	if (t1.indexOf(t2)==-1)
	{
		frm.errcode.value=frm.errcode.value+t2;
	}
}
function resetFormErrcode(strXh)
{
	var frm = document.form1;
	var t1=frm.errcode.value;
	var t2=','+strXh+',';
	frm.errcode.value=t1.replace(t2,'');
}
function check_userName()
{
	var frm = document.form1;
	var objS=document.getElementById('tip_userName');
	var t1='';
	var t2='';

	t1=frm.userName.value;
	if (t1=='')
	{
		if(objS) objS.innerHTML='请输入用户名';
		objS.className='validation-summary';
		setFormErrcode('1');
		return false;
	}
	if (strlen(t1)<3 || strlen(t1)>20)
	{
		if(objS) objS.innerHTML='输入有误，请输入3-20位字符';
		objS.className='validation-summary';
		setFormErrcode('1');
		return false;
	}else
	{
		if (isLetterNumber(t1,1))
		{
			t2='<%=basePath%>/checkIsExistUser.action?userName='+t1;
			return getByAjax(t2,"after_checkUserName");
		}else
		{
			if(objS) objS.innerHTML='输入有误，请输入3-20位字符';
			objS.className='validation-summary';
			setFormErrcode('1');
			return false;
		}
	}
}
function after_checkUserName()
{
	var resp=xml_Http.responseText;
	var objS=document.getElementById('tip_userName');
	var objT=null;

	eval('objT='+resp);
	if(objT)
	{
		if(objT.success)
		{
			objS.innerHTML='';
			objS.className='validation-right';
			resetFormErrcode('1');
			return true;
		}else
		{
			objS.innerHTML='该用户名已存在';
			objS.className='validation-summary';
			setFormErrcode('1');
			return false;
		}
	}else
	{
		objS.innerHTML='系统错误';
		objS.className='validation-summary';
		setFormErrcode('1');
		return false;
	}
	resetFormErrcode('1');
	return true;
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
function doRegistUser()
{
	var frm = document.form1;
	var t1=frm.errcode.value;
	var objA=document.getElementById('tip_userName');
	var objB=document.getElementById('tip_userPass');
	var objC=document.getElementById('tip_nickName');
	var objD=document.getElementById('tip_lxEmail');

	if (t1=='')
	{
		if (frm.strRand.value=='')
		{
			alert('请输入验证码！');
			return ;
		}
		t1=frm.userName.value;
		if (t1=='')
		{
			if(objA) objA.innerHTML='请输入用户名';
			objA.className='validation-summary';
			setFormErrcode('1');
			return ;
		}
		t1=frm.userPass.value;
		if (t1=='')
		{
			objB.innerHTML='请输入口令';
			objB.className='validation-summary';
			setFormErrcode('2');
			return ;
		}
		t1=frm.nickName.value;
		if(t1=='')
		{
			objS.innerHTML='<p>请输入昵称</p>';
			objS.className='validation-summary';
			setFormErrcode('3');
			return ;
		}
		if(!RegExp("^[\u4e00-\u9fa5A-Za-z0-9-_]*$").test(t1))
		{
			objS.innerHTML='<p>昵称格式错误</p>';
			objS.className='validation-summary';
			setFormErrcode('3');
			return;
		}
		t1=frm.lxEmail.value;
		if(t1==''){
			objD.innerHTML='请输入Email';
			objD.className='validation-summary';
			setFormErrcode('5');
			return ;
		}
		if (confirm('确实注册为本站用户吗?'))
		{
			frm.submit();
		}
	}else
	{
		if (t1.indexOf(',1,')!=-1)
		{
			frm.userName.focus();
		}
		if (t1.indexOf(',2,')!=-1)
		{
			frm.userPass.focus();
		}
		if (t1.indexOf(',3,')!=-1)
		{
			frm.nickName.focus();
		}
		if (t1.indexOf(',5,')!=-1)
		{
			frm.lxEmail.focus();
		}
	}
}
function check_nickName(){
	var frm = document.form1;
	var objS=document.getElementById('tip_nickName');
	var t1='';

	t1=frm.nickName.value;
	if(t1=='')
	{
		objS.innerHTML='<p>请输入昵称</p>';
		objS.className='validation-summary';
		return false;
	}
	if(!RegExp("^[\u4e00-\u9fa5A-Za-z0-9-_]*$").test(t1))
	{
		objS.innerHTML='<p>昵称格式错误</p>';
		objS.className='validation-summary';
		return false;
	}
	if(strlen(t1)>10 || strlen(t1)<4){
		objS.innerHTML='请输入4-10个字符的中英文、数字、下划线';
		objS.className='validation-summary';
		setFormErrcode('3');
		return false;
	}
	objS.innerHTML='';
	objS.className='validation-right';
	resetFormErrcode('3');
	return true;
}
function check_lxEmail()
{
	var frm = document.form1;
	var objS=document.getElementById('tip_lxEmail');
	var t1='';
	var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; // not valid
	var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/; // valid
    
	t1=frm.lxEmail.value;
	if(t1==''){
		objS.innerHTML='请输入Email';
		objS.className='validation-summary';
		setFormErrcode('5');
		return false;
	}

	if ( !reg1.test( t1 ) && reg2.test( t1 ) ) {
		t2='<%=basePath%>/checkIsExistEmail.action?lxEmail='+t1;
		return getByAjax(t2,"after_checkLxEmail");
	} else {
		frm.lxEmail.value='';
		objS.innerHTML='邮件格式错误';
		objS.className='validation-summary';
		setFormErrcode('5');
	 	return false;
	}
}
function after_checkLxEmail()
{
	var frm = document.form1;
	var resp=xml_Http.responseText;
	var objS=document.getElementById('tip_lxEmail');
	var objT=null;

//	alert(resp);
	eval('objT='+resp);
	if(objT)
	{
		if(objT.success)
		{
			objS.innerHTML='';
			objS.className='validation-right';
			resetFormErrcode('5');
			return true;
		}else
		{
			frm.lxEmail.value='';
			objS.innerHTML='该邮箱已被注册';
			objS.className='validation-summary';
			setFormErrcode('5');
			return false;
		}
	}else
	{
		frm.lxEmail.value='';
		objS.innerHTML='系统错误';
		objS.className='validation-summary';
		setFormErrcode('5');
		return false;
	}
}
function checkFieldNumber(strName)
{
	var frm=document.form1;
	var objA=null;
	
	objA=eval('frm.'+strName);
	if (!checkIsNumber(objA))
	{
		objA.value='';
//		alert('请输入数值型数据！');
		return false;
	}
	return true;
}
</script>
  </head>
  <body>
  	<s:action name="gvCurUserTopMenu" executeResult="true" />
<div class="wrap">
  	<s:form method="post" action="saveUser" name="form1" theme="simple">
	<input type=hidden name='errcode' value=''>
		<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align=center>
			<TBODY>
				<TR>
					<TD height=15 colspan=3>
					</TD>
				</TR>
				<TR>
					<TD align=left width=20%>
						<SPAN class=content_black_bold>用户名 &nbsp;<font color=red>*</font></SPAN>
						</TD><td align=left width=30%>
						<INPUT type="text" class="input_seabox" value="<s:property value="userName" />"
								autocomplete="off" style="WIDTH: 100px"
								maxLength=20 name='userName' onFocus="hide_note('tip_userName')" onBlur="check_userName()">
						</TD><td align=left>
							<span id='tip_userName' >只能用字母或字母+数字，3-20个字符,首字符必须是字母</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>密码&nbsp;<font color=red>*</font></SPAN>
						</TD><td align=left>
						<input type="password" class="input_seabox" value="<s:property value='userPass' />"
								style="WIDTH: 100px" maxLength=20
								minLength=6 name='userPass' onFocus="hide_note('tip_userPass')" onBlur="check_userPass()">
						</TD><td align=left>
								<span id='tip_userPass'>只能用字母或字母+数字，6-20个字符,首字符必须是字母</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>确认密码&nbsp;<font color=red>*</font></SPAN>
						</TD><td align=left>
						<INPUT class="input_seabox" value="<s:property value='userAPass' />"
								style="WIDTH: 100px" type="password" maxLength=20
								minLength=6 name='userAPass' onFocus="hide_note('tip_userAPass')" onBlur="check_userAPass()">
						</TD><td align=left>
								<span id='tip_userAPass' ></span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>昵称<font color=red>*</font></SPAN>
						</TD><td align=left>
						<INPUT type="text" value="<s:property value='nickName' />"
							maxLength=20
								name="nickName" minlength="4" onFocus="hide_note('tip_nickName')" onBlur="check_nickName()">
						</TD><td align=left>
								<span id='tip_nickName'>请输入4-10个字符的中英文、数字、下划线</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>性别<font color=red>*</font></SPAN>
						</TD><td align=left>
						<INPUT name="sex" type="radio" value="男" onclick="hide_note('tip_sex')"/>男
						<INPUT name="sex" type="radio" value="女"/>女
						</TD><td align=left>
						<span id='tip_sex' >请选择性别</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>所在省份</SPAN>
						</TD><td align=left>
				   	 	<select name='ssName' onChange='doChgSs()'>
				   	 		<option value=''></option>
							<c:forEach var="ssName" items="${addSsName}" varStatus="status">
							<option value="${ssName}">${ssName}</option>
							</c:forEach>
				   	 	</select>
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>所在城市</SPAN>
						</TD><td align=left>
				   	 	<select name='strCity'></select>
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>电话</SPAN>
						</TD><td align=left>
						<INPUT class=form value="" onchange="checkFieldNumber('lxTel')" 
								style="WIDTH: 150px" maxLength=32
								name="lxTel" minlength="6">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>手机</SPAN>
						</TD><td align=left>
						<INPUT class=form value=""  onchange="checkFieldNumber('lxSj')" 
								style="WIDTH: 150px" maxLength=32
								name="lxSj" minlength="6" >
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>Email&nbsp;<font color=red>*</font></SPAN>
						</TD><td align=left>
						<INPUT class=form value="<s:property value='lxEmail' />"
								style="WIDTH: 150px" maxLength=32
								minLength=6 name='lxEmail' onFocus="hide_note('tip_lxEmail')" onBlur="check_lxEmail()">
						</TD><td align=left>
							<span id='tip_lxEmail'>发送验证邮件和接收网站邮件使用</span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>QQ</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<s:property value='lxQq' />"
								style="WIDTH: 150px" maxLength=32
								name="lxQq" minlength="6"  onchange="checkFieldNumber('lxQq')">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>MSN</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<s:property value='lxMsn' />"
								style="WIDTH: 150px" maxLength=32
								name="lxMsn" minlength="6">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>验证码&nbsp;<font color=red>*</font></SPAN>
						</TD><td align=left style='line-height:30px;'>
						<INPUT class=form value=""
								style="WIDTH: 150px" maxLength=32
								name="strRand" minlength="6">
				<br><img src="rand.action" onclick="changeValidateCode(this)" style='margin-top:10px;'/>  
						</TD><td align=left>
						<span id='tip_yzm' ></span>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD noWrap align=center colspan=2>
						<a href='javascript:doRegistUser()'><img src='<%=basePath%>/images/btnWytj.gif' style='border:0px;'/></a>
						</TD><td align=left>
						<font color="red"><s:property value="tip" /></font>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</div>
  </body>
</html>
<s:include value='footer.jsp'></s:include>
