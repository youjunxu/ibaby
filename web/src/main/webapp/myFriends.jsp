<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.GoodFriend"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lstMain=(List)request.getAttribute("waitList_doc");
UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
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
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
<script LANGUAGE='Javascript'>
function toContent(strBj)
{
	var t1='';
	t1='<%=basePath%>/myPersonContent.action?strCurDispLb='+strBj;
	location.href=t1;
}

function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action';
	location.href=t1;
}
function toPersonXx()
{
	var t1='';
	t1='<%=basePath%>/myPersonXx.action';
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/turnSelfHy.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
function toAddHy()
{
	var t1='';
	t1='<%=basePath%>/myPersonAddHy.jsp';
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
   	<td align='left' valign="bottom" style='width:100px;font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">BASEINFO</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td colspan=3></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=95% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr style='width:189px;height:165px;'>
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(<%=basePath%>/images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >
				<s:action name="myPageLeft" executeResult="true" >
					<s:param name="leftMk">HY</s:param>
				</s:action>
    		</td>
	    	</tr>
	    	</table>
    	</td>
    	</tr>
    	<tr>
    	<td></td>
    	</tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
       	<table width=100% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >    
    	<tr style='height:31px;'>
    	<td colspan=17 class=td_dash style='text-align:left;'>
	       	<table border="0" cellspacing="0" cellpadding="0" style='text-align:left;' >    
    	  	<tr style='height:31px;'><td style='background:url(images/btnAl.jpg) no-repeat;width:4px;'></td>
    		<td align='center' valign='middle' width=60 style='background:url(images/btnAm.jpg) repeat-x;'>
	    	<a href='javascript:toAddHy()'><font color='#FFFFFF'>添加好友</font></a>
			</td>
    		<td style='background:url(images/btnAr.jpg) no-repeat;width:4px;'></td>
	    	</tr>
	    	</table>
    	</td></tr>
    	<%
			if(intSize>0)
			{
				for (intLmp=1;intLmp<=lstMain.size();intLmp++)
				{
					GoodFriend gf=(GoodFriend)lstMain.get(intLmp-1);
					if (intLmp%9==1)
					{
						if (intLmp>9)
						{
					    	out.print("<tr style='height:20px;'><td colspan=17></td></tr>");
						}
						out.println("<tr>");
					}
					if (intLmp%9>1)
					{
						out.println("<td style='width:20px'></td>");
					}
					out.println("<td style='width:54px;' align='center'>");
					strLmp="";
					if (gf.getBgzHeadImg()!=null)
					{
						strLmp=basePath+"/graph/net/"+gf.getBgzHeadImg();
					}
					if("".equals(strLmp))
					{
						strLmp=basePath+"/images/nohead.jpg";
					}
					%>
				     	<table width=100% border="0" cellspacing="0" cellpadding="0" >
				     	<tr>
				     	<td><img src='<%=strLmp%>' width=52 height=52 /></td>
				     	</tr>
				     	<tr style='height:20px;'>
				     	<td valign='middle' align='center' >
						<a href='<%=basePath%>/toPersonHome.action?userId=<%=gf.getBgzUserId()%>'><font color='#2F9681' size=3><%=gf.getBgzNickName()%></font></a>
						</td>
				     	</tr>
				     	<tr>
				     	<td align='center' valign='middle'>
				     	<a href='<%=basePath%>/deleteHy.action?gzId=<%=gf.getGzId()%>'>解除好友</a>
				     	</td>
				     	</tr>
				     	</table>
					<%
					out.println("</td>");
					if (intLmp%9==0)
					{
						out.println("</tr>");
					}
				}
				if (intLmp%9>0)
				{
					intTmp=(9-intLmp%9)*2;
					%>
					<td colspan=<%=intTmp%>></td>
					</tr>
					<%
				}
			}
    	%>
    	<tr style='height:20px;'><td colspan=17></td></tr>
    	<tr style='height:20px;'><td colspan=17 style='font-size:12px;'><%=strPageOut%></td></tr>
    	<tr style='height:20px;'><td colspan=17></td></tr>
		</table>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
