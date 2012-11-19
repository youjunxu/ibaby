<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.GoodFriend"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strHomePath="graph/net";

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
UserEj e=(UserEj) request.getSession().getAttribute("waitDisp_ej");
String strLmp;
String[] objBq;
if (e==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
List lstDoc=(List)request.getAttribute("waitList_doc");
List lstFriend=(List)request.getAttribute("sysFriends_disp");

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
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
function doEditXy()
{
	var t1='';
	t1='<%=basePath%>/myPersonEj.jsp?E=1';
	location.href=t1;
}
function openGoodFriend(sid)
{
	var t1='';
	t1='<%=basePath%>/toPersonHome.action?userId='+sid;
	location.href=t1;
}
function toEditDoc(slx,sid)
{
	var t1='';
	t1='<%=basePath%>/prevEditBADoc.action?baId='+sid;
	location.href=t1;
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
function toPage(strP)
{
	var i=0;
	var t1='';
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/toMyHome.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">MAIN</s:param>
		</s:action>
    </td>
</tr>
<tr>
<td align="left" valign="middle">
    <table border="0" cellspacing="0" cellpadding="0" style="width:909px;margin-left:20px;height:322px;background:url(images/homebk_top.gif) no-repeat left;">
   	<tr>
	<td align="center" valign="middle" style='width:400px;background:url(<%=basePath%>/images/homeBk_photo.gif) no-repeat center;'>
	<%
	if (e.getSyPhoto()!=null)
	{
		if (!"".equals(e.getSyPhoto()))
		{
			%>
			<img src='<%=basePath+"/"+strHomePath+"/"+e.getSyPhoto()%>' style='width:357px;height:260px;' />
			<%
		}else
		{
			if (e.getHeadImg()!=null)		
			{
				if (!"".equals(e.getHeadImg()))
				{
					%>
					<img src='<%=basePath+"/"+strHomePath+"/"+e.getHeadImg()%>' style='width:357px;height:260px;' />
					<%
				}else
				{
					%>
					<img src='<%=basePath%>/images/nohead.jpg' style='width:357px;height:260px;' />
					<%
				}
			}else
			{
				%>
				<img src='<%=basePath%>/images/nohead.jpg' style='width:357px;height:260px;' />
				<%
			}
		}
	}else
	{
		if (e.getHeadImg()!=null)		
		{
			if (!"".equals(e.getHeadImg()))
			{
				%>
				<img src='<%=basePath+"/"+strHomePath+"/"+e.getHeadImg()%>' style='width:357px;height:260px;' />
				<%
			}else
			{
				%>
				<img src='<%=basePath%>/images/nohead.jpg' style='width:357px;height:260px;' />
				<%
			}
		}else
		{
			%>
			<img src='<%=basePath%>/images/nohead.jpg' style='width:357px;height:260px;' />
			<%
		}
	}
	%>
	</td>
	<td align="left" valign="top">
    	<table border="0" width=100% cellspacing="0" cellpadding="0" style='margin-top:20px;'>
	   	<tr>
		<td align="right" valign="bottom" style='height:27px;background:url(<%=basePath%>/images/homeXy1.gif) left;'>
		<a href='#' onclick='doEditXy()' >编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		</td>
   		</tr>
   		<tr style='height:10px;'><td>&nbsp;</td></tr>
	   	<tr style='height:100px;'>
   		<td valign="top" style='line-height:30px;'>
		&nbsp;&nbsp;&nbsp;&nbsp;<%=e.getHomeXy()==null?"":e.getHomeXy()%>
   		</td>
   		</tr>
	   	<tr style="height:98px;">
		<td align="left" valign="top" style="background:url(<%=basePath%>/images/homeBk_js.gif) left no-repeat;">
	    	<table border="0" width=80% cellspacing="0" cellpadding="0" style='margin-left:40px;margin-top:20px;'>
			<tr><td align='left' valign='top' style='line-height:20px;'>
			<%=e.getEjContent()==null?"":e.getEjContent()%>
   			</td>
	   		</tr>
	   		</table>
   		</td>
   		</tr>
   		<tr style='height:26px;'>
   		<td align='left'>
   			<table border="0" width=92% cellspacing="0" cellpadding="0" style='margin-left:14px;'>
   			<tr style='height:35px;'>
	   		<td class=td_dash align=left valign="middle" width=134>
	   		<a href='<%=basePath%>/prevNewHomeJs.action'><img src='<%=basePath%>/images/my111.jpg' width=134 height=50 /></a>
			</td>
			<td width=20></td>
	   		<td class=td_dash align=left valign="middle" width=134>
	   		<a href='<%=basePath%>/prevSay.action'><img src='<%=basePath%>/images/my211.jpg' width=134 height=50 /></a>
			</td>
			<td width=20></td>
	   		<td class=td_dash align=left valign="middle" width=166>
	   		<a href='javascript:toAddHy()'><img src='<%=basePath%>/images/my311.jpg' width=134 height=50 /></a>
			</td>
   			</tr>
   			</table>
   		</td>
   		</tr>
	   	</table>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<tr style='height:20px;'><td>&nbsp;</td></tr>
<tr>
<td width=100% align="left" >
	<table border="0" width=96% cellspacing="0" cellpadding="0" style='margin-left:20px;'>
	<tr>
	<td class='td_rdash' valign="top" align="left" style='width:200px;'>
		<table border="0" width=100% cellspacing="0" cellpadding="0" >
		<tr style='height:40px;'>
		<td>
			<table border="0" width=98% cellspacing="0" cellpadding="0" >
			<tr>
			<td align='left' style='width:150px;font-size:14px;'>
			<font color='#0C9689'><b>我的好友</b></font>
   			</td>
			<td align='left'>
			<a href='<%=basePath%>/turnSelfHy.action'>更多</a>
   			</td>
   			</tr>
		   	</table>
   		</td>
   		</tr>
		<%
		if(lstFriend.size()==0)
		{
			out.println("<tr style='height:10px;'>");
		}else
		{
			if(lstFriend.size()<4)
			{
				out.println("<tr style='height:70px;'>");
			}else
			{
				if(lstFriend.size()<7)
				{
					out.println("<tr style='height:150px;'>");
				}else
				{
					out.println("<tr style='height:230px;'>");
				}
			}
		}
		%>
		<td align='left' valign='top'>
		<%
		if(lstFriend.size()>0)
		{
			%>
			<table border="0" width=90% cellspacing="0" cellpadding="0">
			<%
			for (intLmp=0;intLmp<lstFriend.size();intLmp++)
			{
				GoodFriend g=(GoodFriend)lstFriend.get(intLmp);
				if (intLmp==0)
				{
					out.print("<tr>");
				}
				if (intLmp==3 || intLmp==6)
				{
			%>
			<tr style='height:10px;'><td colspan=3>&nbsp;</td></tr>
			<tr>
			<%
				}
			%>
			<td align='center' valign='top' style='width:54px;'>
				<table border="0" width=100% cellspacing="0" cellpadding="0" >
				<%
				if(g.getBgzHeadImg()!=null)
				{
				%>
				<tr><td><img src='<%=basePath%>/<%=strHomePath%>/<%=g.getBgzHeadImg()%>' width=52 height=52 /></td></tr>
				<%
				}else
				{
				%>
				<tr><td><img src='<%=basePath%>/images/nohead.jpg' width=52 height=52 /></td></tr>
				<%
				}
				%>
				<tr style='height:30px;'><td valign='middle'>
				<a href="javascript:openGoodFriend('<%=g.getBgzUserId()%>')"><%=g.getBgzNickName()%></a>
   				</td></tr>
		   		</table>
			</td>
			<%
				if (intLmp==2 || intLmp==5 || intLmp==8)
				{
					out.print("</tr>");
				}
			}
			if (lstFriend.size()%3==1)
			{
				out.println("<td colspan=2 width=104></td></tr>");
			}else
			{
				if (lstFriend.size()%3==2)
				{
					out.println("<td width=52></td></tr>");
				}
			}
			%>
			</table>
   		</td>
   		</tr>
		<tr style='height:35px;'><td>&nbsp;</td></tr>
		<%
		}else
		{
		%>
   		</td>
   		</tr>
		<%
		}
		%>
		<tr>
		<td style='font-size:12px;'>
		<font color="#0C9689"><b>个人应用</b></font>
   		</td>
   		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
		&nbsp;
   		</td>
		</tr>
	   	</table>
	</td>
	<td align='center' valign='top'>
	<!-- 右侧主体 文章信息-->
		<table border="0" width=93% cellspacing="0" cellpadding="0" >
		<%
		if (lstDoc.size()>0)
		{
			for (intLmp=0;intLmp<lstDoc.size();intLmp++)
			{
				EjDocuments ed=(EjDocuments) lstDoc.get(intLmp);
				if (intLmp>0)
				{
					out.println("<tr style='height:20px;'>");
					out.println("<td style='border-bottom:1px dotted gray;'>&nbsp;</td>");
					out.println("</tr>");
				}
				
				out.println("<tr style='height:40px;'>");
				out.println("<td align='left' valign='middle' style='font-family:黑体;font-size:15px;'>");
				out.println("<b>"+ed.getStrTitle()+"</b>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='left' style='font-size:10px;'>");
				out.println("<font color='#EAE6E7'>"+ed.getDtCrea()+"</font>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr style='height:20px;'><td>&nbsp;</td></tr>");
				out.println("<tr>");
				out.println("<td align='left' style='line-height:20px;nowrap:always;'>");
				strLmp=ed.getDocMemo();
				if (MyUtils.getStringLength(strLmp)>180)
				{
					strLmp=strLmp.substring(0,90);
				}
				intTmp=ed.getDocId();
				strLmp=strLmp+"...";
				out.println(strLmp);
				%>
				<a href="<%=basePath%>/prevOpenBADoc.action?baId=<%=intTmp.toString()%>" target='_blank'><font color='#F5992B'><b>查看全文 >></b></font></a>
				<%
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr style='height:20px;'><td>&nbsp;</td></tr>");
				out.println("<tr>");
				out.println("<td align='left' >");
				out.println("	<table border='0' width=98% cellspacing='0' cellpadding='0' >");
				out.println("	<tr>");
				out.println("	<td align='left' width=250 >");
				out.println("类别：");
				if(ed.getDocType().equals("BA"))
				{
					out.print("<a href='"+basePath+"/firstBA.action'><font color='#0C9689'>贝爱学园</font></a>");
				}
				if(ed.getDocType().equals("ZZ"))
				{
					out.print("<a href='"+basePath+"/firstSP.action'><font color='#0C9689'>拾适看看</font></a>");
				}
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
				out.println("	</td>");
				out.println("	<td align='right' >");

				strLmp="阅读(";
				intTmp=ed.getIntReaders();
				strLmp=strLmp+"("+intTmp.toString()+")";
				strLmp=strLmp+"&nbsp;&nbsp;|&nbsp;&nbsp;";
				strLmp=strLmp+"<img src='"+basePath+"/images/ejedit.gif' />&nbsp;&nbsp;";
				out.println(strLmp);
				intTmp=ed.getDocId();
				%>
				<a href="javascript:toEditDoc('<%=ed.getDocType()%>','<%=intTmp.toString()%>')" >编辑</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript:toRemoveDoc('<%=ed.getDocType()%>','<%=intTmp.toString()%>')" >删除</a>
				<%
				out.println("	</td>");
				out.println("	</tr>");
				out.println("	</table>");
				out.println("</td>");
				out.println("</tr>");
			}
		}
		%>
		<tr style='height:20px;'>
		<td style='border-bottom:1px dotted gray;'>&nbsp;</td>
		</tr>
		<tr style='height:40px;'><td>&nbsp;</td></tr>
		<tr>
		<td style='font-size:12px;'><%=strPageOut%></td>
		</tr>
		<tr style='height:40px;'><td>&nbsp;</td></tr>
	   	</table>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:20px;'><td>&nbsp;</td></tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
