<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strCurCode=(String)request.getAttribute("strCurMkCode");
UserInfo _user=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (strUserAcl==null) strUserAcl="";
if (flagUser==null) flagUser=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script LANGUAGE='Javascript'>
function doSearch()
{
	var t1='';
	var objA=document.frmSearch.strBaCond;

	if (objA.value=='')
	{
		alert('对不起，请输入查询条件！');
		return;
	}
	document.frmSearch.submit();
}
function doLogin()
{
	parent.location.href='<%=basePath%>/login.jsp';
}
function doRegUser()
{
	parent.location.href='<%=basePath%>/prevNewUser.action';
}
</script>
	<form method='post' name='frmSearch' action='searchSysDoc.action'>
<%
	if (strCurCode.equals("BALY"))
	{
	%>
	<table cellspacing="0" cellpadding="0" border="0" style="height:86px;width:927px;margin-top:5px;" align="center">
	<tr style='height:20px;'>
	<td rowspan="3" width="240" align="left"><img src="<%=basePath%>/images/index_icon_10.gif" /></td>
	<%
		if(strUserAcl.indexOf("999")>=0 || strUserAcl.indexOf("IG509")>=0 || strUserAcl.indexOf("BA509")>=0)
		{
			%>
			<td rowspan="3" width="91" align="left">&nbsp;</td>
			<%
		}else
		{
			%>
			<td rowspan="3" width="178" align="left">&nbsp;</td>
			<%
		}
	}else
	{
	%>
	<table cellspacing="0" cellpadding="0" border="0" style="height:86px;width:950px;margin-top:5px;" align="center">
	<tr style='height:20px;'>
	<td rowspan="3" width="240" align="left"><img src="<%=basePath%>/images/index_icon_10.gif" /></td>
	<%
		if(strUserAcl.indexOf("999")>=0 || strUserAcl.indexOf("IG509")>=0 || strUserAcl.indexOf("BA509")>=0)
		{
			%>
			<td rowspan="3" width="91" align="left">&nbsp;</td>
			<%
		}else
		{
			%>
			<td rowspan="3" width="201" align="left">&nbsp;</td>
			<%
		}
	}
	%>
    <td align='right' >
    	<table cellspacing=0 cellpadding=0 border=0 height=16>
    	<tr>
    	<td width=155 valign='middle'>
		  <input name="strBaCond" type="text"  />
    	</td>
    	<td width=53 valign='middle' align='right'>
		  <a href='javascript:doSearch()' /><img src='<%=basePath%>/images/index_icon_03.gif' height=20 /></a>
    	</td>
    	<td>&nbsp;&nbsp;
    <%
    if (_user==null)
    {
    %>
	  <span class="span_search"><a href="#" onclick='doLogin()'>登录</a></span>
	  <span class="span_search"><a href="#" onclick='doRegUser()'>注册</a></span>
	<%
	}else
	{
	%>
	  <span >您好！<%=_user.getNickName()%></span>
	  <%
	  if (!_user.getUserName().equals("admin"))
	  {
	  %>
	  <span class="span_search"><a href="<%=basePath%>/toMyHome.action?limit=10&start=0" >我的家</a></span>
	  <%
	  }
	  %>
	  <span class="span_search"><a href="<%=basePath%>/logout.action">退出</a></span>
	<%
	}
	%>
    	</td>
    	</tr>
    	</table>
	</td>
</tr>
<tr><td style='height:35px;' colspan=2>&nbsp;</td></tr>
<%
if(strUserAcl.indexOf("999")>=0 || strUserAcl.indexOf("IG509")>=0 || strUserAcl.indexOf("BA509")>=0)
{
	if (strCurCode.equals("BAXY"))
	{
		out.println("<tr><td class='menubar_02' style='height:31px;' width=619 colspan=2>");
	}else
	{
		if (strCurCode.equals("BALY"))
		{
			out.println("<tr><td class='menubar_03' style='height:31px;' width=619 colspan=2>");
		}else
		{
			if (strCurCode.equals("EJ"))
			{
				out.println("<tr><td class='menubar_04' style='height:31px;' width=619 colspan=2>");
			}else
			{
				if (strCurCode.equals("IGO"))
				{
					out.println("<tr><td class='menubar_05' style='height:31px;' width=619 colspan=2>");
				}else
				{
					if (strCurCode.equals("SYS"))
					{
						out.println("<tr><td class='menubar_06' style='height:31px;' width=619 colspan=2>");
					}else
					{
						out.println("<tr><td class='menubar_01' style='height:31px;' width=619 colspan=2>");
					}
				}
			}
		}
	}
}else
{
	if (strCurCode.equals("BAXY"))
	{
		out.println("<tr><td class='menubara_02' width=509 style='height:31px;' colspan=2>");
	}else
	{
		if (strCurCode.equals("BALY"))
		{
			out.println("<tr><td class='menubara_03' width=509 style='height:31px;' colspan=2>");
		}else
		{
			if (strCurCode.equals("EJ"))
			{
				out.println("<tr><td class='menubara_04' width=509 style='height:31px;' colspan=2>");
			}else
			{
				if (strCurCode.equals("IGO"))
				{
					out.println("<tr><td class='menubara_05' width=509 style='height:31px;' colspan=2 >");
				}else
				{
					out.println("<tr><td class='menubara_01' width=509 style='height:31px;' colspan=2 >");
				}
			}
		}
	}
}

%>
	<table cellspacing="0" cellpadding="0" border="0" width=100% style='margin-top:10px;'>
    <tr><td>
		<ul>
		  	<li class='menu_01'><a href="<%=basePath%>/manager.jsp">首页</a></li>
	  		<li class='menu'><a href="<%=basePath%>/firstBA.action">贝爱学园</a></li>
	  		<li class='menu'><a href="<%=basePath%>/firstLY.action" >贝爱乐园</a></li>
	  		<li class='menu'><a href="<%=basePath%>/firstEJ.action">贝爱一家</a></li>
			<li class='menu'><a href="<%=basePath%>/firstIGO.action">线上IGO</a></li>
			<%
			if(strUserAcl.indexOf("999")>=0)
			{
				out.println("<li class='menu'><a href='"+basePath+"/sysmanaA.action'>系统管理</a></li>");
			}else
			{
				if(strUserAcl.indexOf("IG509")>=0)
				{
					out.println("<li class='menu'><a href='"+basePath+"/sysmanaG.action'>系统管理</a></li>");
				}else
				{
					if(strUserAcl.indexOf("BA509")>=0)
					{
						out.println("<li class='menu'><a href='"+basePath+"/sysmanaBa.action'>系统管理</a></li>");
					}
				}
			}
			%>
		</ul>
	</td></tr>
	</table>
</td></tr>
</table>
</form>
