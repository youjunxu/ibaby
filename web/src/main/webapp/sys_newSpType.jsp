<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.SpType"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (flagUser==0)
{
%>
	<jsp:forward page="login.jsp" />
<%
}
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaLX.action'><font color='#2F9681'>商品类型</font></a>";
strNav=strNav+" > 新增类型";
SpType sp=(SpType)request.getAttribute("waitEdit_lx");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doSubmit()
{
	var doc=document.form1;
	if (doc.spTypeName.value=='' )
	{
		alert('对不起，请输入各个栏目的内容！')
		return ;
	}
	if (confirm('确认新增吗？'))
	{
		doc.submit();
	}
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
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
	<td width=240>
		<font color='#A9714E' size='5'>商品类型</font>
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
    <%
    if (sp==null)
    {
    	%>
	  	<s:form method="post" action="saveSpType" name="form1" theme="simple" >
	  	<input type=hidden value='' name='zbName' />
	  	<input type=hidden value='' name='zbDw' />
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
   			<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        	<tr>
        	<td align='right' width=20% >商品名称：<font color=#red>*</font>&nbsp;</td>
        	<td align='left'>
	            <INPUT class=form value="" style="WIDTH: 200px" type="text" maxLength=50
				name="spTypeName" minlength="6">        
    	    </td>
        	</tr>
				<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   			<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
			<TR><TD colspan=2 align="center">
			<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
			</TD></TR>
			</table>
		</s:form>
    	<%
    }else
    {
    	%>
	  	<s:form method="post" action="updateSpType" name="form1" theme="simple" >
	  	<input type=hidden name='spTypeId' value='<%=sp.getSpTypeId()%>' />
	  	<input type=hidden value='' name='zbName' />
	  	<input type=hidden value='' name='zbDw' />
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
   			<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        	<tr>
        	<td align='right' width=20% >商品名称：<font color=#red>*</font>&nbsp;</td>
        	<td align='left'>
            <INPUT class=form value="<%=sp.getSpTypeName()%>" style="WIDTH: 200px" type="text" maxLength=50
				name="spTypeName" minlength="6">        
        	</td>
        	</tr>
				<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   			<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
			<TR><TD colspan=2 align="center">
			<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
			</TD></TR>
			</table>
		</s:form>
    	<%
    }
    %>
</td>
</tr>
<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
</table>
</td>
</tr>
</table>
</body>
</html>
