<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.PhotoPz"%>
<%@ page import="com.lhq.prj.bms.po.PhotoMemo"%>
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
List lsXc=(List)request.getAttribute("waitDisp_xcxcxx");
List lstGs=(List)request.getAttribute("waitDisp_xcgs");
List lstZp=(List)request.getAttribute("waitDisp_zpxx");
Integer intAllzs=(Integer)request.getAttribute("waitDisp_zpall");
UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
Integer intLb=0;
Integer intXcZs=0;
String strLmp=(String)request.getParameter("xcId");
String strPhotoPath="graph/people";
if (lsXc==null)
{
	intXcZs=0;
}else
{
	intXcZs=lsXc.size();
}
intLb=0;
if (strLmp!=null)
{
	intLb=Integer.valueOf(strLmp);
}
strLmp="";
if (intAllzs==null)
{
	intAllzs=0;
}

//页码等信息
Integer intSize=(Integer)request.getAttribute("waitDisp_zpzs");
if (intSize==null) intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=16;
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
function toXc(strId)
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action?xcId='+strId;
	location.href=t1;
}
function doCjxc()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=0';
	location.href=t1;
}
function doUpzp()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=1&xcId=<%=intLb%>';
	location.href=t1;
}
function doBig(strId)
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?LB=2&photoId='+strId;
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/myPersonPhoto.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i+'&xcId=<%=intLb%>';
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
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">PHOTOINFO</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td ></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr >
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;'>
	    	<tr>
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_1.jpg) no-repeat;'>
			</td>
	    	</tr>
	    	<tr>
	    	<td align='left' style='background:url(<%=basePath%>/images/content_bk_2.jpg) repeat-y;' valign='top'>
		    	<table border="0" style='width:150px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td style='width:80px;' align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>相册分类</b></font>
    			</td>
    			<td style='width:25px;'>&nbsp;</td>
    			<td align='center' style='width:30px;' >
    			<a href='<%=basePath%>/photoPzManage.action'><font color='#FE8F1C'>管理</font></a>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td colspan=3></td></tr>
	    		<tr><td>
	    		<%
	    		if (intLb.equals(0))
	    		{
	    			%>
	    			<font color='#7A7A84'>&nbsp;&nbsp;&nbsp;&nbsp;全部相册</font>
	    			<%
	    		}else
	    		{
	    			%>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toXc('0')"><font color='#33927E'>全部相册</font></a>
	    			<%
	    		}
				%>
				</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intAllzs%>)</td></tr>
				<%
				if (intXcZs>0)
				{
	    			for (intLmp=0;intLmp<intXcZs;intLmp++)
	    			{
	    				PhotoPz p=(PhotoPz)lsXc.get(intLmp);
	    				out.println("<tr style='height:15px;'><td colspan=3></td></tr>");

	    				out.println("<tr><td>");
		    			if (intLb.equals(p.getXcId()))
		    			{
		    				%>
							<font color='#7A7A84'>&nbsp;&nbsp;&nbsp;&nbsp;<%=p.getStrTitle()%></font>
			    			<%
			    		}else
			    		{
		    				%>
		    				&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toXc('<%=p.getXcId()%>')"><font color='#33927E'><%=p.getStrTitle()%></font></a>
		    				<%
		    			}
	    				out.println("</td>");
	    				out.println("<td >&nbsp;</td>");
						intTmp=(Integer)lstGs.get(intLmp);
			    		out.println("<td align='left' >("+intTmp.toString()+")");
	    				out.println("</td></tr>");
		    		}
	    		}
				if (intXcZs<=3)
				{
				%>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
				<%
				}
				%>
		    	</table>
    		</td>
	    	</tr>
	    	<tr >
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_3.jpg) no-repeat;'>
			</td>
	    	</tr>
    		<tr style='height:20px;' ><td ></td></tr>
	    	</table>
    	</td>
    	</tr>
    	<tr><td></td></tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td >
		&nbsp;&nbsp;<img src="<%=basePath%>/images/xc1.gif" />
		</td>
		<td style="bgcolor:'#FCF4FF';width:81px;height:25px;" align='center' valign='middle' >
		<input name="" type="image" src="<%=basePath%>/images/btnSczp.jpg" onclick='doUpzp()' />
		</td>
		<td style="bgcolor:'#FCF4FF';width:81px;height:25px;" align='center' valign='middle'>
		<input name="" type="image" src="<%=basePath%>/images/btnCjxc.jpg" onclick='doCjxc()' />
		</td>
		</tr>
   		<tr style='height:15px;' ><td colspan=3></td></tr>
		<%
		if (intSize>0)
		{
			for (intLmp=0;intLmp<lstZp.size();intLmp++)
			{
				PhotoMemo pm=(PhotoMemo)lstZp.get(intLmp);
				intTmp=intLmp+1;
				if ((intTmp%4)==1)
				{
				%>
				<tr>
				<td colspan=3>
			    	<table border="0" cellspacing="0" cellpadding="0" width=100% style='margin-left:10px;'>
					<tr>
				<%
				}else
				{
				%>
				<td style='width:10px;'></td>
				<%
				}
				%>
				<td style='width:145px;' align='left'>
			    	<table border="0" cellspacing="0" cellpadding="0" width=145 >
					<tr>
					<td>
					<img src='<%=basePath%>/<%=strPhotoPath%>/<%=pm.getWjName()%>' width=145 height=144 />
					</td>
					</tr>
					<tr style='height:20px;'>
					<td align='center' valign='middle' style="background-color:#56B1A8;">
					<a href='<%=basePath%>/photoGl.action?BJ=2&xcId=<%=intLb%>&photoId=<%=pm.getPhotoId()%>'>
					<font color=#FFFFFF><%=pm.getStrTitle()%></font></a>
					</td>
					</tr>
				   	</table>
				</td>
				<%
				if ((intTmp%4)==0)
				{
				%>
   					</tr>
				   	</table>
				</td>
				</tr>
		   		<tr style='height:20px;' ><td colspan=3></td></tr>
				<%
				}
			}
			intTmp=lstZp.size();
			if ((intTmp%4)>0)
			{
				intLmp=4-(intTmp%4);
				%>
					<td colspan=<%=intLmp%> ></td>
					</tr>
					</table>
				</td>
				</tr>
		   		<tr style='height:20px;' ><td colspan=3></td></tr>
				<%
			}
		}
		if (!strPageOut.equals(""))
		{
			%>
	   		<tr style='height:20px;' ><td colspan=3 style='font-size:12px;'>
			<%
			out.println(strPageOut);
			%>
	   		</td></tr>
	   		<tr style='height:20px;' ><td colspan=3></td></tr>
			<%
		}
		%>
		</table>
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
