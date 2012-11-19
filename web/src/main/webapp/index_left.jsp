<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserEj" %>
<%@ page import="com.lhq.prj.bms.po.UserInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");

List ul=(List) request.getAttribute("waitDispEj");
Integer intLmp=0;
Integer intTmp=0;
String strHomePath=basePath+"/graph/net/";
String strLmp;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
	<table border="0" cellspacing="0" cellpadding="0" width=492 height=100% >
	<%
	if (ul.size()>0)
	{
		for (intLmp=0;intLmp<ul.size();intLmp++)
		{
			UserEj ej=(UserEj) ul.get(intLmp);
			if (intLmp%3==0)
			{
				if (intLmp>0)
				{
					%>
					<tr style='height:30px;'><td colspan=5></td></tr>
					<%
				}
			%>
			<tr><td width=144 height=144 >
			<%
			}else
			{
				%>
				<td width=20>&nbsp;</td><td width=144 height=144 >
				<%
			}
			%>
				<table border="0" cellspacing="0" cellpadding="0" width=146 height=100% >
				<%
				strLmp=basePath+"/images/nohead.jpg";
				if (ej.getIntTxsh()!=null)
				{
					if (ej.getIntTxsh()==1)
					{
						if (ej.getSyPhoto()!=null)
						{
							if (!"".equals(ej.getSyPhoto()))
							{
								strLmp=strHomePath+ej.getSyPhoto();
							}
						}
					}
				}
				%>
				<tr><td width=144 height=144 ><img src="<%=strLmp%>" width=146 height=144 /></td>
			    <tr valign='middle' style='height:23px;'>
			    <td width=144 align='center' style='background-Color:#56b1a8;' >
			<%
			if (objUser==null)
			{
				%>
				<a href="<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>"><font color=white><%=ej.getEjName()==null?ej.getNickName():ej.getEjName()%></font></a>
				</td></tr></table>
				<%
			}else
			{
				if (ej.getUserId().equals(objUser.getUserId()))
				{
				%>
				<a href="<%=basePath%>/toMyHome.action"><font color=white><%=ej.getEjName()==null?ej.getNickName():ej.getEjName()%></font></a>
				</td></tr></table>
				<%
				}else
				{
				%>
				<a href="<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>"><font color=white><%=ej.getEjName()==null?ej.getNickName():ej.getEjName()%></font></a>
				</td></tr></table>
				<%
				}
			}
			%>
			</td>
			<%
			if (intLmp%3==2)
			{
			%>
			</tr>
			<%
			}
		}
		intTmp=3-(ul.size()%3);
		if (intTmp!=3)
		{
			%>
			<td colspan=<%=intTmp*2%> ></td></tr>
			<%
		}
	}
	%>
	</table>
	