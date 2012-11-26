<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

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
strNav=strNav+" > <a href='"+basePath+"/sysmanaC.action'><font color='#2F9681'>权限管理</font></a>";
strNav=strNav+" > 新增权限";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doChgMk()
{
	var doc=document.form1;
	var t1=getValueBySelected(doc.mkCode,"1");
	doc.mkName.value=t1;
}
function doChgLevel()
{
	var doc=document.form1;
	var t1=getValueBySelected(doc.aclLevel,"1");
	doc.aclDes.value=t1;
}
function doSubmit()
{
	var doc=document.form1;
	var t1='';

	if (doc.userName.value=='')
	{
		alert('对不起，请输入用户名！')
		return ;
	}
	t1=getValueBySelected(doc.aclLevel,"1");
	if (t1=='' || doc.aclDes.value=='')
	{
		alert('对不起，请选择权限！')
		return ;
	}
	if (doc.aclDes.value!='系统管理员')
	{
		if (doc.mkCode.value=='' || doc.mkName.value=='')
		{
			alert('对不起，请选择所在模块！')
			return ;
		}
	}
	if (confirm('确实提交吗？'))
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
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>
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
	<td width=20%>
		<font color='#A9714E' size='5'>权限管理</font>
	</td>
    <td valign="bottom">&nbsp;<img src='images/top_bottom.gif' width=90%/></td>
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
  	<s:form method="post" action="saveAclInfo" name="form1" theme="simple" >
  	<input type='hidden' name='mkName' value=''/>
  	<input type='hidden' name='aclDes' value=''/>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>用户:</font></td>
        <td align='left'>
		<INPUT class=form value="" autocomplete="off" style="WIDTH: 250px" maxLength=28 name="userName">
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>权限:</font></td>
        <td align='left'>
   	 	<s:select name='aclLevel' list='#request.addAcl_acl' listKey='aclLevel' listValue='aclDes' headerKey='' headerValue=' ' onchange='doChgLevel()' ></s:select>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>模块:</font></td>
        <td align='left'>
   	 	<s:select name='mkCode' list='#request.addAcl_mk' listKey='mkCode' listValue='mkName' headerKey='' headerValue=' ' onchange='doChgMk()' ></s:select>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>备注:</font></td>
        <td align='left'>
			<textarea name='strContent' cols=70 rows="10" ></textarea></td>
		</TD>
		</TR>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
	</s:form>
	</td>
	</tr>
	<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
