<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String strMk=(String)request.getAttribute("leftmk");
%>
		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>个人资料</b></font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' ><img src='images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td ></td></tr>
	    		<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("BASE".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>基本信息</font>
	    		<%	
	    		}else
	    		{
	    		%>
	    		<a href="<%=basePath%>/myPersonXx.action"><font color='#33927E'>基本信息</font></a>
	    		<%	
	    		}
	    		%>
	    		</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("EHOME".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>e家资料</font>
	    		<%	
	    		}else
	    		{
	    		%>
    			<a href="<%=basePath%>/myPersonEj.jsp"><font color='#33927E'>e家资料</font></a>
	    		<%	
	    		}
	    		%>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("HEAD".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>头像管理</font>
	    		<%	
	    		}else
	    		{
	    		%>
    			<a href="<%=basePath%>/upHeadImg.jsp"><font color='#33927E'>头像管理</font></a>
	    		<%	
	    		}
	    		%>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("XGMM".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>修改密码</font>
	    		<%	
	    		}else
	    		{
	    		%>
    			<a href="<%=basePath%>/changePass.jsp"><font color='#33927E'>修改密码</font></a>
	    		<%	
	    		}
	    		%>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("JFXX".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>积分信息</font>
	    		<%	
	    		}else
	    		{
	    		%>
    			<a href="<%=basePath%>/myJfxx.action"><font color='#33927E'>积分信息</font></a>
	    		<%	
	    		}
	    		%>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
	    		<%
	    		if ("HY".equals(strMk))
	    		{
	    		%>
	    		<font color='#7A7A84'>好友管理</font>
	    		<%	
	    		}else
	    		{
	    		%>
    			<a href="<%=basePath%>/turnSelfHy.action"><font color='#33927E'>好友管理</font></a>
	    		<%	
	    		}
	    		%>
    			</td></tr>
	    		<tr style='height:10px;'><td ></td></tr>
		    	</table>
