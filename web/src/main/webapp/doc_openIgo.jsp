<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LineIgo"%>
<%@ page import="java.io.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (objUser==null || flagUser!=9)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
 
LineIgo ig=(LineIgo)request.getAttribute("waitDisp_doc");

Integer intLmp;
Integer intTmp;
String strLmp="";
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaG.action'><font color='#2F9681'>IGO管理</font></a>";
strNav=strNav+" > IGO查看";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">IGO</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;' >
	    <table width=100% >
    	<tr>
        <td width=4%></td>
    	<td align="left" >
    		您现在所在的位置: &nbsp;&nbsp;&nbsp;&nbsp;<%=strNav%>
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td style='height:40px;'>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%;'>
	<tr>
	<td width=20%>
		<font color='#A9714E' size='5'>IGO管理</font>
	</td>
    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=90%/></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%; font-size: 12px;'>
	<tr>
	<td width=20% valign="top">
	<!-- 左侧菜单// -->
	</td>
    <td width=45 style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' ></td>
    <td valign='top' align='left'>
    
		<table cellspacing='0' cellpadding="0" border='0' style='width:94%; height:100%; font-size: 12px;'>
		<tr style='height:20px;'><td colspan=4></td></tr>
		<tr>
		<td align='right' width=100>商品名称：</td>
		<td align='left' colspan=3>
		<%=ig.getIgoName()%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>类型：</td>
		<td align='left' width=200>
			<%=ig.getIgoTypeName()%>
		</td>
		<td align='right' width=100>品牌：</td>
		<td align='left'>
			<%=ig.getBrandName()%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'><%=ig.getStrZbmc()==null?"相关指标":ig.getStrZbmc()%></td>
		<td align='left' width=200>
			<%=ig.getIgoSection()%><%=ig.getStrZbdw()==null?"":ig.getStrZbdw()%>
		</td>
		<td align='right' width=100>官方指导价：</td>
		<td align='left'>
		<%=ig.getIgoGuide()%> 元
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>产地：</td>
		<td align='left' colspan=3>
		<%=ig.getIgoOriginal()%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户所在网址：</td>
		<td align='left' colspan=3>
		<%=ig.getIgoShmcA()%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户名称：</td>
		<td align='left' colspan=3>
		<%
			if (ig.getIgoShmcB()!=null)
			{
				if (ig.getIgoShLink()==null)
				{
					out.print(ig.getIgoShmcB());
				}else
				{
					out.print("<a href='"+ig.getIgoShLink()+"'>"+ig.getIgoShmcB()+"</a>");
				}
			}
		%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户信用：</td>
		<td align='left' colspan=3>
		<%
		if (ig.getIgoXy()>0)
		{
			strLmp="";
			for (intLmp=1;intLmp<=ig.getIgoXy();intLmp=intLmp+1)
			{
				if (intLmp>1) strLmp=strLmp+"&nbsp;";
				strLmp=strLmp+"<img src='"+basePath+"/images/igo_xy.gif' />";
			}
			out.print(strLmp);
		}
		%>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		</table>
    
	</td></tr>
	<tr>
	<td colspan=3 style='height:20px;'></td>
	</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
