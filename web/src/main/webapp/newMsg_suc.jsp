<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.TbInbox"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
Integer wRecUserId=(Integer)request.getAttribute("waitRec_userId");
String wRecUserName=(String)request.getAttribute("waitRec_userName");
if (objUser==null )
{
	%> 
	<jsp:forward page="login.jsp" />
	<%
}
Integer intNew=(Integer)request.getAttribute("sysNewIn_zs");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
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
   	<td align='left' valign="bottom" style='font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">INBOX</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td colspan=3></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr >
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >

		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>信箱管理</b></font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' ><img src='<%=basePath%>/images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td ></td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/prevSendNewMsg.action"><font color='#33927E'>写信</font></a>
    			</td></tr>
	    		<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<a href="<%=basePath%>/myInBox.action"><font color='#33927E'>收件箱&nbsp;&nbsp;(<%=intNew==null?0:intNew%>)</font></a>
	    		</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/myOutBox.action"><font color='#33927E'>发件箱</font></a>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			</td></tr>
	    		<tr style='height:10px;'><td ></td></tr>
		    	</table>


    		</td>
	    	</tr>
	    	</table>
    	</td>
    	</tr>
    	<tr><td></td></tr>
    	</table>
    </td>
    <td valign='top' align='left'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td >
		<s:property value='tip'/>&nbsp;&nbsp;<a href="<%=basePath%>/<s:property value='dstJsp'/>">返回</a>
		</td>
		</tr>
		</table>
    <!-- 文档区 over-->
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
