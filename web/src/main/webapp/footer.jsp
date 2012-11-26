<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<table border="0" cellspacing="0" cellpadding="0" align=center style='width:928px;'>
<tr style='height:8px;'><td colspan=2>&nbsp;</td></tr>
<tr>
	<td align=left valign="middle" width=60%>
	<span ><a href="<%=basePath%>/prevOpenNetXx.action?tip=1">关于我们</a> | <a href="<%=basePath%>/prevOpenNetXx.action?tip=2">相关声明</a> | <a href="<%=basePath%>/prevTsjyIndex.action">投诉与建议</a> | <a href="<%=basePath%>/prevFirstYqlj.action" target='_blank'>好站链接</a></span>
	</td>
	<td align=left valign="middle">
		<font color='#AAAAAA'>Copyright © 1998 - 2012 www.begalove.com All Rights Reserved</font>
	</td>
</tr>
</table>
