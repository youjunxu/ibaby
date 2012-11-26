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
List lstWait=(List)request.getAttribute("waitList_waitA");
Integer intSearchResult=(Integer)request.getAttribute("waitList_waitB");
Integer intWait;

intWait=0;
if (lstWait!=null)
{
	intWait=lstWait.size();
}
if (intSearchResult==null)
{
	intSearchResult=-1;
}
//判断浏览器类型
String strBrowser="";
String agent= request.getHeader("USER-AGENT"); 
strBrowser="MSIE";
if (null != agent && -1 != agent.indexOf("Firefox")) { 
	strBrowser="FIREFOX";
} else if (null != agent && -1 != agent.indexOf("Safari")) { 
	strBrowser="SAFARI";
} else if (null != agent && -1 != agent.indexOf("Chrome")) { 
	strBrowser="CHROME";
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
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
function getPersonWaitHy()
{
	var frm=document.form1;
	var t1=frm.bgzUserName.value;
	var t2='';
	if (t1!='')
	{
		t2='<%=basePath%>/checkPrevAddHy.action?bgzUserName='+t1;
		return getByAjax(t2,"after_checkUserName");
	}
}
function after_checkUserName()
{
	var doc=document.form1;
	var resp=xml_Http.responseText;
	var objT=null;

//	alert(resp);
	eval('objT='+resp);
	if(objT)
	{
		if (objT.tip=='0')
		{
			alert('对不起，此用户不存在！');
		}else
		{
			if (objT.tip=='1')
			{
				alert('对不起，此用户已经是您的好友！');
			}else
			{
				doc.bgzUserId.value=objT.dstJsp;
			}
		}
	}
}
function doSubmit()
{
	var frm=document.form1;
	var t1='';
	if (frm.bgzUserName.value=='')
	{
		alert('对不起，请输入待增加好友的用户名信息！');
		return;
	}
	t1='<%=basePath%>/addMemberHy.action?bgzUserName='+frm.bgzUserName.value+'&bgzUserId='+frm.bgzUserId.value;
	location.href=t1;
}
function doFindUser()
{
	var frm=document.form1;
	
	if (frm.nickName.value=='')
	{
		alert('对不起，请输入待搜索的用户昵称！');
		return;
	}
	frm.action='<%=basePath%>/findUserForAddHy.action';
	frm.method='POST';
	frm.submit();
}
function doAddhyByNc(sid,sname)
{
	t1='<%=basePath%>/addMemberHy.action?bgzUserName='+sname+'&bgzUserId='+sid;
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
					<s:param name="leftMk"></s:param>
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
    <td valign='top' align='center'>
    <!-- 文档区 -->
	    <form name='form1'>
	    <input type=hidden name='bgzUserId' value='' />
       	<table width=500 border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >    
    	<tr style='height:25px;'><td colspan=3 class=td_dash align='left' bgcolor='#EFEFEF'><b>&nbsp;添加好友</b></td></tr>
    	<tr style='height:30px;'>
    	<%
    	if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
    	{
        	%>
        	<td class=td_dash style='width:150px;text-align:right;' valign='middle'>好友用户名：</td>
        	<td class=td_dash style='width:200px;text-align:left;' valign='middle' ><input type=text class=form name='bgzUserName' value='' onBlur="getPersonWaitHy()"/></td>
        	<td class=td_dash style='width:150px;text-align:left;' valign='middle' ><input type='button' value='加为好友' onclick='doSubmit()' /></td>
    		</tr>
    		<tr style='height:30px;'>
    		<td class=td_dash style='text-align:right;' valign='middle'>按昵称搜索用户：</td>
    		<td class=td_dash style='text-align:left;' valign='middle' ><input type=text class=form name='nickName' value='' /></td>
    		<td class=td_dash valign='middle' style='text-align:left;'><input type='button' value='搜索' onclick='doFindUser()' /></td>
	    	</tr>
    		<%
    	}else
    	{
        	%>
        	<td class=td_dash style='width:150px;text-align:right;' valign='middle' >好友用户名：</td>
        	<td class=td_dash style='width:200px;text-align:left;' valign='middle' ><input type=text class=form name='bgzUserName' value='' onBlur="getPersonWaitHy()"/></td>
        	<td class=td_dash style='width:150px;text-align:left;' valign='middle' ><input type='button' value='加为好友' onclick='doSubmit()' /></td>
	    	</tr>
    		<tr style='height:30px;'>
    		<td class=td_dash style='text-align:right;' valign='middle'>按昵称搜索用户：</td>
    		<td class=td_dash style='text-align:left;' valign='middle' ><input type=text class=form name='nickName' value='' /></td>
    		<td class=td_dash style='text-align:left;' valign='middle' ><input type='button' value='搜索' onclick='doFindUser()' /></td>
    		</tr>
    		<%
    	}
    	%>
    	<tr style='height:5px;'><td colspan=3 >&nbsp;</td></tr>
    	<%
   		if (intSearchResult>-1)
   		{
   			%>
       		<tr style='height:20px;'>
       		<%
       		if (intSearchResult==0)
   		   	{
   			%>
       		<td valign='middle' colspan=3 align='left'>搜索结果：<font color=red>未找到符合条件的用户信息！</font>
       		<%
   		   	}else
   		   	{
   			%>
       		<td valign='middle' colspan=3 align='left'>搜索结果：<font color=red>（单击以下用户名可以直接添加好友！）</font>
       		<%
   		   	}
   			%>
       		</td></tr>
   			<tr><td colspan=3 align='left'>
           		<table width=500 border="0" cellspacing="0" cellpadding="0"  >
   			<%
   			for (intLmp=0;intLmp<intWait;intLmp++)
   			{
   				UserInfo uo=(UserInfo) lstWait.get(intLmp);
   				if (intLmp%4==0)
   				{
   					out.print("<tr style='height:22px;'>");
   				}
   				out.print("<td width=25% align='center' valign='middle' ><a href=\"javascript:doAddhyByNc('"+String.valueOf(uo.getUserId())+"','"+uo.getUserName()+"')\">"+uo.getUserName()+"</a></td>");
   				if (intLmp%4==3)
   				{
   					out.print("</tr>");
   				}
   			}
   			intLmp=4-intWait%4;
   			if (intLmp>0)
   			{
				out.print("<td colspan="+String.valueOf(intLmp)+"></td></tr>");
   			}
   			%>
    			</table>
   			</td></tr>
    		<%
    	}
    	%>
    	<tr style='height:10px;'><td colspan=3 >&nbsp;</td></tr>
		</table>
		</form>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
