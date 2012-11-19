<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.SpBrand"%>

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
if (strUserAcl.indexOf("BA509")==-1 && strUserAcl.indexOf("999")==-1)
{
%>
	<jsp:forward page="error.jsp" />
<%
} 

List ls=(List)request.getAttribute("sysList_disp");
Integer intLmp;
Integer intTmp;

String strLmp="";
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 品牌管理";

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
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function toEdit(strId)
{
	var t1='<%=basePath%>/sysSpppOpen.action?brandId='+strId;
	location.href=t1;
}
function toDel(strId)
{
	var t1='<%=basePath%>/deleteSpBrandById.action?brandId='+strId;
	if (confirm('确实删除此类型吗？'))
	{
		location.href=t1;
	}
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/sysmanaPP.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
	var t1='<%=basePath%>/sysPrevNew.action';
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'>
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
	<td width=240 >
		<font color='#A9714E' size='5'>品牌管理</font>
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
        <td align='center' width=30% >类型</td>
        <td align='center' width=30% >品牌</td>
        <td align='center' width=20% >LOG</td>
        <td align='center'>功能</td>
        </tr>
		<tr><td style='height:3px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
		<%
		if (intSize==0)
		{
			out.println("<tr><td colspan=4>暂无数据记录。</td></tr>");
		}else
		{
			for (intLmp=0;intLmp<ls.size();intLmp++)
			{
				SpBrand sp=(SpBrand) ls.get(intLmp);
				%>
				<tr style='height:40px;'>
				<td valign='middle' class='td_dash' >
				&nbsp;&nbsp;&nbsp;&nbsp;<%=sp.getSpTypeName()%></td>
				<td valign='middle' class='td_dash' >
				&nbsp;&nbsp;&nbsp;&nbsp;<%=sp.getBrandName()%></td>
				<td valign='middle' class='td_dash' >
				<%
				if (sp.getBrandImg()!=null)
				{
					out.println("<img src='"+basePath+"/graph/lmxx/"+sp.getBrandImg()+"' width=78 height=41 />");
				}
				%>
				</td>
		   		<td align='center' valign='middle' class='td_dash' >
		   		<input type='button' value='编辑' onclick="toEdit('<%=sp.getBrandId()%>')">
		   		&nbsp;&nbsp;<input type='button' value='删除' onclick="toDel('<%=sp.getBrandId()%>')">
   				</td></tr>
	   		<%
			}
		}
		%>
	   		<tr style='height:20px;'><td colspan=4>&nbsp;</td></tr>
	   		<tr><td colspan=4>
	   		<table cellspacing='0' cellpadding="0" border='0' width=100% >
	   		<tr>
	   		<td align=center valign=middle style='width:100px;'>
	   		<input type='button' value='新增品牌' onclick="toNew()">
	   		</td><td align=center valign=middle style='font-size:12px;'>
			<%=strPageOut%>
	   		</td>
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
