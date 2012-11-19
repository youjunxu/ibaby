<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.po.NetXx"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
NetXx nx=(NetXx)request.getAttribute("waitDoc");
Integer slb=(Integer)request.getAttribute("waitLb");
if (slb==null) slb=1;
String strCurMk="";
if (slb==1)
{
	strCurMk="关于我们";
}else
{
	strCurMk="相关声明";
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查看信息</title>
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">FIRST</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'>首页</a> > <%=strCurMk%>
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr >
<td style='height:300px;font-size:18px;' >
	<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
	<tr><td align='center' valign='top'>
		<table border="0" cellspacing="0" cellpadding="0" width=80% >
		<tr style='height:30px;'><td colspan=2></td></tr>
		<tr><td style='text-align:center;font-size:14px;' ><b><%=strCurMk%></b></td></tr>
		<tr style='height:5px;' ><td class=td_dash>&nbsp;</td></tr>
		<tr style='height:20px;'><td ></td></tr>
	<%
	if (slb==1)
	{
		%>
		<tr><td align='left' style='font-size:12px;line-height:20px;'><%=nx==null?"":nx.getAboutUs()%></td></tr>
		<%
	}else
	{
		%>
		<tr><td align='left' style='font-size:12px;line-height:20px;'><%=nx==null?"":nx.getXgSm()%></td></tr>
		<%
	}
	%>
		</table>
	</td></tr>
	</table>
</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
