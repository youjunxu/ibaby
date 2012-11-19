<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.HomeJs"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lstMain=(List)request.getAttribute("sysList_disp");
UserEj ej=(UserEj)request.getSession().getAttribute("waitListA_ej");
HomeJs hj=(HomeJs)request.getAttribute("waitOpen_doc");
if (hj==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE='Javascript'>
function toContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}

function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/oPersonPhoto.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}
function toOpenDoc(sid)
{
	var t1='';
		t1='<%=basePath%>/prevOpenJsDoc.action?jsId='+sid;
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
   	<%
	if (ej.getPhotoStatus().equals(1))
	{
	%>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
   	<td align='left' valign="bottom" style='font-size:14px;' >
   	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
   	<a href='javascript:toGrPhoto()'><font color='#2F9681'>制造记忆</font></a>
   	</td>
	<%
	}else
	{
	%>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
	<%} %>
   	
   	</tr>
   	<tr style='height:5px;'><td colspan=3></td></tr>
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
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(<%=basePath%>/images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >
		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td style='width:80px;' align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>目录分类</b></font>
    			</td>
    			<td style='width:25px;'>&nbsp;</td>
    			<td align='center' style='width:30px;' ><font color='#FE8F1C'>管理</font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='<%=basePath%>/images/content.gif' /></td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toContent()"><font color='#33927E'>贝爱学园</font></a>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' ></td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<font color='#7A7A84'>博文记事</font>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' ></td></tr>
	    		<tr style='height:40px;' ><td colspan=3></td></tr>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
		    	</table>
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
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
   		<tr style='height:10px;' ><td colspan=2></td></tr>
		<tr>
		<td align='right' width=70 >主题：</td>
    	<td align='left'>&nbsp;
    	<%=hj.getJsTitle()%>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >摘要：</td>
    	<td align='left'>&nbsp;
    	<%=hj.getStrContent()%>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >内容：</td>
    	<td align='left'>&nbsp;
		<%=hj.getStrMemo()%>
    	</td>
		</tr>
   		<tr style='height:10px;' ><td colspan=2 ></td></tr>
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
