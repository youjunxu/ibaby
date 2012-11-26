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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/validate.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/regis_user.js"></script>
<script LANGUAGE='Javascript'>
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
function doEdit()
{
	var t1='';
	t1='<%=basePath%>/myPersonXxA.action';
	location.href=t1;
}
function doEmail()
{
	var t1='';
	t1='<%=basePath%>/reSendRegEmail.action';
	location.href=t1;
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
    	<table border='0' cellspacing='0' cellpadding='0' width=95% height=100% style='margin-left:30px;' >
    	<tr style='height:5px;'><td ></td></tr>
    	<tr>
    	<td>
    	<!-- 显示区 -->
   			<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align=center id='idDisp' >
				<TR><TD height=15 colspan=3></TD></TR>
				<TR>
					<td width=20 ></td>
					<TD align='left' style='width:100px;' >
						<SPAN class=content_black_bold>用户名：</SPAN>
					</TD><td align='left' >
						<%=objUser.getUserName()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left'>
						<SPAN class=content_black_bold>性别：</SPAN>
					</TD><td align='left'><%=objUser.getSex()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>昵称：</SPAN>
					</TD><td align='left' ><%=objUser.getNickName()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>所在省份：</SPAN>
					</TD><td align='left' >
						<%=objUser.getSsName()==null?"":objUser.getSsName()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>所在城市：</SPAN>
					</TD><td align='left' >
				   	 	<%=objUser.getStrCity()==null?"":objUser.getStrCity()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>电话号码：</SPAN>
					</TD><td align='left' ><%=objUser.getLxTel()==null?"":objUser.getLxTel()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>手机号码：</SPAN>
					</TD><td align='left' ><%=objUser.getLxSj()==null?"":objUser.getLxSj()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>Email：</SPAN>
					</TD><td align='left' >
						<%=objUser.getLxEmail()==null?"":objUser.getLxEmail()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>QQ：</SPAN>
					</TD><td align='left'><%=objUser.getLxQq()==null?"":objUser.getLxQq()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>MSN：</SPAN>
					</TD><td align='left'><%=objUser.getLxMsn()==null?"":objUser.getLxMsn()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=15 colspan=3></TD></TR>
				<TR>
					<TD noWrap align='center' colspan=3 valign='bottom'>
						<TABLE cellSpacing=0 cellPadding=0 border=0 align=center >
						<tr style='height:31px;'>
						<td width=4 style='background:url(<%=basePath%>/images/btnAl.jpg) no-repeat;'></td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAm.jpg) repeat-x;' align='center' >
						<a href='javascript:doEdit()'><font color='#FFFFFF'>&nbsp;&nbsp;编&nbsp;&nbsp;辑&nbsp;&nbsp;</font></a>
						</td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAr.jpg) no-repeat;'></td>
						<%
						if (objUser.getUserStatus()==0)
						{
						%>
						<td width=20>&nbsp;</td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAl.jpg) no-repeat;'></td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAm.jpg) repeat-x;' align='center' >
						<a href='javascript:doEmail()'>
						<font color='#FFFFFF'>重发注册验证邮件</font></a>
						</td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAr.jpg) no-repeat;'></td>
						<%
						}else
						{
						%>
						<td >&nbsp;</td>
						<%
						}
						%>
						</tr>
						</TABLE>
					</TD>
				</TR>
		</TABLE>
    	</td>
    	</tr>
    	<tr style='height:20px;'><td></td></tr>
   		</table>
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
