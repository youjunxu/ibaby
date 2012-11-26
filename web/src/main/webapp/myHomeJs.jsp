<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.HomeJs"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lsIn=(List)request.getAttribute("waitDisp_js");
UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String strLmp;
Integer intBSize=(Integer)request.getAttribute("waitDisp_ba");
//页码等信息
Integer intSize=(Integer)request.getAttribute("sysCount_zs");
if (intSize==null) intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=10;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='Javascript'>
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/myPersonPhoto.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
	location.href=t1;
}
function toTurnPage()
{
	var doc=document.frmTurnPage;
	var t1=doc.ipg.value;

	if (t1=='')
	{
		alert('请输入欲跳转的页数！');
		return false;
	}
	if (!checkIsNumber(doc.ipg))
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	if (parseInt(t1)==0 || parseInt(t1)><%=intPageZs%>)
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	toPage(t1);
}
function toDel(sid)
{
	var t1='';
	
	if (confirm('确实删除这条文档吗？'))
	{
		t1='<%=basePath%>/deleteHomeJsById.action?jsId='+sid;
		location.href=t1;
	}
	return false;
}
function toNew()
{
	var t1='<%=basePath%>/prevNewHomeJs.action';
	location.href=t1;
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
			<s:param name="topMk">HOMEJS</s:param>
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
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(<%=basePath%>/images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >
		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td style='width:80px;' align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>目录分类</b></font>
    			</td>
    			<td style='width:25px;'>&nbsp;</td>
    			<td align='center' style='width:30px;' ><font color='#FE8F1C'>管理</font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='<%=basePath%>/images/content.gif' /></td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toContent('BA')"><font color='#33927E'>贝爱学园</font></a>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intBSize.toString()%>)</td></tr>
	    		<tr><td>
	    			<font color='#7A7A84'>&nbsp;&nbsp;&nbsp;&nbsp;博文记事</font>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intSize.toString()%>)</td></tr>
	    		<tr style='height:40px;' ><td colspan=3></td></tr>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
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
    <form>
    	<table border="0" cellspacing="0" cellpadding="0" width=90% style='margin-left:30px;'>
   		<tr style='height:10px;' ><td colspan=4></td></tr>
		<tr>
		<td width=100 ></td>
		<td style='text-align:center;' width=60% >标  题</td>
		<td style='text-align:center;' >发件时间</td>
		<td style='text-align:center;' >功能</td>
		</tr>
   		<tr style='height:5px;' ><td colspan=4 class=td_dash></td></tr>
		<%
		if (intSize>0)
		{
			for (intLmp=0;intLmp<lsIn.size();intLmp++)
			{
				HomeJs tb=(HomeJs)lsIn.get(intLmp);
				out.println("<tr style='height:30px;'><td></td>");
				date=simpleDateFormat.parse(tb.getDtCrea());
				strLmp=simpleDateFormat.format(date);

				%>
				<td>&nbsp;&nbsp;<a href="<%=basePath%>/prevOpenHomeJs.action?jsId=<%=tb.getJsId()%>" target='_blank'><%=tb.getJsTitle()%></a></td>
				<%
				out.println("<td align='center'>"+strLmp+"</td>");
				%>
				<td align='center'>
				<input type='button' value='删除' onclick="toDel('<%=tb.getJsId()%>')" />
				</td>
				<%
				out.println("</tr>");
		   		out.println("<tr style='height:5px;' ><td colspan=4 class=td_dash></td></tr>");
			}
	   		out.println("<tr style='height:10px;' ><td colspan=4></td></tr>");
		}else
		{
	   		out.println("<tr style='height:30px;' ><td colspan=4></td></tr>");
		}
		%>
   		<tr style='height:20px;' ><td colspan=4>
	    	<table border="0" cellspacing="0" cellpadding="0" >
	    	<tr>
	    	<td width=100><input type='button' value='新增记事' onclick='toNew()' /></td>
	    	<td align='center' style='font-size:12px;'>
		<%
		if (!strPageOut.equals(""))
		{
			out.println(strPageOut);
		}
		%>
	   		</td></tr>
			</table>
   		</td></tr>
   		<tr style='height:20px;' ><td colspan=4></td></tr>
		</table>
		</form>
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
