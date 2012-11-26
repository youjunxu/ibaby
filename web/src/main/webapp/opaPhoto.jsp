<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.PhotoPz"%>
<%@ page import="com.lhq.prj.bms.po.PhotoMemo"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
String strPhotoPath="graph/people";
UserEj ej=(UserEj)request.getSession().getAttribute("waitListA_ej");
PhotoPz pz=(PhotoPz)request.getAttribute("waitDisp_xcxx");
PhotoMemo pm=(PhotoMemo)request.getAttribute("waitDisp_opendoc");
String strLmp="";
if (ej==null)
{
	strLmp="error.jsp";
%>
	<jsp:forward page="<%=strLmp%>" />
<%
}
Integer intPrev=(Integer)request.getAttribute("waitDisp_prevPh");
Integer intNext=(Integer)request.getAttribute("waitDisp_nextPh");
Integer iw;
Integer ih;
strLmp="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script LANGUAGE='JavaScript'>
function toGrContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=ej.getUserId()%>';
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
    <td valign='top' align='center'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=80% >
		<tr>
		<td align='left'>
		&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'><font color='#2F9681'>首页</font></a> > <a href='<%=basePath%>/firstEJ.action'><font color='#2F9681'>贝爱一家</font></a> > <a href='<%=basePath%>/toPersonHome.action?userId=<%=pz.getUserId()%>'><font color='#2F9681'><%=ej.getNickName()%></font></a> > <a href='<%=basePath%>/oPersonPhoto.action?userId=<%=pz.getUserId()%>'><font color='#2F9681'>制造记忆</font></a> > <a href='<%=basePath%>/opPersonPhoto.action?xcId=<%=pz.getXcId()%>'><font color='#2F9681'><%=pz.getStrTitle()%></font></a>
		</td>
		</tr>
   		<tr style='height:15px;' ><td></td></tr>
   		<tr style='height:15px;' >
   		<td>
   		<%
   		strLmp="";
   		if (intPrev!=null)
   		{
   			if (intPrev!=-1)
   			{
   				strLmp="<td align='left'><a href='"+basePath+"/opaPersonPhoto.action?photoId="+String.valueOf(intPrev)+"&xcId="+String.valueOf(pz.getXcId())+"'>上一张</a></td>";
   			}
   		}
   		if (intNext!=null)
   		{
   			if (intNext!=-1)
   			{
   				if (!"".equals(strLmp)) strLmp=strLmp+"";
   				strLmp=strLmp+"<td align='right'><a href='"+basePath+"/opaPersonPhoto.action?photoId="+String.valueOf(intNext)+"&xcId="+String.valueOf(pz.getXcId())+"'>下一张</a></td>";
   			}
   		}
   		if (!"".equals(strLmp))
   		{
   			%>
	    	<table border="0" cellspacing="0" cellpadding="0" width=85% align='center'>
			<tr>
   			<%
   	   		out.println(strLmp);
   			%>
   			</tr></table>
   			<%
   		}
   		%>
   		</td>
   		</tr>
		<tr>
		<td align='center'>
		<%
		iw=640;
		ih=480;
		if (pm.getPhotoWidth()!=null)
		{
			iw=pm.getPhotoWidth();
		}
		if (pm.getPhotoHeight()!=null)
		{
			ih=pm.getPhotoHeight();
		}
		if (iw>640) iw=640;
		if (ih>480) ih=480;
		%>
		<img src='<%=basePath%>/<%=strPhotoPath%>/<%=pm.getWjName()%>' width=<%=iw%> height=<%=ih%> />
		</td>
   		</tr>
	   	</table>
    <!-- 文档区over -->
	</td>
   	</tr>
   	<tr style='height:30px;'><td></td></tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
