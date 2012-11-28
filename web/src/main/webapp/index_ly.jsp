<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.ActXx"%>
<%@ page import="com.lhq.prj.bms.po.ActLyM"%>
<%@ page import="com.lhq.prj.bms.po.Spgg"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

List lstAct=(List)request.getAttribute("sysList_act");
List lstGg=(List)request.getAttribute("sysList_gg");
List lstLy=(List)request.getAttribute("sysList_ly");
String strFlagJxz=(String)request.getAttribute("sysList_jxz");
Integer intLmp;
Integer intTmp;
String strLmp;
if (strFlagJxz==null) strFlagJxz="Y";
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

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
Integer intPageLine=4;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);

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
<title>贝家爱家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<link href="assets/stylesheets/tags.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script LANGUAGE='Javascript'>
function doOpenNew(sid)
{
	var t1='<%=basePath%>/prevActGgOpen.action?ggId='+sid;
	location.href=t1;
}
function doOpenLy(sid)
{
	var t1='<%=basePath%>/prevActLyOpen.action?lyId='+sid;
	location.href=t1;
}
function doOpenAct(sid)
{
	var t1='<%=basePath%>/prevOpenActXx.action?actId='+sid;
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/firstLY.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i+'&JXZ=<%=strFlagJxz%>';
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
		<s:param name="strCurMkCode">BALY</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" style='width:950px;height:839px;margin-top:-1px;' align='center'>
<tr><td valign='top'>
	<table cellspacing="0" cellpadding="0" style='border:1px solid #FFFFFF;width:927px;height:839px;' align='center'>
	<tr><td valign='top' style='width:275px;height:419px;background:url(<%=basePath%>/images/lylefttop.jpg) no-repeat;'>
		<table border="0" cellspacing="0" cellpadding="0" width=250 align='center'>
		<tr style='height:62px;'><td>&nbsp;</td></tr>
		<tr style='height:345px;'>
            <td valign='top'>
            <div style="text-align: left;">
                <c:import url="includes/_tags.jsp" />
			</div>
            </td>
        </tr>
		</table>
	</td><td rowspan=3 style='width:652px;background:url(<%=basePath%>/images/lyright.jpg) no-repeat;' valign='top'>
	<!-- 右侧活动信息 -->
		<%
		if (lstAct.size()>0)
		{
			//有数据显示
			if (strFlagJxz.equals("Y"))
			{
				//进行中
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
				%>
				<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:830px;' align='center'>
				<tr style='height:22px;'><td>&nbsp;</td></tr>
				<tr style='height:65px;'><td valign='middle'>
					<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
					<tr style='height:55px;'><td width=120>&nbsp;</td>
					<td><img src='<%=basePath%>/images/ly_jxz.jpg' width=226 height=54 /></td>
					<td width=20>&nbsp;</td>
					<td><a href='<%=basePath%>/firstLY.action?JXZ=N'><img src='<%=basePath%>/images/ly_end.jpg' width=226 height=54 /></a></td>
					<td>&nbsp;</td>
					</tr>
					<tr style='height:10px;'>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'><img src='<%=basePath%>/images/downarrow.jpg' width=14 height=10 /></td>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'></td>
					<td>&nbsp;</td>
					</tr>
					</table>
				</td></tr>
				<tr style='height:5px;'><td>&nbsp;</td></tr>
				<tr style='height:40px;'>
				<td align='left' valign='middle'><img src='<%=basePath%>/images/ly1.jpg' width=215 height=38 /></td>
				</tr>
				<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg' height=10 /></td></tr>
				<%
				}else
				{
				%>
				<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:820px;' align='center'>
				<tr style='height:36px;'><td></td></tr>
				<tr style='height:65px;'><td>
					<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
					<tr style='height:55px;'><td width=120>&nbsp;</td>
					<td><img src='<%=basePath%>/images/ly_jxz.jpg' width=226 height=54 /></td>
					<td width=20>&nbsp;</td>
					<td><a href='<%=basePath%>/firstLY.action?JXZ=N'><img src='<%=basePath%>/images/ly_end.jpg' width=226 height=54 /></a></td>
					<td>&nbsp;</td>
					</tr>
					<tr style='height:10px;'>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'><img src='<%=basePath%>/images/downarrow.jpg' width=14 height=10 /></td>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'>&nbsp;</td>
					<td>&nbsp;</td>
					</tr>
					</table>
				</td></tr>
				<tr style='height:10px;'><td>&nbsp;</td></tr>
				<tr style='height:40px;'>
				<td align='left' valign='middle'><img src='<%=basePath%>/images/ly1.jpg' width=215 height=38 /></td>
				</tr>
				<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg' height=10 /></td></tr>
				<%
				}
			}else
			{
				//非进行中
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
				%>
				<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:830px;' align='center'>
				<tr style='height:25px;'><td>&nbsp;</td></tr>
				<tr style='height:65px;'><td valign='middle'>
					<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
					<tr style='height:55px;'><td width=120>&nbsp;</td>
					<td><a href='<%=basePath%>/firstLY.action?JXZ=Y'><img src='<%=basePath%>/images/ly_jxz2.jpg' width=226 height=54 /></a></td>
					<td width=20>&nbsp;</td>
					<td><img src='<%=basePath%>/images/ly_end2.jpg' width=226 height=54 /></td>
					<td>&nbsp;</td>
					</tr>
					<tr style='height:10px;'>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'>&nbsp;</td>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'><img src='<%=basePath%>/images/downarrow.jpg' width=14 height=10 /></td>
					<td>&nbsp;</td>
					</tr>
					</table>
				</td></tr>
				<tr style='height:5px;'><td>&nbsp;</td></tr>
				<tr style='height:40px;'>
				<td align='left' valign='middle'><img src='<%=basePath%>/images/ly2.jpg' width=191 height=38/></td>
				</tr>
				<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg' height=10 /></td></tr>
				<%
				}else
				{
				%>
				<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:820px;' align='center'>
				<tr style='height:36px;'><td>&nbsp;</td></tr>
				<tr style='height:65px;'><td>
					<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
					<tr style='height:55px;'><td width=120>&nbsp;</td>
					<td><a href='<%=basePath%>/firstLY.action?JXZ=Y'><img src='<%=basePath%>/images/ly_jxz2.jpg' width=226 height=54 /></a>
					</td>
					<td width=20>&nbsp;</td>
					<td><img src='<%=basePath%>/images/ly_end2.jpg' width=226 height=54 /></td>
					<td>&nbsp;</td>
					</tr>
					<tr style='height:10px;'>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'>&nbsp;</td>
					<td>&nbsp;</td>
					<td align='center' vlaign='top'><img src='<%=basePath%>/images/downarrow.jpg' width=14 height=10 /></td>
					<td>&nbsp;</td>
					</tr>
					</table>
				</td></tr>
				<tr style='height:10px;'><td>&nbsp;</td></tr>
				<tr style='height:40px;'>
				<td align='left' valign='middle'><img src='<%=basePath%>/images/ly2.jpg' width=191 height=38/></td>
				</tr>
				<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg' height=10 /></td></tr>
				<%
				}
			}
			//开始显示数据
			intTmp=lstAct.size();
			if (intTmp>4) intTmp=4;
			for (intLmp=0; intLmp< intTmp; intLmp=intLmp+1)
			{
				ActXx ax=(ActXx)lstAct.get(intLmp);
				if (intLmp>0)
				{
					if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
					{
						out.println("<tr style='height:10px;'>");
					}else
					{
						out.println("<tr style='height:30px;'>");
					}
					%>
					<td valign='middle'><img src='<%=basePath%>/images/ly_line2.jpg' /></td></tr>
				<%
				}
				%>
			<tr style='height:118px;'>
			<td valign='middle' >
				<table border="0" cellspacing="0" cellpadding="0" width=100% align='center'>
				<tr>
				<td valign='middle' width=175 style='height:118px;'>
				<img src='<%=basePath%>/graph/game/<%=ax.getActImg()%>' width=153 height=118 />
				</td>
				<td valign='top'>
					<table border="0" cellspacing="0" cellpadding="0" width=100% align='center'>
					<tr style='height:22px;'>
					<td width=80 align='right'>
					<font color='DE7300'><b>活动名称：</b></font>
					</td>
					<td align='left'>
					<font color='DE7300'><b><%=ax.getActName()%></b></font>
					</td>
					</tr>
					<tr style='height:22px;'>
					<td align='right'><b>活动时间：</b></td>
					<td align='left'>
				<%
				date=simpleDateFormat.parse(ax.getDtStart());
				strLmp=simpleDateFormat.format(date);
				date=simpleDateFormat.parse(ax.getDtEnd());
				strLmp=strLmp+"~"+simpleDateFormat.format(date);
				out.print(strLmp);
				%>
				</td>
				</tr>
				<tr style='height:42px;'>
				<td valign='top' align='right'><b>活动内容：</b></td>
				<td valign='top' align='left' style='line-height:15px;word-break:break-word;table-layout:fixed;'>
				<%
				if (ax.getHdJs()!=null)
				{
					if (MyUtils.getStringLength(ax.getHdJs())>112)
					{
						out.print(ax.getHdJs().substring(0,56)+"...");
					}else
					{
						out.print(ax.getHdJs());
					}
				}
				%>
				</td>
				</tr>
				<tr style='height:20px;'>
				<td colspan=2 align='right'>
				<a href="javascript:doOpenAct('<%=ax.getActId()%>')"><img src='<%=basePath%>/images/more.jpg' height=19 width=64 /></a>
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
			</td></tr>
			<%
			}
			intLmp=4-intTmp;
			if (intLmp>0)
			{
				intTmp=intLmp;
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
					intLmp=(intLmp-1)*128+118+25;
				}else
				{
					intLmp=(intLmp-1)*148+118+25;
				}
				if (intTmp!=4)
				{
					if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
					{
						out.println("<tr style='height:10px;'>");
					}else
					{
						out.println("<tr style='height:30px;'>");
					}
					out.println("<td valign='middle'><img src='"+basePath+"/images/ly_line2.jpg' /></td></tr>");
				}
				out.println("<tr style='height:"+String.valueOf(intLmp)+"px;'><td>&nbsp;</td></tr>");
			}
			if (strPageOut==null)
			{
				%>
				<tr style='height:25px;'><td valign='middle'>&nbsp;</td></tr>
				<%
			}else
			{
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
					%>
					<tr style='height:20px;'><td valign='middle' style='font-size:12px;'><%=strPageOut%></td></tr>
					<tr style='height:5px;'><td valign='middle'>&nbsp;</td></tr>
					<%
				}else
				{
					%>
					<tr style='height:25px;'><td valign='middle' style='font-size:12px;'><%=strPageOut%></td></tr>
					<%
				}
			}
			out.println("</table>");
		}else
		{
			//无数据显示
			if (strFlagJxz.equals("Y"))
			{//运行中
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
					%>
					<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:830px;' align='center'>
					<tr style='height:40px;'><td></td></tr>
					<tr style='height:65px;'><td>
						<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
						<tr style='height:55px;'><td width=120>&nbsp;</td>
						<td><img src='<%=basePath%>/images/ly_jxz.jpg' /></td>
						<td width=20>&nbsp;</td>
						<td><a href='<%=basePath%>/firstLY.action?JXZ=N'><img src='<%=basePath%>/images/ly_end.jpg' /></a></td>
						<td>&nbsp;</td>
						</tr>
						<tr style='height:10px;'>
						<td></td>
						<td align='center' vlaign='top'>
						<img src='<%=basePath%>/images/downarrow.jpg'/>
						</td>
						<td></td>
						<td align='center' vlaign='top'>
						</td>
						<td></td>
						</tr>
						</table>
					</td></tr>
					<tr style='height:40px;'>
					<td align='left' valign='middle'><img src='<%=basePath%>/images/ly1.jpg'/></td>
					</tr>
					<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg'/></td></tr>
					<tr style='height:619px;'><td valign='middle'></td></tr>
					<%
				}else
				{
					%>
					<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:820px;' align='center'>
					<tr style='height:35px;'><td></td></tr>
					<tr style='height:65px;'><td>
						<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
						<tr style='height:55px;'><td width=120>&nbsp;</td>
						<td><img src='<%=basePath%>/images/ly_jxz.jpg' /></td>
						<td width=20>&nbsp;</td>
						<td><a href='<%=basePath%>/firstLY.action?JXZ=N'><img src='<%=basePath%>/images/ly_end.jpg' /></a></td>
						<td>&nbsp;</td>
						</tr>
						<tr style='height:10px;'>
						<td></td>
						<td align='center' vlaign='top'>
						<img src='<%=basePath%>/images/downarrow.jpg'/>
						</td>
						<td></td>
						<td align='center' vlaign='top'>
						</td>
						<td></td>
						</tr>
						</table>
					</td></tr>
					<tr style='height:40px;'>
					<td align='left' valign='middle'><img src='<%=basePath%>/images/ly1.jpg'/></td>
					</tr>
					<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg'/></td></tr>
					<tr style='height:590px;'><td valign='middle'></td></tr>
					<%
				}
			}else
			{//已结束
				if (strBrowser=="CHROME" || strBrowser=="FIREFOX")
				{
					%>
					<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:830px;' align='center'>
					<tr style='height:40px;'><td></td></tr>
					<tr style='height:65px;'><td>
						<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
						<tr style='height:55px;'><td width=120>&nbsp;</td>
						<td><a href='<%=basePath%>/firstLY.action?JXZ=Y'><img src='<%=basePath%>/images/ly_jxz2.jpg' /></a></td>
						<td width=20>&nbsp;</td>
						<td><img src='<%=basePath%>/images/ly_end2.jpg' /></td>
						<td>&nbsp;</td>
						</tr>
						<tr style='height:10px;'>
						<td></td>
						<td align='center' vlaign='top'>
						</td>
						<td></td>
						<td align='center' vlaign='top'>
						<img src='<%=basePath%>/images/downarrow.jpg'/>
						</td>
						<td></td>
						</tr>
						</table>
					</td></tr>
					<tr style='height:25px;'><td></td></tr>
					<tr style='height:40px;'>
					<td align='left' valign='middle'><img src='<%=basePath%>/images/ly2.jpg'/></td>
					</tr>
					<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg'/></td></tr>
					<tr style='height:619px;'><td valign='middle'></td></tr>
					<%
				}else
				{
					%>
					<table border='0' cellspacing='0' cellpadding='0' width=585 style='height:820px;' align='center'>
					<tr style='height:35px;'><td></td></tr>
					<tr style='height:65px;'><td>
						<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% align='center'>
						<tr style='height:55px;'><td width=120>&nbsp;</td>
						<td><a href='<%=basePath%>/firstLY.action?JXZ=Y'><img src='<%=basePath%>/images/ly_jxz2.jpg' /></a></td>
						<td width=20>&nbsp;</td>
						<td><img src='<%=basePath%>/images/ly_end2.jpg' /></td>
						<td>&nbsp;</td>
						</tr>
						<tr style='height:10px;'>
						<td></td>
						<td align='center' vlaign='top'>
						</td>
						<td></td>
						<td align='center' vlaign='top'>
						<img src='<%=basePath%>/images/downarrow.jpg'/>
						</td>
						<td></td>
						</tr>
						</table>
					</td></tr>
					<tr style='height:20px;'><td></td></tr>
					<tr style='height:40px;'>
					<td align='left' valign='middle'><img src='<%=basePath%>/images/ly2.jpg'/></td>
					</tr>
					<tr style='height:10px;'><td><img src='<%=basePath%>/images/ly_line1.jpg'/></td></tr>
					<tr style='height:590px;'><td valign='middle'></td></tr>
					<%
				}
			}
			out.println("</table>");
		}
		%>
	<!-- 右侧活动信息 over-->
	</td></tr>
	<tr style='height:15px;'><td>&nbsp;</td></tr>
	<tr><td style='width:255px;height:402px;background:url(<%=basePath%>/images/lyleftdown.jpg) no-repeat;'>
		<table border="0" cellspacing="0" cellpadding="0" width=240 height=100% style='margin-left:10px;'>
		<tr style='height:65px;'><td></td></tr>
		<tr style='height:65px;'>
		<td class=td_dash valign='top' align=left>
		<%
		if (lstLy.size()>=1)
		{
			ActLyM am=(ActLyM)lstLy.get(0);
		%>
			<table border="0" cellspacing="1" cellpadding="2" width=100% height=100% >
			<tr style='height:5px;'><td colspan=2></td></tr>
			<tr style='height:55px;'><td width=32 rowspan=2 align='left' valign='top'>
			<%
			if (am.getHeadImg()==null || "null".equals(am.getHeadImg()) || "".equals(am.getHeadImg()))
			{
				%>
				<img src='<%=basePath%>/images/nohead.jpg' width=50 height=32/>
				<%
			}else
			{
				%>
				<img src='<%=basePath%>/graph/net/<%=am.getHeadImg()%>' width=50 height=32/>
				<%
			}
			%>
			</td><td align='left' valign='top' style='word-break:break-word;table-layout:fixed;font-size:12px;'>
			<font color=#00C1A4><%=am.getNickName()%>：</font>
			<%=am.getLyContent()%>
			</td>
			</tr>
			<tr><td align='right' >
			<a href="javascript:doOpenLy('<%=am.getLyId()%>')"><font color='CB9C34'>详细>></font></a>
			&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
		<%
		}
		%>
		</td>
		</tr>
		<tr style='height:65px;'>
		<td class=td_dash valign='top'>
		<%
		if (lstLy.size()>=2)
		{
			ActLyM am=(ActLyM)lstLy.get(1);
		%>
			<table border="0" cellspacing="1" cellpadding="2" width=100% height=100% >
			<tr style='height:5px;'><td colspan=2></td></tr>
			<tr style='height:55px;'><td width=32 rowspan=2 align='left' valign='top'>
			<img src='<%=basePath%>/graph/net/<%=am.getHeadImg()%>' width=50 height=32/>
			</td><td align='left' valign='top'>
			<font color=#00C1A4><%=am.getNickName()%>：</font>
			<%=am.getLyContent()%>
			</td>
			</tr>
			<tr><td align='right' >
			<a href="javascript:doOpenLy('<%=am.getLyId()%>')"><font color='CB9C34'>详细>></font></a>
			&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
		<%
		}
		%>
		</td>
		</tr>
		<tr style='height:65px;'>
		<td class=td_dash valign='top'>
		<%
		if (lstLy.size()>=3)
		{
			ActLyM am=(ActLyM)lstLy.get(2);
		%>
			<table border="0" cellspacing="1" cellpadding="2" width=100% height=100% >
			<tr style='height:5px;'><td colspan=2></td></tr>
			<tr style='height:55px;'><td width=32 rowspan=2 align='left' valign='top'>
			<img src='<%=basePath%>/graph/net/<%=am.getHeadImg()%>' width=50 height=32/>
			</td><td align='left' valign='top'>
			<font color=#00C1A4><%=am.getNickName()%>：</font>
			<%=am.getLyContent()%>
			</td>
			</tr>
			<tr><td align='right' >
			<a href="javascript:doOpenLy('<%=am.getLyId()%>')"><font color='CB9C34'>详细>></font></a>
			&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
		<%
		}
		%>
		</td>
		</tr>
		<tr style='height:65px;'>
		<%
		if (lstLy.size()>=4)
		{
		%>
			<td valign='top'>
		<%
		}else
		{
		%>
			<td class='td_dash' valign='top'>
		<%
		}
		if (lstLy.size()>=4)
		{
			ActLyM am=(ActLyM)lstLy.get(3);
		%>
			<table border="0" cellspacing="1" cellpadding="2" width=100% height=100% >
			<tr style='height:5px;'><td colspan=2></td></tr>
			<tr style='height:55px;'><td width=32 rowspan=2 align='left' valign='top'>
			<img src='<%=basePath%>/graph/net/<%=am.getHeadImg()%>' width=50 height=32/>
			</td><td align='left' valign='top'>
			<font color=#00C1A4><%=am.getNickName()%>：</font>
			<%=am.getLyContent()%>
			</td>
			</tr>
			<tr><td align='right' >
			<a href="javascript:doOpenLy('<%=am.getLyId()%>')"><font color='CB9C34'>详细>></font></a>
			&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
		<%
		}
		%>
		</td>
		</tr>
		<tr><td></td></tr>
		</table>
	</td></tr>
	</table>
</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
