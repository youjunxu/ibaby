<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.po.SysSearch"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String sc=(String)request.getAttribute("waitList_cond");
List lstMain=(List)request.getAttribute("waitList_result");
Integer intLmp;
Integer intTmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
String strFbsj;
String strLmp;

//页码等信息
Integer intSize=(Integer)request.getAttribute("sysCount_disp");
if (intSize==null) intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=20;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>查看信息</title>
	<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='Javascript'>
function doOpen(strLb,strId)
{
	var t1='<%=basePath%>/prevOpenBACXDoc.action?baId='+strId;
	var t2='<%=basePath%>/prevOpenActXx.action?actId='+strId;
	if (strLb=='BA')
	{
		location.href=t1;
	}
	if (strLb=='LY')
	{
		location.href=t2;
	}
}
function toPage(strP)
{
	var i=0;
	var t1='';
	var doc=document.frmS;
	
	doc.strBaCond.value='<%=sc%>';
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	doc.limit.value='<%=intPageLine%>';
	doc.start.value=i;
	doc.pCur.value=strP;

	doc.submit();
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
function doSearchA()
{
	var t1='';
	var objA=document.frmSearchA.strBaCond;

	if (objA.value=='')
	{
		alert('对不起，请输入查询条件！');
		return;
	}
	document.frmSearchA.submit();
}

</script>
  </head>
  
  <body>
   	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">FIRST</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr >
<td style='background:url(<%=basePath%>images/top_bottom.gif) no-repeat;height:300px;font-size:18px;' >
	<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
	<tr><td align='center' valign='top'>
		<table border="0" cellspacing="0" cellpadding="0" width=70% >
		<tr style='height:30px;'><td colspan=5></td></tr>
		<tr style='height:25px;'>
		<td colspan=5 style='text-align:right;font-size:12px;' valign=middle>
	<form method='post' name='frmSearchA' action='searchSysDoc.action'>
		<input name="strBaCond" type="text" size=70 />&nbsp;&nbsp;<a href='javascript:doSearchA()' >重新搜索</a>
	</form>
		</td>
		</tr>
		<tr style='height:10px;'><td colspan=5></td></tr>
		<tr style='height:25px;'><td colspan=5 style='text-align:center;font-size:14px bold;'>搜索结果</td></tr>
		<tr style='height:10px;'><td colspan=5 class=td_dash></td></tr>
		<tr style='height:10px;'><td colspan=5></td></tr>
		<tr style='height:25px;font-size:13px;'>
			<td width=10% style='text-align:center;'>序号</td>
			<td width=50% style='text-align:center;'>主题名称</td>
			<td width=15% style='text-align:center;'>所属模块</td>
			<td width=15% style='text-align:center;'>发布人</td>
			<td width=10% style='text-align:center;'>发布时间</td>
		</tr>
		<%
		if (lstMain.size()>0)
		{
			for (intLmp=0;intLmp<lstMain.size();intLmp++)
			{
				SysSearch ss=(SysSearch)lstMain.get(intLmp);
				intTmp=(intPageCur-1)*intPageLine;
				strLmp=String.valueOf(intTmp+intLmp+1);
				out.print("<tr style='height:25px;font-size:13px;'>");
				out.print("<td style='text-align:center;' class=td_dash >"+strLmp+"</td>");
				if ("BA".equals(ss.getStrDocType()))
				{
					out.print("<td style='text-align:left;' class=td_dash ><a href=\"javascript:doOpen('BA','"+ss.getDocId()+"')\">"+ss.getStrTitle()+"</a></td>");
					out.print("<td style='text-align:center;' class=td_dash ><a href='"+basePath+"/firstBA.action' />贝爱学园</a></td>");
				}else
				{
					out.print("<td style='text-align:left;' class=td_dash ><a href=\"javascript:doOpen('LY','"+ss.getDocId()+"')\">"+ss.getStrTitle()+"</a></td>");
					out.print("<td style='text-align:center;' class=td_dash ><a href='"+basePath+"/firstLY.action' />贝爱乐园</a></td>");
				}
				if (ss.getNickName().equals("系统管理员"))
				{
					out.print("<td style='text-align:center;' class=td_dash >"+ss.getNickName()+"</td>");
				}else
				{
					out.print("<td style='text-align:center;' class=td_dash ><a href='"+basePath+"/toPersonHome.action?userId="+ss.getUserId()+"'>"+ss.getNickName()+"</a></td>");
				}
				date=simpleDateFormat.parse(ss.getDtCrea());
				strFbsj=simpleDateFormat.format(date);
				out.print("<td style='text-align:center;' class=td_dash >"+strFbsj+"</td>");
				out.print("</tr>");
			}
			%>
			<tr style='height:30px;'><td colspan=5></td></tr>
			<%
			if (strPageOut!=null && !"".equals(strPageOut))
			{
			%>
			<tr style='height:30px;'><td colspan=5 style='font-size:12px;'><%=strPageOut%></td></tr>
			<%
			}
		}else
		{
			%>
			<tr style='height:30px;'><td colspan=5 style='font-size:12px;text-align:left;'>没有找到符合搜索条件的内容！</td></tr>
			<%
		}
		%>
		</table>
	</td></tr>
	</table>
</td></tr>
</table>
<form name='frmS' method='post' action='searchSysDoc.action'>
<input type=hidden name='limit' value=''/>
<input type=hidden name='start' value=''/>
<input type=hidden name='pCur' value='<%=intPageCur%>'/>
<input type=hidden name='strBaCond' value='<%=sc%>'/>
</form>
</body>
</html>
<s:include value='footer.jsp'></s:include>
