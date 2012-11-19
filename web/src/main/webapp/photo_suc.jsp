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
List lsXc=(List)request.getAttribute("waitDisp_xcxcxx");
List lstGs=(List)request.getAttribute("waitDisp_xcgs");
Integer intAllzs=(Integer)request.getAttribute("waitDisp_zpall");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String strLmp="";
Integer intXcZs=0;
if (lsXc==null)
{
	intXcZs=0;
}else
{
	intXcZs=lsXc.size();
}

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
	t1='<%=basePath%>/myPersonContent.action';
	location.href=t1;
}

function toXc(strId)
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action?xcId='+strId;
	location.href=t1;
}
function toPersonXx()
{
	var t1='';
	t1='<%=basePath%>/myPersonXx.action';
	location.href=t1;
}
function doCjxc()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=0';
	location.href=t1;
}
function doUpzp()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=1';
	location.href=t1;
}

function doChgLb()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.xcId,'1');
	frm.xcTitle.value=t1;
}
function doChgFm(strId)
{
	var t1='<%=basePath%>/updatePhotoMemoB.action?photoId='+strId;
	location.href=t1;
}
function doEdit(strId)
{
	var t1='';
	location.href=t1;
}
function doRemove(strId)
{
	var t1='<%=basePath%>/deletePhotoMemoByid.action?photoId='+strId;
	if (confirm('确实删除此相片吗？'))
	{
		location.href=t1;
	}
}
function doCjxc()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=0';
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
   	<td align="left" width=67% style='font-size:24px;' valign='middle' >
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
    	<td align='center' valign='middle' style='width:100px;font-size:14px;'>
    	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toPersonXx()'><font color='#2F9681'>个人资料</font></a>
    	</td>
    	<td style='background:url(<%=basePath%>/images/btnAl.jpg) no-repeat;width:4px;'></td>
    	<td valign='middle' style='background:url(images/btnAm.jpg) repeat-x;'>
    	<img src="<%=basePath%>/images/arrowWhite.jpg" />&nbsp;&nbsp;
   		<font color='#FFFFFF'>制造记忆</font>
		</td>
    	<td style='background:url(<%=basePath%>/images/btnAr.jpg) no-repeat;width:4px;'></td>
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
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr >
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;'>
	    	<tr>
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_1.jpg) no-repeat;'>
			</td>
	    	</tr>
	    	<tr>
	    	<td align='left' style='background:url(<%=basePath%>/images/content_bk_2.jpg) repeat-y;' valign='top'>
		    	<table border="0" style='width:150px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td style='width:80px;' align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>相册分类</b></font>
    			</td>
    			<td style='width:25px;'>&nbsp;</td>
    			<td align='center' style='width:30px;' >
    			<a href='<%=basePath%>/photoPzManage.action'><font color='#FE8F1C'>管理</font></a>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='<%=basePath%>/images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td colspan=3></td></tr>
	    		<tr><td>
    			<a href="javascript:toXc('0')"><font color='#33927E'>&nbsp;&nbsp;&nbsp;&nbsp;全部相册</font></a>
				</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intAllzs%>)</td></tr>
				<%
				if (intXcZs>0)
				{
	    			for (intLmp=0;intLmp<intXcZs;intLmp++)
	    			{
	    				PhotoPz p=(PhotoPz)lsXc.get(intLmp);
	    				out.println("<tr style='height:15px;'><td colspan=3></td></tr>");
	    				out.println("<tr><td>");
	    				%>
	    				<a href="javascript:toXc('<%=p.getXcId()%>')">
	    				<font color='#33927E'>&nbsp;&nbsp;&nbsp;&nbsp;<%=p.getStrTitle()%></font></a>
	    				<%
	    				out.println("</td>");
	    				out.println("<td >&nbsp;</td>");
						intTmp=(Integer)lstGs.get(intLmp);
			    		out.println("<td align='left' >("+intTmp.toString()+")");
	    				out.println("</td></tr>");
		    		}
	    		}
				if (intXcZs<=3)
				{
				%>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
				<%
				}
				%>
		    	</table>
    		</td>
	    	</tr>
	    	<tr >
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_3.jpg) no-repeat;'>
			</td>
	    	</tr>
    		<tr style='height:20px;' ><td ></td></tr>
	    	</table>
    	</td>
    	</tr>
    	<tr><td></td></tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
		<s:property value='tip'/>
    <!-- 文档区over -->
		</td>
   		</tr>
   		<tr style='height:20px;'><td></td></tr>
	   	</table>
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
