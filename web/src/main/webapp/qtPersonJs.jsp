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
List lstMain=(List)request.getAttribute("sysList_disp");
UserEj ej=(UserEj)request.getSession().getAttribute("waitListA_ej");
String strLb=(String)request.getAttribute("sysLb_disp");
String strLmp;
String[] objBq;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
Integer intLsize;

//页码等信息
Integer intBSize=(Integer)request.getAttribute("sysCountB_disp");
Integer intCSize=(Integer)request.getAttribute("sysCountC_disp");
Integer intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
if (intPageZs==null) intPageZs=0;
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=9;

if (strLb==null)
{
	strLb="BA";
}
if (strLb.equals("BA"))
{
	intSize=intBSize;
}else
{
	intSize=intCSize;
}
if (intSize==null) intSize=0;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/mask.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<style type="text/css">
#idAaBack{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%; height: 100%;  background-color: gray;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
#idBaBack{ display: none;  position: absolute;  top: 28%; left: 36%; width: 350;  height: 300;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>
<script LANGUAGE='Javascript'>
function toContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}

function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/oPersonPhoto.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/oPersonContent.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i+'&userId=<%=ej.getUserId()%>';
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
function toOpenQtjs(sacl,sid)
{
	var t1='<%=basePath%>/prevOpenQtJsDoc.action?jsId='+sid;
	var doc=document.frm0;
	var objB=null;
	var objA=null;
	if (parseInt(sacl)==2)
	{
		objA=document.getElementById('idAaBack');
		objB=document.getElementById('idBaBack');
		objA.style.display='block';
		objB.style.display='block';
		doc.sid.value=sid;
	}else
	{
		if (parseInt(sacl)==1)
		{
			window.open(t1);
		}else
		{
			alert('非法操作！');
		}
	}
}
function toCheckAPs()
{
	var objB=null;
	var objA=null;
	objA=document.getElementById('idAaBack');
	objB=document.getElementById('idBaBack');
	objA.style.display='none';
	objB.style.display='none';
}
function toCheckPs()
{
	var doc=document.frm0;
	var t1='';
	var t2='';
	
	t2=doc.pas.value;
	if (t2=='' )
	{
		alert('请输入查看密码！');
		return ;
	}

	t1='<%=basePath%>/checkHomeJsAcl.action?jsId='+doc.sid.value+'&docPass='+t2;
	getByAjax(t1,"after_toPsA('"+doc.sid.value+"')");
}
function after_toPsA(sid)
{
	var resp=xml_Http.responseText;
	var t1='<%=basePath%>/prevOpenQtJsDoc.action?jsId='+sid;
	var objM=null;
	
	eval('objM='+resp);
	if (objM)
	{
		if (objM.dstJsp=='yes')
		{
			window.open(t1);
		}else
		{
			alert(objM.tip);
		}
	}else
	{
		alert('系统错误！');
	}
	doc.pas.value='';
	doc.sid.value='';
	toCheckAPs();
}

</script>
</head>
<body>
<div  width=350 height=200 id='idAaBack' ></div>
<div  width=350 height=200 id='idBaBack' >
<form name="frm0">
<table border="0" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" width=300 align="center">
	<tr style='height:20px;'><td></td></tr>
	<tr><td>请输入本文档查看密码：</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='password' name='pas' value='' size=10 />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='button' value='提交' onclick='toCheckPs()' />
	&nbsp;&nbsp;<input type='button' value='放弃' onclick='toCheckAPs()' />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	</table>
	<input type=hidden name="sid" value='' />
</form>
</div>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<%
	if (ej.getPhotoStatus().equals(1))
	{
	%>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
   	<td align='left' valign="bottom" style='font-size:14px;' >
   	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
   	<a href='javascript:toGrPhoto()'><font color='#2F9681'>制造记忆</font></a>
   	</td>
	<%
	}else
	{
	%>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
	<%} %>
   	
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
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toContent()"><font color='#33927E'>贝爱学园</font></a>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intBSize.toString()%>)</td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<font color='#7A7A84'>博文记事</font>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intCSize.toString()%>)</td></tr>
	    		<tr style='height:40px;' ><td colspan=3></td></tr>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
		    	</table>
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
    	<%
    	if (lstMain.size()>0)
    	{
    		%>
    		<table border='0' cellspacing='0' cellpadding='0' width=95% style='margin-left:30px;' >
    		<tr style='height:5px;'><td colspan=4></td></tr>
    		<%
    		for (intLmp=0;intLmp<lstMain.size();intLmp++)
    		{
    			HomeJs ed=(HomeJs)lstMain.get(intLmp);
    			if (intLmp>0)
    			{
    				%>
        			<tr style='height:40px;'>
        			<td colspan=4></td>
    				</tr>
		    		<%
    			}
				%>
	    			<tr>
	    			<td style='width:500px;' colspan=4>
					<a href="javascript:toOpenQtjs(<%=ed.getDocLevel()%>,<%=ed.getJsId()%>)" ><font color='#219F91' size=+2><%=ed.getJsTitle()%></font></a>
					<%
					date=simpleDateFormat.parse(ed.getDtCrea());
					strFbsj=simpleDateFormat.format(date);
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<font color='#D7D1D3' size=-2>"+strFbsj+"</font>");
					%>
					</td>
					</tr>
		    		<tr style='height:20px;'><td colspan=4></td></tr>
	    			<tr>
	    			<%
						out.println("<td style='width:160px;'>类型：<font color='#228A8B'>萌言萌事</font></td>");
					%>
					<td align='left' colspan=3>
					<%=ed.getStrContent()%>
    	 		</td>
    	   		</tr>
		<%
    		}
			out.println("<tr style='height:40px;'>");
			out.println("<td colspan=4></td>");
			out.println("</tr>");
			out.println("<tr style='height:40px;'>");
			out.println("<td colspan=4 align='center' style='font-size:12px;'>"+strPageOut+"</td>");
			out.println("</tr>");
			out.println("<tr style='height:30px;'>");
			out.println("<td colspan=4></td>");
			out.println("</tr>");
    		out.println("</table>");
    	}
    	%>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
