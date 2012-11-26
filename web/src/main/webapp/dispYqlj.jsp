<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.po.Yqlj"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
List lstMain=(List)request.getAttribute("waitYqlj");
Integer intLmp;
Integer intTmp;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查看信息</title>
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">FIRST</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr >
<td style='background:url(<%=basePath%>images/top_bottom.gif) no-repeat;height:300px;font-size:18px;' >
	<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
	<tr style='height:30px;'>
		<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
		    <table width=100%>
	    	<tr>
	        <td width=20 ></td>
	    	<td align="left" style='font-size:12px;'>
	    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'>首页</a> > 好站链接
			</td>
	    	</tr>
	    	</table>
	    </td>
	</tr>
	<tr style='height:10px;'><td>&nbsp;</td></tr>
	<tr><td align='center' valign='top'>
		<table border="0" cellspacing="0" cellpadding="0" width=700 style='font-size:12px;'>
		<tr style='height:30px;'><td colspan=7></td></tr>
		<tr><td style='text-align:center;font-size:14px;' colspan=7><b>好站链接</b></td></tr>
		<tr style='height:5px;' ><td class=td_dash colspan=7>&nbsp;</td></tr>
		<tr style='height:20px;'><td colspan=7></td></tr>
		<%
		if (lstMain.size()>0)
		{
			for (intLmp=0;intLmp<lstMain.size();intLmp++)
			{
				Yqlj ss=(Yqlj)lstMain.get(intLmp);
				if (intLmp%5==0)
				{
					if (intLmp>0)
					{
						out.print("<tr style='height:20px;'><td colspan=7>11</td></tr>");
					}
					out.print("<tr style='height:40px;'>");
				}else
				{
					out.print("<td width=5% >&nbsp;</td>");
				}
				out.print("<td width=16% valign='middle'>");
				out.print("<table cellspacing=0 cellpadding=0 border=0 width=100% >");
				out.print("<tr>");
				if (ss.getLinkImg()!=null)
				{
					out.print("<td width=30% style='text-align:center;' valign='middle'><img src='"+basePath+"/graph/yqlj/"+ss.getLinkImg()+"' width=20 height=20 /></td>");
				}else
				{
					out.print("<td width=30% ></td>");
				}
				out.print("<td style='text-align:left;font-size:14px;' valign='middle'><a target='_blank' href='http://"+ss.getLjAddr()+"'>"+ss.getLjName()+"</a></td>");
				out.print("</tr></table>");
				out.print("</td>");
				if (intLmp%5==4)
				{
					out.print("</tr>");
				}
			}
			intLmp=5-(lstMain.size()%5);
			if (intLmp<5)
			{
				intTmp=intLmp*21;
				intLmp=intLmp*2;
				out.print("<td colspan="+String.valueOf(intLmp)+" width="+String.valueOf(intTmp)+"% >&nbsp;</td>");
				out.print("</tr>");
			}
			out.print("<tr style='height:20px;'><td colspan=9></td></tr>");
		}
		%>
		</table>
	</td></tr>
	</table>
</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
