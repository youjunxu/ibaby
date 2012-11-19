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
if (objUser==null)
{
%>
	<jsp:forward page="login.jsp" />
<%
}

Integer intLmp;
Integer intTmp;
List lsIn=(List)request.getAttribute("waitDisp_outbox");
Integer intNew=(Integer)request.getAttribute("sysNewIn_zs");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
<script type="text/javascript" src="js/validate.js"></script>
<script LANGUAGE='Javascript'>
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/myOutBox.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
function toEmptyAll()
{
	var frm=document.form1;
	var i;
	var objA=null;
	
	if (frm.waitSelDel.length)
	{
		for (i=0;i<frm.waitSelDel.length;i++)
		{
			frm.waitSelDel[i].checked=false;
		}
	}else
	{
		frm.waitSelDel.checked=false;
	}
}
function tocheckedAll()
{
	var frm=document.form1;
	var i;
	var objA=null;
	
	if (frm.waitSelDel.length)
	{
		for (i=0;i<frm.waitSelDel.length;i++)
		{
			frm.waitSelDel[i].checked=true;
		}
	}else
	{
		frm.waitSelDel.checked=true;
	}
}
function toDel()
{
	var frm=document.form1;
	var t1='';
	var t2='';
	
	if (!frm.waitSelDel)
	{
		alert('没有可以删除的信息！');
		return;
	}
	t1='';
	if (frm.waitSelDel.length)
	{
		for (i=0;i<frm.waitSelDel.length;i++)
		{
			if (frm.waitSelDel[i].checked)
			{
				if (t1!='') t1=t1+',';
				t1=t1+frm.waitSelDel[i].value;
			}
		}
	}else
	{
		if (frm.waitSelDel.checked)
		{
			t1=frm.waitSelDel.value;
		}
	}
	if (t1=='')
	{
		alert('请选择待删除的信息！');
		return false;
	}

	if (confirm('确实删除这些信息吗？'))
	{
		t2='<%=basePath%>/deleteMsgByOutbox.action?tip='+t1;
		location.href=t2;
	}
	return false;
}
function toOpen(sid)
{
	var t1='<%=basePath%>/prevOpenOutboxMsg.action?xxId='+sid;
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
    	<tr style='width:189px;height:165px;'>
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >

		    	<table border="0" style='width:150px;height:165px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>信箱管理</b></font>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' ><img src='images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td ></td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/prevSendNewMsg.action">
    			<font color='#33927E'>写信</font></a>
    			</td></tr>
	    		<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<%=basePath%>/myInBox.action">
	    		<font color='#33927E'>收件箱&nbsp;&nbsp;<%=intNew==null | intNew==0?"":"("+String.valueOf(intNew)+")"%></font></a>
	    		</td></tr>
    			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
    			<font color='#7A7A84'>发件箱</font>
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
    	<tr>
    	<td></td>
    	</tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
    <form name='form1'>
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td width=80 ></td>
		<td colspan=3 align='left'>
		<a href='javascript:tocheckedAll()'>全选</a>
		&nbsp;&nbsp;<a href='javascript:toEmptyAll()'>全不选</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='删除信息' onclick='toDel()' /></td>
		</tr>
   		<tr style='height:5px;' ><td colspan=4 class=td_dash></td></tr>
   		<tr style='height:10px;' ><td colspan=4></td></tr>
		<tr>
		<td width=80 ></td>
		<td style='text-align:center;' width=60% >标题</td>
		<td style='text-align:center;' width=10% >收件人</td>
		<td style='text-align:center;' >发件时间</td>
		</tr>
   		<tr style='height:5px;' ><td colspan=4 class=td_dash></td></tr>
		<%
		if (intSize>0)
		{
			for (intLmp=0;intLmp<lsIn.size();intLmp++)
			{
				TbInbox tb=(TbInbox)lsIn.get(intLmp);
				out.println("<tr style='height:30px;'>");
				out.println("<td align='right'>");
				out.println("<input type=checkbox name='waitSelDel' value='"+String.valueOf(tb.getXxId())+"' /></td>");
				date=simpleDateFormat.parse(tb.getDtSend());
				strLmp=simpleDateFormat.format(date);

				if (tb.getYdBj()==0)
				{
					%>
					<td>&nbsp;&nbsp;<a href="javascript:toOpen('<%=tb.getXxId()%>')">
					<b><%=tb.getXxTitle()==null?"":tb.getXxTitle()%></b></a></td>
					<%
					if (tb.getRecUserName()==null)
					{
						out.println("<td align='center'><b>-</b></td>");
					}else
					{
						if (tb.getRecUserName().equals("admin"))
						{
							out.println("<td align='center'><b>系统管理员</b></td>");
						}else
						{
							out.println("<td align='center'><b>"+tb.getRecUserName()+"</b></td>");
						}
					}
					out.println("<td align='center'><b>"+strLmp+"</b></td>");
				}else
				{
					%>
					<td>&nbsp;&nbsp;<a href="javascript:toOpen('<%=tb.getXxId()%>')"><%=tb.getXxTitle()==null?"":tb.getXxTitle()%></a></td>
					<%
					if (tb.getRecUserName()==null)
					{
						out.println("<td align='center'><b>-</b></td>");
					}else
					{
						if (tb.getRecUserName().equals("admin"))
						{
							out.println("<td align='center'>系统管理员</td>");
						}else
						{
							out.println("<td align='center'>"+tb.getRecUserName()+"</td>");
						}
					}
					out.println("<td align='center'>"+strLmp+"</td>");
				}
				out.println("</tr>");
		   		out.println("<tr style='height:5px;' ><td colspan=4 class=td_dash></td></tr>");
			}
	   		out.println("<tr style='height:10px;' ><td colspan=4></td></tr>");
		}
		%>
		</table>
		</form>
		<%
		if (!strPageOut.equals(""))
		{
			%>
    		<table border="0" cellspacing="0" cellpadding="0" width=100% >
	   			<tr style='height:20px;' ><td style='font-size:12px;'>
				<%
				out.println(strPageOut);
				%>
	   			</td></tr>
		   		<tr style='height:20px;' ><td ></td></tr>
			</table>
			<%
		}
		%>
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
