<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String strMk=(String)request.getAttribute("topmk");
Integer intNewXx=(Integer)request.getAttribute("sysNewIn_zs");
if (intNewXx==null) intNewXx=0;
String strNewXx;
strNewXx="";
if (intNewXx>0) strNewXx="("+String.valueOf(intNewXx)+")";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<script LANGUAGE='Javascript'>
function toInBox()
{
	var t1='';
	t1='<%=basePath%>/myInBox.action';
	location.href=t1;
}
<%
if (!objUser.getUserName().equals("admin"))
{
%>
function toContent(strBj)
{
	var t1='';
	t1='<%=basePath%>/myPersonContent.action?strCurDispLb='+strBj;
	location.href=t1;
}

function toGrPhoto()
{
	var t1='';
	<%
	if (ej.getPhotoStatus()==null ||  ej.getPhotoStatus()==0)
	{
		%>
		alert('对不起，您尚未开通相册！');
		return ;
		<%
	}else
	{
	%>
		t1='<%=basePath%>/myPersonPhoto.action';
		location.href=t1;
	<%
	}
	%>
}
function toPersonXx()
{
	var t1='';
	t1='<%=basePath%>/myPersonXx.action';
	location.href=t1;
}
function toHomeJs()
{
	var t1='';
	t1='<%=basePath%>/firstMyHomeJs.action';
	location.href=t1;
}
<%
}
%>
</script>
    <table width=920 border="0" cellspacing="0" cellpadding="0" >
   	<tr>
    <td style='width:25px;'></td>
   	<td align="left" style='font-size:24px;width:300px;' >
   	<a href='<%=basePath%>/toMyHome.action'>
   	<font color='#248D93'><b>
   	<%
   	if (objUser.getUserName().equals("admin"))
   	{
   		out.print("系统管理员<b></font>");
   	}else
   	{
   		if (ej.getEjName()==null)
   		{
   	   		out.print(ej.getNickName()+"<b></font>");
   		}else
   		{
   	   		out.print(ej.getEjName()+"<b></font>");
   		}
   	}
   	%>
   	</a>
	</td>
   	<td align='right' valign="bottom" style='font-size:14px;'>
   	<%
   	if (!objUser.getUserName().equals("admin"))
   	{
   	%>
  		<table cellspacing="0" cellpadding="0" border='0' style='height:33px;'>
    	<%
    	if ("CONTENT".equals(strMk) || "HOMEJS".equals(strMk))
    	{
   		%>
  		    <td style='background:url(images/btnAl.jpg) no-repeat;width:4px;'></td>
    		<td valign='middle' style='background:url(images/btnAm.jpg) repeat-x;'>
    		<img src="images/arrowWhite.jpg" width=5 />&nbsp;
    		<font color='#FFFFFF'>博文列表&nbsp;&nbsp;</font>
			</td>
    		<td style='background:url(images/btnAr.jpg) no-repeat;width:4px;'></td>
    		<%
    	}else
    	{
    		%>
	    	<td align='left' valign="middle" style='width:90px;font-size:14px;'>
    		&nbsp;<img src="images/index_icon_03s.gif" width=6 />&nbsp;
    		<a href='javascript:toContent()'><font color='#2F9681'>博文列表</font></a>
    		</td>
    		<%
    	}
    	if ("BASEINFO".equals(strMk))
    	{
       		%>
  		    <td style='background:url(images/btnAl.jpg) no-repeat;width:4px;'></td>
    		<td valign='middle' style='background:url(images/btnAm.jpg) repeat-x;'>
    		<img src="images/arrowWhite.jpg" width=5 />&nbsp;
    		<font color='#FFFFFF'>家庭管理&nbsp;&nbsp;</font>
			</td>
    		<td style='background:url(images/btnAr.jpg) no-repeat;width:4px;'></td>
    		<%
    	}else
    	{
	    	%>
	    	<td align='left' valign="middle" style='width:90px;font-size:14px;'>
    		&nbsp;<img src="images/index_icon_03s.gif" width=6 />&nbsp;
    		<a href='javascript:toPersonXx()'><font color='#2F9681'>家庭管理</font></a>
    		</td>
    		<%
    	}
    	if ("PHOTOINFO".equals(strMk))
    	{
       		%>
  		    <td style='background:url(images/btnAl.jpg) no-repeat;' width=4></td>
    		<td valign='middle' style='background:url(images/btnAm.jpg) repeat-x;'>
    		<img src="images/arrowWhite.jpg" width=5 />&nbsp;
    		<font color='#FFFFFF'>制造记忆&nbsp;&nbsp;</font>
			</td>
    		<td style='background:url(images/btnAr.jpg) no-repeat;width:4px;'></td>
    		<%
    	}else
    	{
	    	%>
	    	<td align='left' valign="middle" style='width:90px;font-size:14px;'>
    		&nbsp;<img src="images/index_icon_03s.gif" width=6 />&nbsp;
    		<a href='javascript:toGrPhoto()'><font color='#2F9681'>制造记忆</font></a>
    		</td>
    		<%
    	}
    	if ("INBOX".equals(strMk))
    	{
   		%>
  		    <td style='background:url(images/btnAl.jpg) no-repeat;width:4px;'></td>
    		<td valign='middle' style='background:url(images/btnAm.jpg) repeat-x;'>
    		&nbsp;<img src="images/arrowWhite.jpg" width=5 />&nbsp;
    		<font color='#FFFFFF'>消息<%=strNewXx%>&nbsp;&nbsp;</font>
			</td>
    		<td style='background:url(images/btnAr.jpg) no-repeat;width:4px;'></td>
    		<%
    	}else
    	{
    		%>
	    	<td align='left' valign="middle" style='width:90px;font-size:14px;'>
    		&nbsp;<img src="images/index_icon_03s.gif" width=6 />&nbsp;
    		<%
    		out.print("<a href='javascript:toInBox()'><font color='#2F9681'>消息"+strNewXx+"</font></a>");
    		out.print("</td>");
    	}
    	%>
   		<td width=20></td>
   		</tr>
	   	</table>
	<%
   	}
	%>
   	</td>
   	</tr>
   	</table>
