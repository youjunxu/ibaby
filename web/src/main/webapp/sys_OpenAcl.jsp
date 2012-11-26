<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.AclInfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
String strFbsj;
String strLmp;
String strTmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;

AclInfo ac=(AclInfo)request.getAttribute("waitOpen_aclDoc");
Integer iEdit=(Integer)request.getAttribute("waitOpen_Edit");

if (ac==null || flagUser!=9)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
if (iEdit==null)
{
	iEdit=0;
}
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
date=simpleDateFormat.parse(ac.getDtAvil());
strFbsj=simpleDateFormat.format(date);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文章</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>

<script LANGUAGE='Javascript'>
<!--
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

	t1=getValueBySelected(doc.aclLevel,"1");
	if (t1=='' || doc.aclDes.value=='')
	{
		alert('对不起，请选择权限！')
		return ;
	}

	if (confirm('确实提交吗？'))
	{
		doc.submit();
	}
}
function doEdit()
{
	location.href='<%=basePath%>/sysAclOpen.action?flagEdit=1&aclId=<%=ac.getAclId()%>';
}
<%
	if (iEdit==1)
	{
%>
function doLoad()
{
	var doc=document.form1;
	var objA=doc.aclLevel;

	for (var i=0; i<objA.length;i++ )
	{
		if (objA.options[i].value=='<%=ac.getAclLevel()%>')
		{
			objA.options[i].selected=true;
			break;
		}
	}
}
<%
	}
%>
//-->
</script>
</head>

<%
	if (iEdit==0)
	{
%>
<body>
<%
	}else
	{
%>
<body onLoad='doLoad()'>
<%
	}
%>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>&nbsp;
    </td>
</tr>
<tr>
<td align=center>
<%
	if (iEdit==0)
	{
%>
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>用户:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
		<%=ac.getUserName()%>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>权限:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
   	 	<%=ac.getAclDes()%>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>模块:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
   	 	<%=ac.getMkName()%>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>备注:</font></td>
        <td align='left'>
			<table width=100% style='margin-left:15px;' >
			<tr><td align=left>
			<%=ac.getStrContent()%>
			</td></tr></table>
		</TD>
		</TR>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<input value="编 辑" type="button" onClick="doEdit()" />
		</TD></TR>
   		<tr><td style='height:20px;' colspan=2>&nbsp;</td></tr>
		</table>
	<%
	}else
	{
	%>
  	<s:form method="post" action="updateAclInfo" name="form1" theme="simple" >
  	<input type='hidden' name='aclId' value='<%=ac.getAclId()%>'/>
  	<input type='hidden' name='aclDes' value='<%=ac.getAclDes()%>'/>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>用户:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
		<%=ac.getUserName()%>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>权限:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
		<%
			strLmp=ac.getAclLevel().toString();
			strTmp=ac.getAclDes();
		%>
   	 	<s:select name='aclLevel' list='#request.waitOpen_aclLevel' listKey='aclLevel' listValue='aclDes' headerKey=' ' headerValue=' ' onchange='doChgLevel()' ></s:select>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>模块:</font></td>
        <td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;
   	 	<%=ac.getMkName()%>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>备注:</font></td>
        <td align='left'>
			<table width=100% style='margin-left:15px;' >
			<tr><td align=left>
			<textarea name='strContent' cols=70 rows="10" ><%=ac.getStrContent()%></textarea></td>
			</td></tr></table>
		</TD>
		</TR>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
   		<tr><td style='height:20px;' colspan=2>&nbsp;</td></tr>
		</table>
	</s:form>
	<%
	}
	%>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>

