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
    <title>注册校验结果页面</title>
  </head>
  
  <body>
	<s:action name="gvCurUserTopMenu" executeResult="true" />
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
	<tr >
	<td style='background:url(images/top_bottom.gif) no-repeat;height:300px;font-size:24px;'/>
	<img src='/<%=basePath%>/images/reg2.png' />
	</td></tr>
	<tr style='height:20px;'><td>&nbsp;</td></tr>
	<tr><td>请您<a href='<%=basePath%>/<s:property value='dstJsp'/>'>登录</a>
    </td></tr>
</table>
</body>
</html>
