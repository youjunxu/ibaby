<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.PhotoMemo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (objUser==null || flagUser!=9)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
 
List ls=(List)request.getAttribute("sysList_disp");
Integer intLmp;
Integer intTmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
String strLmp="";
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 相片审核";

//页码等信息
Integer intSize=(Integer)request.getAttribute("sysCount_disp");
if (intSize==null) intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=10;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/sysmanaF.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;

	location.href=t1;
}
function toTurnPage()
{
	var doc=document.frmTurnPage;
	var t1=doc.ipg.value;

	if (t1=='')
	{
		alert('请输入欲跳转的页数！');
		return false;
	}
	if (!checkIsNumber(doc.ipg))
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	if (parseInt(t1)==0 || parseInt(t1)><%=intPageZs%>)
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	toPage(t1);
}
function doPass(s)
{
	var doc=document.form1;
	var t1='';
	var t2='';
	var t3='';
	if (doc.btnWaitPs)
	{
		if(doc.btnWaitPs.length)
		{
			for (var i=0;i<doc.btnWaitPs.length;i++)
			{
				if (doc.btnWaitPs[i].checked)
				{
					if (t1!='') t1=t1+',';
					t1=t1+doc.sidWaitPs[i].value;
				}
			}
		}else
		{
			if (doc.btnWaitPs.checked)
			{
				t1=doc.sidWaitPs.value;
			}
		}
	}else
	{
		alert('对不起，没有待处理的相片信息！');
		return;
	}
	if (t1=='')
	{
		alert('对不起，请您选择待处理的相片信息！');
		return;
	}
	var t2='<%=basePath%>/shPhotoPass.action?waitPsList='+t1;
	if (parseInt(s)==1)
	{
		//审核通过
		t2=t2+'&phStatus=1';
		t3='这些相片确实通过审核吗？';
	}else
	{
		if (parseInt(s)==2)
		{
			//审核不通过
			t3='这些相片确实不通过吗？';
			t2=t2+'&phStatus=2';
		}else
		{
			if (parseInt(s)==3)
			{
				//删除
				t2=t2+'&phStatus=3';
				t3='这些相片确实删除吗？';
			}else
			{
				alert('对不起，处理失败！');
				return;
			}
		}
	}
	if (confirm(t3))
	{
		location.href=t2;
	}
	
}
//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
<form name='form1'>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;' >
	    <table width=100% >
    	<tr>
        <td width=4%></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<%=strNav%>
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
		<font color='#A9714E' size='5'>权限管理</font>
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
	<jsp:include page="sys_left.jsp" />
	</td>
    <td width=5% style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' ></td>
    <td valign='top' align='left'>
		<table cellspacing='0' cellpadding="0" border='0' style='width:95%; '>
		<tr style='height:30px;' valign='middle'>
		<td colspan=7 class='td_dash'>
		<a href='#' onclick='doPass(1)' >审核通过</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='doPass(2)' >审核不通过</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='doPass(3)' >删除</a>
		</td>
		</tr>
  		<tr style='height:20px;' ><td colspan=7></td></tr>
	<%
	if (intSize>0)
	{
		for (intLmp=0;intLmp<ls.size();intLmp++)
		{
			PhotoMemo pm=(PhotoMemo)ls.get(intLmp);
			intTmp=intLmp+1;
			if ((intTmp%4)==1)
			{
			%>
			<tr>
			<%
			}else
			{
			%>
			<td style='width:20px;'></td>
			<%
			}
			%>
			<td style='width:145px;' align='left'>
	    		<table border="0" cellspacing="0" cellpadding="0" width=145 >
				<tr>
				<td>
				<img src='<%=basePath%>/graph/people/<%=pm.getWjName()%>' width=145 height=144 />
				</td>
				</tr>
				<tr style='height:20px;'>
				<td align='center' valign='middle' style="background-color:#56B1A8;">
				<input type='hidden' name='sidWaitPs' value='<%=pm.getPhotoId()%>' />
				<input type='checkbox' name='btnWaitPs' onclick="chgPsxx()"/>
				<a href='<%=basePath%>/photoGl.action?BJ=2&photoId=<%=pm.getPhotoId()%>'>
				<font color=#FFFFFF><%=pm.getStrTitle()%></font></a>
				</td>
				</tr>
			   	</table>
			</td>
			<%
			if ((intTmp%4)==0)
			{
			%>
				</tr>
	   			<tr style='height:20px;' ><td colspan=7></td></tr>
			<%
			}
		}
		intTmp=ls.size();
		if ((intTmp%4)>0)
		{
			intLmp=4-(intTmp%4);
			%>
			<td colspan=<%=intLmp%> ></td>
			</tr>
	   		<tr style='height:20px;' ><td colspan=7></td></tr>
		<%
		}
	}
	if (strPageOut!=null)
	{
		if (!"".equals(strPageOut))
		{
			%>
	   		<tr style='height:20px;' ><td colspan=7 align='center' style='font-size:12px;'><%=strPageOut%></td></tr>
	   		<%
		}
	}
%>
		</table>

	</td></tr>
	<tr>
	<td colspan=3 style='height:20px;'></td>
	</tr>
	</table>
</td>
</tr>
</table>
</form>
</body>
</html>
<s:include value='footer.jsp'></s:include>
