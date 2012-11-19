<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.TbCity"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>

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
String strNav="";
Integer intTmp;

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 省市管理";

List ls=(List)request.getAttribute("sysList_disp");
Integer intLmp;
String strLmp="";

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
<link href"<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doEditDoc(strId)
{
	location.href='<%=basePath%>/sysCityOpen.action?cityId='+strId;
}
function toDel(strId)
{
	var t1='<%=basePath%>/deleteCity.action?cityId='+strId;
	if (confirm('确实删除此文档吗？'))
	{
		location.href=t1;
	}
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/sysmanaE.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
	
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
	var t1='<%=basePath%>/sys_cityNew.jsp';
	location.href=t1;
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
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
		<font color='#A9714E' size='5'>省市管理</font>
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
    <td width=5% style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' /></td>
    <td valign="top" align='left'>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td width=20></td>
        <td align='center' width=200 style='font-face:黑体;font-size:12px;'>省份</td>
        <td align='center' width=200 style='font-face:黑体;font-size:12px;'>城市</td>
        <td align='center' width=300 style='font-face:黑体;font-size:12px;'>功  能</td>
        <td>&nbsp;</td>
        </tr>
		<tr><td style='height:3px;' colspan=5 class='td_dash'>&nbsp;</td></tr>
		<%
		if (intSize==0)
		{
			out.println("<tr><td colspan=5 class='td_dash'>暂无数据记录。</td></tr>");
		}else
		{
			for (intLmp=0;intLmp<ls.size();intLmp++)
			{
				TbCity ct=(TbCity) ls.get(intLmp);
			%>
			<tr style='height:40px;'>
	        <td class='td_dash' >&nbsp;</td>
			<td valign="middle" class='td_dash'><a href="javascript:doEditDoc('<%=ct.getCityId()%>')"><%=ct.getSsName()%></a></td>
			<td valign="middle" class='td_dash'><%=ct.getCityName()==null?"":ct.getCityName()%></td>
	   		<td align="left" valign="middle" class='td_dash'>&nbsp;&nbsp;&nbsp;&nbsp;
	   		<input type='button' value='删除' onclick="toDel('<%=ct.getCityId()%>')" />
			</td>
			<td class='td_dash' >&nbsp;</td>
			</tr>
	   		<%
			}
		}
		%>
   		<tr><td style='height:5px;' colspan=5>&nbsp;</td></tr>
   		<tr><td colspan=5>
	   		<table cellspacing='0' cellpadding="0" border='0' width=100% >
	   		<tr>
	   		<td align=center valign=middle style='width:100px;'>
	   		<input type='button' value='新增省市' onclick="toNew()" />
	   		</td><td align=center valign=middle style='font-size:12px;'><%=strPageOut%></td>
	   		</tr>
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
