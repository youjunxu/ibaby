<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.TbCity"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer flagAdmin=0;

if (objUser!=null)
{
	if (strUserAcl.indexOf("999")>=0 && flagUser==9)
	{
		flagAdmin=1;
	}
} 
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 省市管理";

TbCity ct=(TbCity)request.getAttribute("waitOpen_cityDoc");
Integer iEdit=(Integer)request.getAttribute("waitOpen_Edit");

if (ct==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
if (iEdit==null)
{
	iEdit=0;
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文章</title>
<link href="'<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script LANGUAGE='Javascript'>
<!--
<%
	if(flagAdmin==1)
	{
%>
function doSubmit()
{
	var doc=document.form1;
	if (doc.ssName.value=='')
	{
		alert('对不起，请输入省份名称！')
		return ;
	}
	doc.submit();
}
function doEdit()
{
	location.href='<%=basePath%>/sysCityOpen.action?flagEdit=1&ggId=<%=ct.getCityId()%>';
}
<%
	}
%>
//-->
</script>
</head>

<body>
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
	<table cellspacing='0' cellpadding="0" border='0' style='width:500px;margin-left:33px;'>
	<tr>
	<td align="right" valign="middle">省份：</td>
	<td align="left" valign="middle" style='font-size:24px;'><%=ct.getSsName()%></td>
	</tr>
	<TR><TD height=8 class=td_dash colspan=2></TD></TR>
	<TR><TD height=12 colspan=2>&nbsp;</TD></TR>
	<TR>
	<td align="right" valign="middle">城市：</td>
	<td align="left" valign="middle" style='font-size:24px;'><%=ct.getCityName()%></td>
	</tr>
	<TR><TD height=8 class=td_dash colspan=2></TD></TR>
	<TR><TD height=12 colspan=2>&nbsp;</TD></TR>
	<%
	if(flagAdmin==1)
	{
%>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD ><input type="button" value='编辑' onClick='doEdit()'></TD></TR>
	<%
	}
	%>
	<TR><TD height=25 >&nbsp;</TD></TR>
	</table>
	<%
	}else
	{
	%>
	  	<s:form method="post" action="updateCity" name="form1" theme="simple" >
  	<input type='hidden' name='cityId' value='<%=ct.getCityId()%>'/>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% ><font face='黑体' size=4>省份:</font></td>
        <td align='left'>
            <INPUT class=form value="<%=ct.getSsName()%>"
			style="WIDTH: 400px" type="text" maxLength=32
				name="ssName" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' ><font face='黑体' size=4>城市:</font></td>
        <td align='left'>
            <INPUT class=form value="<%=ct.getCityName()%>"
			style="WIDTH: 400px" type="text" maxLength=32
				name="cityName" minlength="6">        
		</TD></TR>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
	   	<tr>
	   	<td valign="middle" colspan=2>
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
	   	</td>
	   	</tr>
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

