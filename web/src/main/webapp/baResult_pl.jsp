<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评论结果</title>
  </head>
  
  <body>
  <%
	String tt="<s:property value='tip' />";
	if (tt.indexOf("登录")>0 || tt.indexOf("失败")>0)
	{
  %>
  <br>  <span><%=tt%></span> <br>
  <%
	}else
	{
  %>
  <br>  <span>非常感谢您的评论，请<a href='<%=basePath%>/firstBA.action'>继续</a>其它文章</span> <br>
  <%
	}
  %>
  </body>
</html>
