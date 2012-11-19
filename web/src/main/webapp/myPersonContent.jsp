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
Integer intBqLen;
List lstMain=(List)request.getAttribute("sysList_disp");
UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String strLb=(String)request.getAttribute("sysLb_disp");
String strLmp;
String[] objBq;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

strLb="BA";
//页码等信息
Integer intBSize=(Integer)request.getAttribute("sysCountB_disp");
Integer intCSize=(Integer)request.getAttribute("sysCountC_disp");
Integer intSize=intBSize;
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
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
<script LANGUAGE='Javascript'>
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/myPersonContent.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
function toRemoveDoc(slx,sid)
{
	var t1='';
	if (confirm('确实删除此文档吗？'))
	{
		t1='<%=basePath%>/prevRemoveBADoc.action?baId='+sid;
		location.href=t1;
	}
}
function toEditDoc(slx,sid)
{
	var t1='';
	t1='<%=basePath%>/prevEditBADoc.action?baId='+sid;
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
			<s:param name="topMk">CONTENT</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td ></td></tr>
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
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='images/content.gif' /></td></tr>
	    		<tr><td>
	    			<font color='#7A7A84'>&nbsp;&nbsp;&nbsp;&nbsp;贝爱学园</font>
    			</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intBSize.toString()%>)</td></tr>
	    		<tr><td>
    			<%
	    		if (strLb.equals("MS"))
	    		{
	    			%>
	    			<font color='#7A7A84'>&nbsp;&nbsp;&nbsp;&nbsp;博文记事</font>
	    			<%
	    		}else
	    		{
	    			%>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:location.href='<%=basePath%>/firstMyHomeJs.action';"><font color='#33927E'>博文记事</font></a>
	    			<%
	    		}
    			%>
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
    			EjDocuments ed=(EjDocuments)lstMain.get(intLmp);
    			if (intLmp>0)
    			{
    				%>
        			<tr style='height:30px;'>
        			<td colspan=3></td>
    				</tr>
		    		<%
    			}
				%>
    			<tr>
    			<td style='width:500px;' colspan=3>
				<a href="<%=basePath%>/prevOpenBADoc.action?baId=<%=ed.getDocId()%>" target='_blank'><font color='#219F91' size=+2><%=ed.getStrTitle()%></font></a>
				<%
				date=simpleDateFormat.parse(ed.getDtCrea());
				strFbsj=simpleDateFormat.format(date);
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<font color='#D7D1D3' size=-2>"+strFbsj+"</font>");
				%>
				</td>
				</tr>
	    		<tr style='height:15px;'><td colspan=3></td></tr>
	    		<tr ><td width=40>标签：</td>
				<td style='text-align:left;' colspan=2>
		    		<table border='0' cellspacing='0' cellpadding='0' >
					<tr>
					<%
		    		Integer intLsize=0;
					if (ed.getStrLable()!=null)
					{
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
    			<tr>
				<td style='width:40px;'>类型：</td>
				<td align='left'><font color='#228A8B'>贝爱学园</font>
				<%
				if (ed.getShBj()==0)
				{
					out.print("&nbsp;&nbsp;<font color=green>(网站审核中)</font>");
				}else
				{
					if (ed.getShBj()==1)
					{
						out.print("&nbsp;&nbsp;<font color=red>(网站已审核通过)</font>");
					}else
					{
						out.print("&nbsp;&nbsp;<font color=red>(网站审核未通过</font>)");
					}
				}
				%>
				</td>
    	   		<td width=180>
    				阅读(<%=ed.getIntReaders()==null?0:ed.getIntReaders()%>)&nbsp;&nbsp;|&nbsp;&nbsp;
    				<img src='images/ejedit.gif' />&nbsp;&nbsp;
				<a href="javascript:toEditDoc('<%=ed.getDocType()%>','<%=ed.getDocId()%>')">编辑</a>
    				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript:toRemoveDoc('<%=ed.getDocType()%>','<%=ed.getDocId()%>')">删除</a>				
    	 		</td>
    	   		</tr>
		<%
    		}
    		out.println("<tr style='height:40px;'>");
			out.println("<td colspan=3></td>");
			out.println("</tr>");
			out.println("<tr style='height:40px;'>");
			out.println("<td colspan=3 align='center' style='font-size:12px;'>"+strPageOut+"</td>");
			out.println("</tr>");
			out.println("<tr style='height:30px;'>");
			out.println("<td colspan=3></td>");
			out.println("</tr>");
    		out.println("</table>");
    	}
    	%>
    
    <!-- 文档区over -->
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
