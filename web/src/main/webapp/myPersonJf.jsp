<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*"%>
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
String strLmp;
Integer intLmp;
Float fltA;
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
   	<tr style='height:5px;'><td></td></tr>
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
					<s:param name="leftMk">JFXX</s:param>
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
   			<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align='center' >
			<TR><TD height=15 colspan=4></TD></TR>
			<TR>
				<td width=20 ></td>
				<TD align='left' style='width:100px;' >
					<SPAN class=content_black_bold>总积分：&nbsp;</SPAN>
				</TD>
				<td width=20 ></td>
				<td align='left' >
				<%
				out.println(new java.text.DecimalFormat("#.0").format(objUser.getUserJfzs()));
				%>
				</TD>
			</TR>
			<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=4></TD></TR>
			<TR>
				<td ></td>
			<TD align='left'>
				<SPAN class=content_black_bold>消费积分：<font color=red>*</font></SPAN>
			</TD>
			<td width=20 ></td>
			<td align='left'>
				<%
				out.println(new java.text.DecimalFormat("#.0").format(objUser.getUserXfjf()));
				%>
			</TD>
			</TR>
			<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=4></TD></TR>
			<TR>
				<td ></td>
				<TD align='left' >
					<SPAN class=content_black_bold>剩余积分：<font color=red>*</font></SPAN>
				</TD>
				<td width=20 ></td>
				<td align='left' >
				<%
				out.println(new java.text.DecimalFormat("#.0").format(objUser.getUserSyjf()));
				%>
				</TD>
			</TR>
			<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=4></TD></TR>
			</TABLE>
    	</td>
    	</tr>
    	<tr style='height:20px;'><td></td></tr>
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
