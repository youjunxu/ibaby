<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.AclInfo"%>
<%@ page import="com.lhq.prj.bms.po.LogInfo"%>
<%@ page import="com.lhq.prj.bms.po.Spgg"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

String strCurCode=(String)request.getAttribute("sysList_lbdm");
String strCurMk=(String)request.getAttribute("sysList_lbmc");
List ls=(List)request.getAttribute("sysList_disp");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script LANGUAGE='Javascript'>
function doOpenDoc(strId)
{
	location.href='<%=basePath%>/findBADocByCond.action?baId='+strId;
}
function toPage(strPage)
{
	var t1='<%=basePath%>/baSeekList.action?pCur='+strPage;
	location.href=t1;
}
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'>首页</a> > <a href='<%=basePath%>/sysmanaA.action'>系统管理</a> > <%=strCurMk%>
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td style='height:40px;'>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%;'>
	<tr>
	<td width=240>
		<font color='#A9714E' size='5'><%=strCurMk%></font>
	</td>
    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693 /></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%; height:500px; font-size: 12px;'>
	<tr>
	<td width=20% valign="top">
		<table cellspacing='0' cellpadding="0" border='0'>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif'/>&nbsp;<a href='<%=basePath%>/sysmanaA.action'><font color=green>信息发布</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif'/>&nbsp;<a href='<%=basePath%>/sysmanaB.action' /><font color=green>会员信息</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif'/>&nbsp;<a href='<%=basePath%>/sysmanaC.action'><font color=green>用户权限</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif'/>&nbsp;<a href='<%=basePath%>/sysmanaD.action'><font color=green>系统日志</font></a></td>
 		</tr>
        <tr>
        <td colspan=2>&nbsp;</td>
        </tr>
    	</table>
	</td>
    <td width=5% style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' /></td>
    <td valign="top" align='left'>
	<%
		if (strCurCode.equals("GG"))
		{
%>
			<jsp:include page="sys_gg.jsp">
<%
			if (ls!=null)
			{
%>
				<jsp:param name="listSrc" value="<%=ls%>" />
<%
			}
%>
			</jsp:include>
<%
		}
		if (strCurCode.equals("ACL"))
		{
	%>
	<jsp:include page='sys_acl.jsp'>
	<jsp:param name="listSrc" value="<%=ls%>" />
	<jsp:param name="srcCode" value="<%=strCurCode%>" />
	</jsp:include>
	<%
		}
		if (strCurCode.equals("HY"))
		{
	%>
	<jsp:include page='sys_member.jsp'>
	<jsp:param name="listSrc" value="<%=ls%>" />
	</jsp:include>
	<%
		}
		if (strCurCode.equals("LOG"))
		{
	%>
	<jsp:include page='sys_log.jsp'>
	<jsp:param name="listSrc" value="<%=ls%>" />
	</jsp:include>
	<%
		}
	%>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
</table>
</body>
</html>

