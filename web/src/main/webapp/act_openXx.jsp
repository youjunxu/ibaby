<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.ActXx"%>
<%@ page import="com.lhq.prj.bms.po.ActLyM"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

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

ActXx sp=(ActXx)request.getAttribute("waitOpen_actXxDoc");
if (sp==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
List lstLy=(List)request.getAttribute("waitOpen_ly");
String smp=(String)request.getAttribute("waitOpen_lb");
Integer intLb=null;
if (smp!=null) intLb=Integer.valueOf(smp);
if (intLb==null) intLb=1;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date dateA;
java.util.Date dateB;

simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
Integer intLmp;
Integer intTmp;
String sout="";
String strLmp;
String strTmp;

dateA=simpleDateFormat.parse(sp.getDtEnd());
strTmp=(new Date()).toLocaleString();
dateB=simpleDateFormat.parse(strTmp);
strLmp=simpleDateFormat.format(dateA);
strTmp=simpleDateFormat.format(dateB);
String strPTitle="";

if (strLmp.compareTo(strTmp)>0)
{
	strPTitle="贝家爱-贝爱乐园-进行中的活动-"+sp.getActName();
}else
{
	strPTitle="贝家爱-贝爱乐园-已结束的活动-"+sp.getActName();
}
Integer intDel;
intDel=0;
if (objUser!=null)
{
    if(strUserAcl.indexOf("LY509")>=0 || strUserAcl.indexOf("999")>=0){
    	intDel=1;
    }
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=strPTitle%></title>
<link href="'<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script LANGUAGE='Javascript'>
<%
if (intDel==1)
{
%>
function toDel(sid)
{
	var t1='<%=basePath%>/deleteActLyById.action?lyId='+sid;
	if (confirm('确实删除此留言吗？'))
	{
		location.href=t1;
	}	
}
<%
}
%>

function toOtherLm(strXh)
{
	var t1='<%=basePath%>/prevOpenActXx.action?actId=<%=sp.getActId()%>&lb='+strXh;
	location.href=t1;
}
function doSubmit()
{
	var doc=document.form1;
	<%
	if(strUserAcl.indexOf("BA303")>=0 || strUserAcl.indexOf("BA507")>=0 || strUserAcl.indexOf("BA509")>=0 || strUserAcl.indexOf("999")>=0)
	{
		%>
		if (doc.lyContent.value=='')
		{
			alert('请输入留言内容！');
		}else
		{
			if (confirm('确实提交此留言吗？'))
			{
				doc.submit();
			}
		}
		<%
	}else
	{
		%>
		alert('对不起，请您登录后再操作！');
		location.href='<%=basePath%>/login.jsp';
		<%
	}
	%>
}
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenuA" executeResult="true" >
		<s:param name="strCurMkCode">BALY</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" width=950 height=648 align='center'>
<tr style='height:648px;'>
<td style='background:url(<%=basePath%>/images/ly_mainA.jpg) no-repeat;' width=950 height=648 valign='top'>
	<table border="0" cellspacing="0" cellpadding="0" width=100% height=648 >
	<tr style='height:510px;'>
	<td width=6></td>
	<td width=598 valign='top' align='left'>
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
		<tr style='height:9px;'><td></td></tr>
		<tr style='height:498px;'>
		<td valign='middle' align='center' width=598 height=498 >
		<img src='<%=basePath%>/graph/game/<%=sp.getActImg()%>' width=598 height=508 />
		</td>
		</tr>
		<tr style='height:5px;'><td></td></tr>
		</table>
	</td>
	<td width=7></td>
	<td valign='top'>
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=510 >
		<%
		if (intLb==1)
		{
		%>
		<tr height=42>
		<td width=33% align='center' valign='bottom'>
		<img src='<%=basePath%>/images/hdmemoAa.jpg' />
		</td>
		<td width=33% align='center' valign='bottom'>
		<a href="javascript:toOtherLm('2')"><img src='<%=basePath%>/images/hdmemoBb.jpg' height=34 /></a>
		</td>
		<td align='center' valign='bottom'>
		<a href="javascript:toOtherLm('3')"><img src='<%=basePath%>/images/hdmemoCb.jpg' height=34 /></a>
		</td>
		</tr>
		<tr style='height:10px;'>
		<td align='center' valign='middle'>
		<img src='<%=basePath%>/images/baly_arrowdown.jpg' height=5 width=10 />
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>
		<%
		}else
		{
			if (intLb==2)
			{
			%>
			<tr style='height:42px;'>
			<td width=33% align='center' valign='bottom'>
			<a href="javascript:toOtherLm('1')"><img src='<%=basePath%>/images/hdmemoAb.jpg' height=34 /></a>
			</td>
			<td width=33% align='center' valign='bottom'>
			<img src='<%=basePath%>/images/hdmemoBa.jpg' />
			</td>
			<td align='center' valign='bottom'>
			<a href="javascript:toOtherLm('3')"><img src='<%=basePath%>/images/hdmemoCb.jpg' height=34 /></a>
			</td>
			</tr>
			<tr style='height:10px;'>
			<td>&nbsp;</td>
			<td align='center' valign='middle'>
			<img src='<%=basePath%>/images/baly_arrowdown.jpg' height=5 width=10 />
			</td>
			<td>&nbsp;</td>
			</tr>
			<%
			}else
			{
				%>
				<tr style='height:42px;'>
				<td width=33% align='center' valign='bottom'>
				<a href="javascript:toOtherLm('1')"><img src='<%=basePath%>/images/hdmemoAb.jpg' height=34 /></a>
				</td>
				<td width=33% align='center' valign='bottom'>
				<a href="javascript:toOtherLm('2')"><img src='<%=basePath%>/images/hdmemoBb.jpg' height=34 /></a>
				</td>
				<td align='center' valign='bottom'>
				<img src='<%=basePath%>/images/hdmemoCa.jpg' />
				</td>
				</tr>
				<tr style='height:10px;'>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td align='center' valign='middle'>
				<img src='<%=basePath%>/images/baly_arrowdown.jpg' height=5 width=10 />
				</td>
				</tr>
				<%
			}
		}
		%>
		<tr style='height:15px;'><td colspan=3>&nbsp;</td></tr>
		<tr style='height:420px;'><td colspan=3 style='text-align:center;' valign='top'>
			<div style='width:315px; height:420px;border:0px solid;overflow-y:auto;margin-left:10px;' align='left'>
			<%
			if (intLb==1)
			{
				out.print(sp.getActContent());
			}else
			{
				if (intLb==2)
				{
					out.print(sp.getJpJs());
				}
			}
			%>
			</div>
		</td>
		</tr>
		</table>
	</td>
	</tr>
	<tr style='height:78px;'>
	<td colspan=4>
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
		<tr><td align='center' valign='middle' width=576>
		<%
		if (sp.getActLink()==null)
		{
		%>
		<img src='<%=basePath%>/images/hdStart.jpg' height=52/>
		<%
		}else
		{
			%>
			<a href='http://<%=sp.getActLink()%>' target='_blank'><img src='<%=basePath%>/images/hdStart.jpg' height=52 /></a>
			<%
		}
		%>
		</td>
		<td style='width:90px;font-family:黑体;font-size:14px bold;'>分享小游戏到
		</td>
		<td>
		<img src='<%=basePath%>/images/ly_midb.jpg' />
		&nbsp;&nbsp;<img src='<%=basePath%>/images/ly_midc.jpg' />
		&nbsp;&nbsp;<img src='<%=basePath%>/images/ly_midd.jpg' />
		</td>
		</tr>
		</table>
	</td>
	</tr>
	<tr style='height:48px;'>
	<td colspan=4 valign='middle'><img src='<%=basePath%>/images/yhly.jpg'/></td>
	</tr>
	</table>
</td>
</tr>
<tr >
<td style='background:url(<%=basePath%>/images/ly_mainB.jpg) repeat-y;' width=950 valign='top' align='left'>
	<table border="0" cellspacing="0" cellpadding="0" width=95% align='center'>
<%
if (lstLy.size()>0)
{
	intTmp=lstLy.size();
	if (intTmp>10) intTmp=10;
	for (intLmp=0;intLmp<lstLy.size();intLmp++)
	{
		ActLyM am=(ActLyM)lstLy.get(intLmp);
		sout="<tr style='height:20px;'><td colspan=2></td></tr>";
		sout=sout+"<tr><td>";
		sout=sout+"<table border='0' cellspacing='0' cellpadding='0' width=100% align='center'>";
		sout=sout+"<tr><td valign='top' width=45>";
		sout=sout+"<img src='"+basePath+"/graph/net/"+am.getHeadImg()+"' width=32 height=32/>";
		sout=sout+"</td>";
		sout=sout+"<td valign='top' style='word-break:break-word;table-layout:fixed;'>";
		sout=sout+"<font color=#0066CC>"+am.getNickName()+"：</font>";
		sout=sout+"<font color=#7B7C7C>"+am.getLyContent()+"</font>";
		sout=sout+"</td></tr>";
		sout=sout+"<tr style='height:25px;'><td class='td_dash'></td><td class='td_dash'>";
		sout=sout+"<font color=#0066CC>"+am.getDtCrea()+"</font>";
		sout=sout+"&nbsp;&nbsp;<font color=#7B7C7C>来自网页</font>";
		if (intDel==1)
		{
			sout=sout+"&nbsp;&nbsp;<a href=\"javascript:toDel('"+String.valueOf(am.getLyId())+"')\"><font color='#2F9681'>删除</font></a>";
		}
		sout=sout+"</td></tr>";
		sout=sout+"</table>";
		sout=sout+"</td></tr>";
		out.print(sout);
	}
}
%>
	<tr style='height:15px;'><td>&nbsp;</td></tr>
	<tr >
	<td>
	 	<s:form method="post" action="saveActLy" name="form1" theme="simple" >
  		<input type='hidden' name='actId' value='<%=sp.getActId()%>'/>
  		<input type='hidden' name='actName' value='<%=sp.getActName()%>'/>
		<table border="0" cellspacing="0" cellpadding="0" width=70% align='center'>
		<tr style='height:30px;'>
		<td style='font-size:14px;'>&nbsp;&nbsp;您的留言：
		</td>
		</tr>
		<tr style='height:90px;'>
		<td align='left'>&nbsp;&nbsp;<textarea name='lyContent' rows=5 cols=70></textarea>
		</td>
		</tr>
		<tr style='height:30px;'>
		<td align='left'>&nbsp;&nbsp;<input type=button value='提交' onclick='doSubmit()'/>
		</td>
		</tr>
		</table>
		</s:form>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:21px;'>
<td style='background:url(<%=basePath%>/images/ly_mainC.jpg) no-repeat;' width=950 height=21 valign='top'>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>

