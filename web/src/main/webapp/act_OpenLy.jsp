<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.ActLy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer flagAdmin=0;
String strFbsj;
Integer intLmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;

if (objUser!=null)
{
	if (strUserAcl.indexOf("999")>=0 && flagUser==9)
	{
		flagAdmin=1;
	}
}

ActLy sp=(ActLy)request.getAttribute("waitOpen_actLyDoc");

if (sp==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
date=simpleDateFormat.parse(sp.getDtCrea());
strFbsj=simpleDateFormat.format(date);
intLmp=0;
if (objUser!=null)
{
    if(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0){
    	intLmp=1;
    }
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文章</title>
<link href="'<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<%
if (intLmp==1)
{
%>
<script LANGUAGE='Javascript'>
function toDel()
{
	var t1='<%=basePath%>/deleteActLyById.action?lyId=<%=sp.getLyId()%>';
	if (confirm('确实删除此留言吗？'))
	{
		location.href=t1;
	}	
}
</script>
<%
}
%>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">BALY</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>&nbsp;
		<table cellspacing='0' cellpadding="0" border='0' align='center' style='width:700px;margin-top:-10px;'>
		<tr><td align='left'>
			您现在所在的位置：<a href='<%=basePath%>/manager.jsp'>首页</a> > <a href='<%=basePath%>/firstLY.action'>贝爱乐园</a> > 留言
    	</td>
		</tr>
		</table>
    </td>
</tr>
<tr>
<td align=center>
	<table cellspacing='0' cellpadding="0" border='0' style='width:600px;margin-left:33px;'>
	<TR><TD height=30 >&nbsp;</TD></TR>
	<TR><TD style='word-break:break-word;table-layout:fixed;' align=left><%=sp.getLyContent()%></TD></TR>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD height=12 align='left' valign=middle>
	留言者：<%=sp.getNickName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+strFbsj%></TD></TR>
	<%
	if (intLmp==1)
	{
	%>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD height=12 align='center' valign=middle>
	<a href='javascript:toDel()'><font color='#2F9681'>删除</font></a></TD></TR>
	<%	
	}
	%>
	<TR><TD height=25 >&nbsp;</TD></TR>
	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>

