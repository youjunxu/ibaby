<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strHomePath=basePath+"/graph/net/";

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lstMain=(List)request.getAttribute("waitList_baej");
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
Integer intPageLine=9;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="css/style1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/validate.js"></script>
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
<script LANGUAGE='Javascript'>
function toPersonHome(sid)
{
	var t1='';
	<%
	if (objUser==null)
	{
		%>
		t1='<%=basePath%>/toPersonHome.action?userId='+sid;
		<%
	}else
	{
		%>
		if (sid=='<%=objUser.getUserId()%>')
		{
			t1='<%=basePath%>/toMyHome.action';
		}else
		{
			t1='<%=basePath%>/toPersonHome.action?userId='+sid;
		}
		<%
	}
	%>
	location.href=t1;
}
function doInPerson()
{
	var t1='';
	t1='<%=basePath%>/toMyHome.action';
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/firstEJ.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
function toOpenDoc(slx,sid)
{
	var t1='';
	if (slx=='BA')
	{
		t1='<%=basePath%>/prevOpenBADoc.action?baId='+sid;
		location.href=t1;
	}
	if (slx=='ZZ')
	{
		t1='<%=basePath%>/prevOpenZZDoc.action?zzId='+sid;
		location.href=t1;
	}
}

</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:70px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;' >
	    <table width=100% border="0" cellspacing="0" cellpadding="0" >
    	<tr>
        <td style='width:15px;'></td>
    	<td align="left" width=70% style='font-size:20px;' >
    	<font color='#248D93'><b>我说我家</b></font>
		</td>
    	<td align='right'>
    	<a href='javascript:doInPerson()' ><img src="<%=basePath%>/images/wdj.jpg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
    	</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr><td align="left">
	<table border="0" cellspacing="0" cellpadding="0" width=98% style="margin-left:15px;">
	<%
	if (lstMain.size()>0)
	{
		for (intLmp=0;intLmp<lstMain.size();intLmp++)
		{
			if (intLmp==0)
			{
	%>
	<tr style='height:5px;'>
	<td colspan=5>&nbsp;</td>
	</tr>
	<tr style='height:235px;'>
	<td style='width:294px;background:url(<%=basePath%>/images/homeback.gif) no-repeat;' align='left' >
	<%
			}
			if (intLmp==3 || intLmp==6)
			{
	%>
	<tr style='height:235px;'>
	<td style='width:294px;background:url(<%=basePath%>/images/homeback.gif) no-repeat;' align='left' >
	<%
			}
			if (intLmp==1 || intLmp==2 || intLmp==4 || intLmp==5 || intLmp==7 || intLmp==8)
			{
	%>
	<td style='width:10px;'>&nbsp;</td>
	<td style='width:294px;background:url(<%=basePath%>/images/homeback.gif) no-repeat;'>
	<%
			}
			UserEj ll=(UserEj) lstMain.get(intLmp);
			strLmp=basePath+"/images/nohead.jpg";
			if (ll.getIntTxsh()!=null)
			{
				if (ll.getIntTxsh()==1)
				{
					if (ll.getSyPhoto()!=null)
					{
						if (!"".equals(ll.getSyPhoto()))
						{
							strLmp=strHomePath+ll.getSyPhoto();
						}
					}
				}
			}
		%>
		<table border="0" cellspacing="0" cellpadding="0" style="width:290px;" height=100% >
		<tr style='height:5px;'><td colspan=2></td></tr>
		<tr>
		<td align="right" valign="middle" style='width:120px;height:115px;'>
		<img src='<%=strLmp%>' class='hmgimg' width=113 height=113 />
		</td>
		<td valign="top" >
			<table border="0" cellspacing="0" cellpadding="0" width=100% >
			<tr style='height:20px;'>
			<td align="center" valign="middle" style='width:43px;background:url(<%=basePath%>/images/home_mc.gif) left no-repeat;'>
			<font color='#FFFFFF'>家名</font></td>
			<td style='font-family:黑体;font-weight:bold;font-size:12px;'>
 			&nbsp;&nbsp;<a href="javascript:toPersonHome('<%=ll.getUserId()%>')"><font face='黑体'><b><%=ll.getEjName()==null?ll.getNickName():ll.getEjName()%></b></font> </a>
			&nbsp;&nbsp;
			</td>
			</tr>
			<tr style='height:20px;'>
			<td align="center" valign="middle" style='background:url(<%=basePath%>/images/home_xy.gif) left no-repeat;'>
			<font color='#FFFFFF'>心愿</font></td>
			<td>&nbsp;</td>
			</tr>
			<tr style='height:75px;'>
			<td colspan=2 align="center" valign="top">
				<table border="0" cellspacing="0" cellpadding="0" width=90% style='margin-top:5px;'>
				<tr><td align="left" style='nowrap:always;line-height:20px;font-size:12px;font-fmaily:宋体;'>
				<font color="#D1992C"><%=ll.getHomeXy()==null?"":ll.getHomeXy()%></font>
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
		</td>
		</tr>
		<tr style='height:90px;'>
		<td colspan=2 align="center" valign='top'>
			<%
			List ldoc=ll.getUserDocList();
			if (ldoc!=null)
			{
				if (ldoc.size()>0)
				{
				%>
				<table border="0" cellspacing="0" cellpadding="0" width=90% >
				<%
					for (intTmp=0;intTmp<ldoc.size();intTmp++)
					{
						EjDocuments edoc=(EjDocuments)ldoc.get(intTmp);
						%>
						<tr style='height:26px;'>
						<td align="left" valign='middle'>
						<img src='<%=basePath%>/images/index_icon_20.gif'/>&nbsp;&nbsp;
						<a href="javascript:toOpenDoc('<%=edoc.getDocType()%>','<%=edoc.getDocId()%>')"><font color='#7B807C'><%=edoc.getStrTitle()%></font></a>
						</td>
						</tr>
					<%
					}
					%>
						</table>
					<%
				}
			}
			%>
		</td>
		</tr>
		</table>
	</td>
		<%
			if (intLmp==2 || intLmp==5 || intLmp==8)
			{
				out.print("</tr>");
			}
		}
		if (lstMain.size()%3==1)
		{
			%>
			<td style='width:10px;'>&nbsp;</td>
			<td style='width:294px;'></td>
			<td style='width:10px;'>&nbsp;</td>
			<td style='width:294px;'></td>
			</tr>
			<%
		}else
		{
			if (lstMain.size()%3==2)
			{
				%>
				<td style='width:10px;'>&nbsp;</td>
				<td style='width:294px;'></td>
				</tr>
				<%
			}
		}
	}

	%>
	<tr style='height:20px;'>
	<td colspan=5>&nbsp;</td>
	</tr>
	</table>

</td></tr>
<tr>
<td align='center' valign='middle' style='font-size:12px;'>
<%=strPageOut%>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
