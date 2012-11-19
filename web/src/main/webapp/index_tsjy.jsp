<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.Tsjy"%>
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
Integer intLmp;
Integer intTmp;

SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

List ls=(List)request.getAttribute("sysList_disp");

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
<title>投诉建议</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doWyly()
{
	<%
	if (objUser==null)
	{
	%>
		alert('请您先登录！');
		location.href='<%=basePath%>/login.jsp';
	<%
	}else
	{
	%>
		var t1='<%=basePath%>/tsjy_new.jsp';
		location.href=t1;
	<%
	}
	%>
}
function doHf(sid)
{
	<%
	if (objUser==null)
	{
	%>
		alert('请您先登录！');
		location.href='<%=basePath%>/login.jsp';
	<%
	}else
	{
		if(strUserAcl.indexOf("906")>=0)
		{
		%>
			var t1='<%=basePath%>/prevTsjyHf.action?tsjyId='+sid;
			location.href=t1;
		<%
		}else
		{
		%>
			alert('请您先登录！');
			location.href='<%=basePath%>/login.jsp';
		<%
		}
	}
	%>
}
function doDel(sid)
{
	<%
	if (objUser==null)
	{
	%>
		alert('请您先登录！');
		location.href='<%=basePath%>/login.jsp';
	<%
	}else
	{
	%>
		var t1='<%=basePath%>/deleteTsjy.action?tsjyId='+sid;
		if (confirm('确认删除此建议吗？'))
		{
			location.href=t1;
		}
	<%
	}
	%>
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/prevTsjyIndex.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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

//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode"></s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=20 ></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/manager.jsp'>首页</a> > 投诉建议
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td style='height:40px;text-align:left;' valign="middle">
	<table cellspacing='0' cellpadding="0" border='0' width=100% >
	<tr>
    <td width=20 ></td>
	<td width=170 style='text-align:left;'>
		<font color='#1C9A96' size='5'>投诉与建议</font>
	</td>
    <td valign="bottom" align="right">
    <input name="" type="image" src="<%=basePath%>/images/btnWyly.gif" onclick='doWyly()'/></td>
	</td>
    <td width=25 ></td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:20px;'><td>&nbsp;</td></tr>
<tr>
<td align="center" valign="middle">
	<table cellspacing='0' cellpadding="0" border='0' width=95% >
	<%
	if (ls.size()>0)
	{
	for (intLmp=0;intLmp<ls.size();intLmp=intLmp+1)
	{
		Tsjy t=(Tsjy)ls.get(intLmp);
		if (intLmp>0)
		{
		%>
		<!--隔断//-->
		<tr><td style="height:25px;">&nbsp;</td></tr>
		<!--隔断over//-->
		<%
		}
	%>
	<tr>
	<td>
		<table cellspacing='0' cellpadding="0" style='width:100%;border-color:#CCCCCC;border:1px solid;'>
		<tr>
		<td align="left" valign="middle" style="height:40px;font-size:14px;font-face:黑体;background:#EAF4F5;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>主题：<%=t.getJyTitle()%></b>
		</td>
		</tr>
		<tr>
		<td align=center>
			<table cellspacing='0' cellpadding="0" border='0' width=98% >
			<tr style='height:5px;'><td>&nbsp;</td></tr>
			<tr>
			<td style="border-bottom:1px dotted;" align="left">
				<table cellspacing='0' cellpadding="0" border='0' width=95% style="margin-left: 10px;">
				<tr><td style='line-height:30px;'>
				<font color="#7C7C7C"><%=t.getStrContent()%></font>
				</td></tr>
				</table>
			</td>
			</tr>
			<tr style='height:5px;'><td>&nbsp;</td></tr>
			<tr>
			<td align="left">
				<table cellspacing='0' cellpadding="0" border='0' width=98% style="margin-left: 10px;">
				<tr><td valign='middle'>
				<font color="#7C7C7C">发表人：</font><font color=#58A99F><%=t.getFbUserName()==null?"":t.getFbUserName()%></font>
			<%
				date=simpleDateFormat.parse(t.getDtFbrq());
				strFbsj=simpleDateFormat.format(date);
			%>
				&nbsp;&nbsp;&nbsp;&nbsp;<font color="#7C7C7C">发表于</font><font color=#58A99F><%=strFbsj%></font>
				</td>
				<td align='right' valign='middle'>
				<%
				if (t.getHfUserName()==null)
				{
					%>
					&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>（暂未回复）</font>
					<%
					if(strUserAcl.indexOf("906")>=0)
					{
						%>
						<input type=button value='回复' onclick="doHf('<%=t.getTsjyId()%>')" />
						&nbsp;&nbsp;<input type=button value='删除' onclick="doDel('<%=t.getTsjyId()%>')" />
						<%
					}
				}
				%>
				</td>
				</tr>
				</table>
			</td>
			</tr>
			<%
			if (t.getHfUserName()!=null)
			{
				date=simpleDateFormat.parse(t.getDtHfrq());
				strFbsj=simpleDateFormat.format(date);
//				strFbsj=t.getDtHfrq();
				%>
				<tr>
				<td align="center">
					<table cellspacing='0' cellpadding="0" border='0' style='width:861px;' >
					<tr style='height:15px; background:<%=basePath%>/images/tsjyback2.gif no-repeat bottom;'><td>&nbsp;</td></tr>
					<tr style='background:<%=basePath%>/images/tsjyback3.gif repeat;'>
					<td style="background:#FFFCB7;" align="left">
					<font color="#968D42"><%=t.getHfContent()==null?"":t.getHfContent()%></font>
					</td>
					</tr>
					<tr style='height:21px; background:<%=basePath%>/images/tsjyback4.gif no-repeat top;'><td>&nbsp;</td></tr>
					</table>
				</td>
				</tr>
				<tr>
				<td align="right">
				<font color=#58A99F>系统管理员</font> <font color="#7C7C7C">回复于</font>
				&nbsp;&nbsp;<font color=#58A99F><%=strFbsj%></font>
					<%
					if(strUserAcl.indexOf("906")>=0)
					{
						%>
						&nbsp;&nbsp;<a href="javascript:doDel('<%=t.getTsjyId()%>')">删除</a>&nbsp;&nbsp;
						<%
					}
					%>
				</td>
				</tr>
				<%
			}
			%>
			</table>
		</td>
		</tr>
		</table>
	</td>
	</tr>
		<%
		}
		if (!"".equals(strPageOut))
		{
			%>
			<tr><td align='center' style='font-size:12px;'><%=strPageOut%></td></tr>
			<%
		}
		%>
	<tr><td>&nbsp;</td></tr>
	<%
	}else
	{
	%>
	<tr><td>&nbsp;</td></tr>
	<%
	}
	%>
	</table>
</td>
</tr>
<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>

