<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.TbInbox"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
UserEj uSend=(UserEj)request.getAttribute("waitDisp_rec");
TbInbox tb=(TbInbox)request.getAttribute("waitDisp_doc");
if (objUser==null || uSend==null || tb==null)
{
	%> 
	<jsp:forward page="login.jsp" />
	<%
}
Integer intNew=(Integer)request.getAttribute("sysNewIn_zs");

SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String strLmp="";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE='Javascript'>
function toDel()
{
	var t1='';
	
	if (confirm('确实删除这条信息吗？'))
	{
		t2='<%=basePath%>/deleteMsgByOutbox.action?tip=<%=tb.getXxId()%>';
		location.href=t2;
	}
	return false;
}

</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">INBOX</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td colspan=3></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr >
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >

		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>信箱管理</b></font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' ><img src='<%=basePath%>/images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td ></td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/prevSendNewMsg.action">
    			<font color='#33927E'>写信</font></a>
    			</td></tr>
	    		<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/myInBox.action">
	    		<font color='#33927E'>收件箱&nbsp;&nbsp;(<%=intNew==null?0:intNew%>)</font></a>
	    		</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/myOutBox.action">
    			<font color='#33927E'>发件箱</font></a>
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			</td></tr>
	    		<tr style='height:10px;'><td ></td></tr>
		    	</table>


    		</td>
	    	</tr>
	    	</table>
    	</td>
    	</tr>
    	<tr><td></td></tr>
    	</table>
    </td>
    <td valign='top' align='left'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=90% style='margin-left:30px;'>
		<tr>
		<td align='right' width=100 >接收者：</td>
		<td align='left'>
		<%=uSend.getNickName()%>
		</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=15 colspan=2></TD></TR>
		<tr>
		<td align='right' width=100 >标题：<font color=red>*</font>&nbsp;</td>
		<td align='left'>
		<%=tb.getXxTitle()%>
		</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=15 colspan=2></TD></TR>
		<tr>
		<td align='right' width=100 >发送时间：&nbsp;</td>
		<td align='left'>
		<%
		date=simpleDateFormat.parse(tb.getDtSend());
		strLmp=simpleDateFormat.format(date);
		out.println(strLmp);
		%>
		</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=15 colspan=2></TD></TR>
		<tr>
		<td align='right' >内容：<font color=red>*</font>&nbsp;</td>
		<td align='left'>
		<%=tb.getXxBody()==null?"":tb.getXxBody()%>
		</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=15 colspan=2></TD></TR>
		<TR><TD height=15 colspan=2 align='center'>
		<input type='button' value='删除' onclick='toDel()' />
		</TD></TR>
		<TR><TD height=15 colspan=2></TD></TR>
		</table>
    <!-- 文档区 over-->
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
