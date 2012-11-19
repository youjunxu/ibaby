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
if (objUser==null || flagUser==0)
{
%>
	<jsp:forward page="login.jsp" />
<%
}
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

	if (doc.jyTitle.value=='' || doc.strContent.value=='')
	{
		alert('对不起，请输入主题及内容！')
		return ;
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
		<s:param name="strCurMkCode"></s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'>首页</a> > <a href='<%=basePath%>/prevTsjyIndex.action'>投诉与建议</a> > 我要留言
		</td>
    	</tr>
    	</table>
    </td>
</tr> 
<tr>
<td style='height:40px;'>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%;margin-left:60px;'>
	<tr>
	<td valign='middle' align="left">
		<font color='#219195' size='5'>我要留言</font>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td align="left">
  	<s:form method="post" action="saveTsjy" name="form1" theme="simple" >
		<table cellspacing='0' cellpadding="0" border='0' style='width:750px;margin-top:20px;margin-left:50px;'>
        <tr>
        <td align='right' width=7% style='font-color:#7F7F7F;'>标题:</td>
        <td align='left'>&nbsp;&nbsp;
		<INPUT class=form value="" autocomplete="off" style="WIDTH: 300px" maxLength=50 name="jyTitle">
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr> 
        <tr>
        <td align='right' style='font-color:#7F7F7F;'>姓名:</td>
        <td align='left'>&nbsp;&nbsp;<%=objUser.getNickName()%>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' style='font-color:#7F7F7F;'>内容:</td>
        <td align='left'>&nbsp;&nbsp;
			<textarea name='strContent' cols=70 rows="15" style='overflow-y:auto;overflow-x:auto;'></textarea>
		</TD>
		</TR>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD></td><td align="left" valign="middle">&nbsp;&nbsp;
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
	</s:form>
</td>
</tr>
<tr style='height:1px;'><td >&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
