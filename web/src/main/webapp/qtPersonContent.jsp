<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>
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
Integer intSize=intBSize;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
if (intSize==null) intSize=0;
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
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
function toContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonJs.action?userId=<%=ej.getUserId()%>';
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
   	<tr style='height:33px; '>
   	<%
	intLmp=0;
	if (ej.getPhotoStatus()!=null)
	{
		if (ej.getPhotoStatus().equals(1))
		{
			intLmp=1;
		}
	}
	if (intLmp==1)
	{
	%>
   	<td align="left" width=76% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
    		<%
    		if (ej.getEjName()==null)
    		{
    			%>
	    		<font color='#248D93'><b><%=ej.getNickName()%></b></font>
        		<%
    		}else
    		{
    			%>
    			<font color='#248D93'><b><%=ej.getEjName()%></b></font>
        		<%
    		}
    		%>
	</td>
   	<td align='left' valign="middle" style='font-size:14px;' >
   	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
   	<a href='javascript:toGrPhoto()'><font color='#2F9681'>制造记忆</font></a>
   	</td>
   	<td align='left' valign="middle" style='font-size:14px;' >
   	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'><font color='#2F9681'>家庭管理</font></a>
   	</td>
	<%
	}else
	{
	%>
   	<td align="left" width=88% style='font-size:24px;' valign='middle' >
    		<%
    		if (ej.getEjName()==null)
    		{
    			%>
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
	<font color='#248D93'><b><%=ej.getNickName()%></b></font></a>
        		<%
    		}else
    		{
    			%>
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
        		<%
    		}
    		%>
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
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
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
	    			&nbsp;&nbsp;&nbsp;&nbsp;<font color='#7A7A84'>贝爱学园</font>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intBSize.toString()%>)</td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toContent()"><font color='#33927E'>博文记事</font></a>
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
    		<table border='0' cellspacing='0' cellpadding='0' width=668 style='margin-left:30px;' >
    		<tr style='height:5px;'><td colspan=3></td></tr>
    		<%
    		for (intLmp=0;intLmp<lstMain.size();intLmp++)
    		{
    			EjDocuments ed=(EjDocuments)lstMain.get(intLmp);
    			if (intLmp>0)
    			{
    				%>
        			<tr style='height:30px;'>
        			<td width=40></td><td></td><td></td>
    				</tr>
		    		<%
    			}
				%>
	    			<tr>
	    			<td colspan=3>
					<a href="<%=basePath%>/prevOpenBADoc.action?baId=<%=ed.getDocId()%>" target='_blank'><font color='#219F91' size=+2><%=ed.getStrTitle()%></font></a>
					<%
					date=simpleDateFormat.parse(ed.getDtCrea());
					strFbsj=simpleDateFormat.format(date);
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<font color='#D7D1D3' size=-2>"+strFbsj+"</font>");
					%>
					</td>
					</tr>
					<%
		    		intLsize=0;
					if (ed.getStrLable()!=null)
					{
						if (!"".equals(ed.getStrLable()))
						{
					%>
		    		<tr style='height:15px;'><td colspan=3></td></tr>
		    		<tr style='height:22px;'><td width=40>标签：</td>
					<td style='text-align:left;' width=628 colspan=2>
			    		<table border='0' cellspacing='0' cellpadding='0' >
						<tr>
						<%
	   					objBq=ed.getStrLable().split(",");
	   					for (intTmp=0;intTmp<objBq.length;intTmp++)
		   				{
	   						if (intTmp>0)
	   						{
		   						%>
			   					<td align='left' valign="middle" style='width:10px;'>&nbsp;</td>
		   						<%
	   						}
	   						intLsize=intLsize+MyUtils.getStringLength(objBq[intTmp]);
	   						if (intLsize<=20)
	   						{
	   					%>
						<td align=left valign="middle" style='width:15px;background:url(<%=basePath%>/images/lab_left.jpg) right no-repeat ;'>&nbsp;</td>
	  					<td align=left valign="middle" style='background:url(<%=basePath%>/images/lab_middle.jpg) repeat-x center;'>
	 					<font color='#000000'><%=objBq[intTmp]%></font>
	  					</td>
		   				<td align=left valign="middle" style='width:6px;background:url(<%=basePath%>/images/lab_right.jpg) left no-repeat ;'>&nbsp;</td>
	   					<%
	   		   				}else
	   		   				{
	   		   					break;
	   		   				}
		   				}
						if (intLsize>50)
						{
							out.println("<td>...</td>");
						}else
						{
							out.println("<td></td>");
						}
			   			%>
						</tr>
	    				</table>
		    		</td>
		    		</tr>
    				<%
		   				}
	   				}
		   			%>
	    			<tr style='height:22px;'>
	    			<%
					out.println("<td width=40>类型：</td>");
					if (ed.getDocType().equals("BA"))
					{
						out.println("<td width=568><font color='#228A8B'>贝爱学园</font></td>");
					}else
					{
						out.println("<td width=568><font color='#228A8B'>萌言萌事</font></td>");
					}
					%>
    	   		<td width=60>
    				阅读(<%=ed.getIntReaders()%>)&nbsp;&nbsp;
    	 		</td>
    	   		</tr>
		<%
    		}
    		if (!"".equals(strPageOut))
    		{
    			out.println("<tr style='height:30px;'>");
    			out.println("<td colspan=3></td>");
    			out.println("</tr>");
    			out.println("<tr style='height:40px;'>");
    			out.println("<td colspan=3 align='center' style='font-size:12px;'>"+strPageOut+"</td>");
    			out.println("</tr>");
    		}
			out.println("<tr style='height:10px;'>");
			out.println("<td colspan=3></td>");
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
