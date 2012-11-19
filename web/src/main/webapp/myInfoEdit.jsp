<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.TbCity"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
List lss=(List)request.getAttribute("addSsName");
List lcc=(List)request.getAttribute("addCityName");
String strLmp;
Integer intLmp;
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
		if (strSrcId=='tip_nickName')
		{
			objS.innerHTML='请输入4-10个字符的中英文、数字、下划线';
			objS.className='';
		}
	}
}
function doChgUser()
{
	var frm = document.form1;

	if (!check_nickName())
	{
		frm.nickName.focus();
	}else
	{
		if (confirm('确实提交此次修改吗?'))
		{
			frm.submit();
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
		objS.innerHTML='请输入4-10个字符的中英文、数字、下划线';
		objS.className='validation-summary';
		return false;
	}
	if(!RegExp("^[\u4e00-\u9fa5A-Za-z0-9-_]*$").test(t1))
	{
		objS.innerHTML='昵称格式错误';
		objS.className='validation-summary';
//		frm.nickName.value='';
		return false;
	}
	if(strlen(t1)>10 || strlen(t1)<4){
		objS.innerHTML='请输入4-10个字符的中英文、数字、下划线';
		objS.className='validation-summary';
//		frm.nickName.value='';
		return false;
	}
	objS.innerHTML='';
	objS.className='validation-right';
	return true;
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
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(images/top_bottom.gif) no-repeat;'/>
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
					<s:param name="leftMk">BASE</s:param>
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
  	<s:form method="post" action="updateUser" name="form1" theme="simple">
	<input type=hidden name='userId' value='<%=objUser.getUserId()%>'>
		<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align=center>
			<TBODY>
				<TR>
					<TD height=15 colspan=3>
					</TD>
				</TR>
				<TR>
					<TD align=left width=20%><SPAN class=content_black_bold>用户名： &nbsp;<font color=red>*</font></SPAN></td>
					<td align=left width=30%><%=objUser.getUserName()%></TD>
					<td align=left></td>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>昵称<font color=red>*：</font></SPAN>
						</TD><td align=left>
						<INPUT type="text" value="<%=objUser.getNickName()%>"
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
						<SPAN class=content_black_bold>性别：</SPAN></TD>
					<td align=left colspan=2><%=objUser.getSex()%></TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align='left'>
						<SPAN class=content_black_bold>所在省份：</SPAN>
						</TD><td align=left>
				   	 	<select name='ssName' onChange='doChgSs()'>
				   	 		<option value=''></option>
						<%
						strLmp=objUser.getSsName();
						if (lss.size()>0)
						{
							if (strLmp==null) strLmp="";
							for (intLmp=0;intLmp<lss.size();intLmp++)
							{
								if (lss.get(intLmp).equals(strLmp))
								{
									out.println("<option value='"+lss.get(intLmp)+"' selected>"+lss.get(intLmp)+"</option>");
								}else
								{
									out.println("<option value='"+lss.get(intLmp)+"' >"+lss.get(intLmp)+"</option>");
								}
							}
						}
						%>
				   	 	</select>
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align='left'>
						<SPAN class=content_black_bold>所在城市：</SPAN>
						</TD><td align=left>
				   	 	<select name='strCity'>
				   	 		<option value=''></option>
						<%
						if (lcc.size()>0)
						{
							strLmp=objUser.getStrCity();
							for (intLmp=0;intLmp<lcc.size();intLmp++)
							{
								if (lcc.get(intLmp).equals(strLmp))
								{
									out.println("<option value='"+lcc.get(intLmp)+"' selected>"+lcc.get(intLmp)+"</option>");
								}else
								{
									out.println("<option value='"+lcc.get(intLmp)+"' >"+lcc.get(intLmp)+"</option>");
								}
							}
						}
						%>
				   	 	</select>
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>电话号码：</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<%=objUser.getLxTel()%>" onchange="checkFieldNumber('lxTel')" 
								style="WIDTH: 150px" maxLength=32
								name="lxTel" minlength="6">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>手机号码：</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<%=objUser.getLxSj()%>"  onchange="checkFieldNumber('lxSj')" 
								style="WIDTH: 150px" maxLength=32
								name="lxSj" minlength="6" >
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>Email：</SPAN>
						</TD><td align=left colspan=2><%=objUser.getLxEmail()%></TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>QQ：</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<%=objUser.getLxQq()%>"
								style="WIDTH: 150px" maxLength=32
								name="lxQq" minlength="6"  onchange="checkFieldNumber('lxQq')">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align=left>
						<SPAN class=content_black_bold>MSN：</SPAN>
						</TD><td align=left>
						<INPUT class=form value="<%=objUser.getLxMsn()%>"
								style="WIDTH: 150px" maxLength=32
								name="lxMsn" minlength="6">
						</TD><td align=left>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD noWrap align=center colspan=2>
						<a href='javascript:doChgUser()'><img src='<%=basePath%>/images/btnWytj.gif' style='border:0px;'/></a>
						</TD><td align=left>
						<font color="red"><s:property value="tip" /></font>
					</TD>
				</TR>
				<TR><TD height=15 colspan=3></TD></TR>
			</TBODY>
		</TABLE>
	</s:form>
<!-- 文档区over -->
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>

  </body>
</html>
<s:include value='footer.jsp'></s:include>
