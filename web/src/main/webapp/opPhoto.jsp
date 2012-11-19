<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.PhotoPz"%>
<%@ page import="com.lhq.prj.bms.po.PhotoMemo"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lsMain=(List)request.getAttribute("waitDisp_zpxx");
Integer intAllzs=(Integer)request.getAttribute("waitDisp_zpall");
String strPhotoPath="graph/people";
UserEj ej=(UserEj)request.getSession().getAttribute("waitListA_ej");
PhotoPz pz=(PhotoPz)request.getAttribute("waitDisp_xcxx");
String strLmp="";
Integer intXcZs=0;
if (intAllzs==null)
{
	intAllzs=0;
}
if (ej==null)
{
	strLmp="error.jsp";
%>
	<jsp:forward page="<%=strLmp%>" />
<%
}
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
Integer intPageLine=25;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);
strLmp="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='JavaScript'>
function toGrContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/opPersonPhoto.action?userId=<%=ej.getUserId()%>&pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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

</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
   	<td align='left' valign="bottom" style='font-size:14px;'>
   		<table cellspacing="0" cellpadding="0" border='0' style='height:33px;'>
   		<tr>
    	<td align='center' valign='middle' style='width:100px;font-size:14px;'>
    	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toGrContent()'><font color='#2F9681'>博文列表</font></a>
    	</td>
		</tr>
	   	</table>
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
    <td valign='top'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td align='left'>
		&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'><font color='#2F9681'>首页</font></a> > <a href='<%=basePath%>/firstEJ.action'><font color='#2F9681'>贝爱一家</font></a> > <a href='<%=basePath%>/toPersonHome.action?userId=<%=pz.getUserId()%>'><font color='#2F9681'><%=ej.getNickName()%></font></a> > <a href='<%=basePath%>/oPersonPhoto.action?userId=<%=pz.getUserId()%>'><font color='#2F9681'>制造记忆</font></a> > <%=pz.getStrTitle()%>
		</td>
   		<tr style='height:15px;' ><td ></td></tr>
		<tr>
		<td >
	    	<table border="0" cellspacing="0" cellpadding="0" width=96% style='margin-left:20px;'>
	    	<%
	    	if (intSize>0)
	    	{
	    		for (intLmp=0;intLmp<lsMain.size();intLmp++)
	    		{
	    			intTmp=intLmp+1;
	    			PhotoMemo pm=(PhotoMemo)lsMain.get(intLmp);
	    			if (intTmp%5==1)
	    			{
	    				if (intTmp>5) out.println("<tr style='height:20px;'><td colspan=9></td></tr>");
	    				out.println("<tr>");
	    			}else
	    			{
	    				out.println("<td style='width:20px;'></td>");
	    			}
    				%>
    				<td align='left' style='width:145px;'>
    				   	<table border="0" cellspacing="0" cellpadding="0" width=100% >
						<tr>
						<%
						strLmp=basePath+"/"+strPhotoPath+"/"+pm.getWjName();
						%>
						<td>
						<img src='<%=strLmp%>' width=145 height=144 />
						</td>
   						</tr>
						<tr style='height:20px;'>
						<td align='center' valign='middle' style="background-color:#56B1A8;">
						<a href='<%=basePath%>/opaPersonPhoto.action?photoId=<%=pm.getPhotoId()%>&xcId=<%=pm.getXcId()%>'>
						<font color=#FFFFFF><%=pm.getStrTitle()%></font></a>
						</td>
   						</tr>
					   	</table>
    				
    				</td>
    				<%
	    			if (intTmp%5==0)
	    			{
	    				out.println("</tr>");
	    			}
	    		}
	    		if (lsMain.size()%5>0)
	    		{
	    			intTmp=5-lsMain.size()%5;
	    			intLmp=intTmp*2;
	    			%>
    				<td colspan="<%=intLmp%>"></td>
    				</tr>
    				<%
	    		}
	    	}
	    	%>
			<tr style='height:20px;'><td colspan=9></td></tr>
			<%
			if (!"".equals(strPageOut))
			{
			%>
			<tr style='height:30px;' valign='middle' align='center'><td colspan=9 style='font-size:12px;'><%=strPageOut%></td></tr>
			<tr style='height:30px;'><td colspan=9></td></tr>
			<%
			}
			%>
			</table>
		</td>
   		</tr>
	   	</table>
    <!-- 文档区over -->
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
