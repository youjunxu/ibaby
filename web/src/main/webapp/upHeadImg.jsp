<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE='Javascript'>
function toContent(strBj)
{
	var t1='';
	t1='<%=basePath%>/myPersonContent.action?strCurDispLb='+strBj+'&userId=<%=ej.getUserId()%>';
	location.href=t1;
}
function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/grPhoto.action';
	location.href=t1;
}
function doSubmit()
{
	var doc=document.form1;
	var t1=doc.fiHeadImg.value;
	var t2='';

	doc.headImg.value=t1;
	if (t1=='')
	{
		alert('请上传附件！');
	}else
	{
		t2=t1.substring(t1.length-3,t1.length);
		if (t2.toUpperCase()!='JPG' && t2.toUpperCase()!='GIF')
		{
			alert('不支持该文件后缀类型！');
		}else
		{
			if (confirm('确实上传头像吗？'))
			{
				doc.submit();
			}
		}
	}
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
					<s:param name="leftMk">HEAD</s:param>
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
    	<td >
  			<s:form method="post" action="updateHeadImg" name="form1" theme="simple" enctype="multipart/form-data">
  			<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
  			<input type='hidden' name='headImg' value=''/>
			<table cellspacing='0' cellpadding="0" border='0' width=680 align="center" style='font-size:14px;'>
			<tr>
				<TD align="left" >&nbsp;&nbsp;
				<input type=file name='fiHeadImg' size=60>
			</TD>
			</TR>
			<tr style='height:25px;'>
				<TD align="left" >&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>文件后缀：JPG/GIF，大小不得超过2MB。</font>
			</TD>
			</TR>
			<tr style='height:25px;'>
				<TD align="left" >&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>此文件将同时作为贝爱一家的照片。</font>
			</TD>
			</TR>
				<TR><TD height=8 class=td_dash></TD></TR>
				<TR><TD height=15 ></TD></TR>
				<TR>
					<TD noWrap align='left' valign='bottom'>&nbsp;&nbsp;
					<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
					</TD>
				</TR>
			</table>
			</s:form>
    	</td>
    	</tr>
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
