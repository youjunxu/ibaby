<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LineIgo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (objUser==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
if (strUserAcl.indexOf("IG509")==-1 && strUserAcl.indexOf("999")==-1)
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
if(strUserAcl.indexOf("999")>=0)
{
	strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
}else
{
	strNav=strNav+" > <a href='"+basePath+"/sysmanaG.action'><font color='#2F9681'>系统管理</font></a>";
}
strNav=strNav+" > IGO管理";
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
function doEdit(strId)
{
	location.href='<%=basePath%>/prevEditIgo.action?igoId='+strId;
}
function doOpen(strId)
{
	location.href='<%=basePath%>/prevSeekIgo.action?igoId='+strId;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/sysmanaG.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;

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
function toNew()
{
	var t1='<%=basePath%>/prevNewIgo.action';
	location.href=t1;
}
function doDel(strId)
{
	var t1='<%=basePath%>/deleteIgoById.action?igoId='+strId;
	if (confirm('确实删除此记录吗？'))
	{
		location.href=t1;
	}
}

//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
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
		<font color='#A9714E' size='5'>IGO管理</font>
	</td>
    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693 /></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%; font-size: 12px;'>
	<tr>
	<td width=20% valign="top">
	<jsp:include page="sys_left.jsp" />
	</td>
    <td width=45 style='background:url(images/icon_dash.gif) repeat-y;' ></td>
    <td valign='top' align='left'>
		<table cellspacing='0' cellpadding="0" border='0' style='width:94%; height:100%; font-size: 12px;'>
		<tr>
		<td width=200 align='center'>商品名称</td>
		<td width=200 align='center'>产地</td>
		<td width=60 align='center'>适合段数</td>
		<td width=50 align='center'>指导价</td>
		<td align='center'>功能</td>
		</tr>
		<tr style='height:10px;'><td colspan=5 class='td_dash'></td></tr>
		<tr style='height:10px;'><td colspan=5></td></tr>
		<%
		if (intSize>0)
		{
			for (intLmp=0;intLmp<ls.size();intLmp++)
			{
				LineIgo lo=(LineIgo)ls.get(intLmp);
				%>
				<tr style='height:25px;'>
				<td align='left' class='td_dash'><a href="javascript:doOpen('<%=lo.getIgoId()%>')"><%=lo.getIgoName()%></a></td>
				<td align='left' class='td_dash'><%=lo.getIgoOriginal()%></td>
				<td align='center' class='td_dash'><%=lo.getIgoSection()==null?"":lo.getIgoSection()%></td>
				<td align='center' class='td_dash'><%=lo.getIgoGuide()%></td>
				<td align='center' class='td_dash'>
				<input type='button' value='编辑' onclick="doEdit('<%=lo.getIgoId()%>')" />
				&nbsp;&nbsp;<input type='button' value='删除' onclick="doDel('<%=lo.getIgoId()%>')" />
				</td>
				</tr>
				<%
			}
		}
		%>
		<tr style='height:10px;'><td colspan=6></td></tr>
		<tr><td colspan=6>
	   		<table cellspacing='0' cellpadding="0" border='0' width=100% >
	   		<tr>
	   		<td align=center valign=middle style='width:100px;'>
	   		<input type='button' value='新增IGO' onclick="toNew()" />
	   		</td><td align=center valign=middle style='font-size:12px;'>
			<%=strPageOut%>
	   		</td></tr>
	   		</table>
		</td></tr>
		</table>
	</td></tr>
	<tr>
	<td colspan=3 style='height:20px;'></td>
	</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
