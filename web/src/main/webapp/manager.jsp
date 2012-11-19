<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝家爱家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
</head>
<body >
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">FIRST</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr>
<td width=520 >
	<table border="0" width=520 height=100% cellspacing="0" cellpadding="0" >
	<tr style='height:15px;'><td colspan=2></td></tr>
	<tr><td width=16></td>
	<td style='border-right:#cccccc dashed 1px;text-align:left;'>
		<s:action name="findAllEJByFirst" executeResult="true" >
		<s:param name='limit'>9</s:param>
		<s:param name='start'>0</s:param>
		</s:action>
	</td>
	</tr>
	<tr style='height:25px;'><td></td></tr>
	</table>
</td>
<td width=10></td>
<td width=420>
  <s:action name="findIndexABaxy" executeResult="true" />
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
