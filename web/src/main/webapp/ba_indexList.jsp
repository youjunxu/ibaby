<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
<%@ page import="java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

	List lsA=(List)request.getAttribute("baIndex_noYyt");
	List lsB=(List)request.getAttribute("baIndex_yyt");
	Integer intA;
	Integer intB;
	
	intA=0;
	if (lsA==null)
	{
		intA=1;
	}else
	{
		if (lsA.size()==0)
		{
			intA=1;
		}
	}
%>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script LANGUAGE='Javascript'>
var oBrowser=appInfo();
//alert(window.navigator.userAgent);
//alert(window.navigator.appName);
function doSeekMore(strBj)
{
	if (strBj=='1')
	{
		location.href='${request.contextPath}/firstBA.action';
	}else
	{
		location.href='${request.contextPath}/baSeekList.action?lmCode=' + strBj;
	}
}
function doOpenBaDoc(strId)
{
	location.href='${request.contextPath}/prevOpenBADoc.action?baId=' + strId;
}
</script>
<table style='width:400px;' cellspacing='0' cellpadding='0' border='0' height=512>
	<tr style='height:40px;'>
	<td style='width:300px;' align="left"><img src="<%=basePath%>/images/index_icon_19.gif" width=217 height=34 /></td>
	<td style='width:100px;' align="right" valign="middle">
	<a href='javascript:doSeekMore(1)'><img src="<%=basePath%>/images/index_icon_28.gif" width=50 height=19 /></a> 
	</td>
	</tr>
	<%
	if (intA==0)
	{
		intB=lsA.size();
		if (intB>8) intB=8;
		for (intA=0;intA<intB;intA=intA+1)
		{
			LmBaxy lm=(LmBaxy) lsA.get(intA);
			%>
			<tr style='height:28px;'>
			<td align="left" style='font-size:12px;color:#7b7c7c;' valign='middle' class=td_dash ><img src='<%=basePath%>/images/index_icon_21.gif' width=12 height=12 /><a href="javascript:doOpenBaDoc('<%=lm.getBaId()%>')"><%=lm.getStrTitle()%></a></td>
			<td align="right" style='font-size:12px;color:#cccccc;' valign='middle' class=td_dash ><%=lm.getReaders()%>&nbsp;阅读</td>
			</tr>
			<%
		}
		intA=intB;
		if (intB<8){
			intA=(8-intA)*28;
			%>
			<tr><td colspan=2 style='height:<%=intA%>px;'>&nbsp;</td></tr>
			<%
		}
	}else
	{
	%>
	  <tr><td colspan=2 style='height:224px;'>&nbsp;</td></tr>
	<%
	}
	%>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr style='height:40px;'>
	<td style='width:300px;' align="left"><img src="<%=basePath%>/images/index_icon_39.gif" width=184 height=37 /></td>
	<td style='width:100px;' align="right" valign="middle">
	<a href='javascript:doSeekMore(6)'><img src="<%=basePath%>/images/index_icon_28.gif" width=50 height=19 /></a> 
	</tr>
<%
	intA=0;
	if (lsB==null)
	{
		intA=1;
	}else
	{
		if (lsB.size()==0)
		{
			intA=1;
		}
	}
	if (intA==0)
	{
		intB=lsB.size();
		if (intB>8) intB=8;
		for (intA=0;intA<intB;intA=intA+1)
		{
			LmBaxy lm=(LmBaxy) lsB.get(intA);
			%>
			<tr style='height:28px;'>			
			<td align="left" style='font-size:12px;color:#7b7c7c;' valign='middle' class=td_dash ><img src='<%=basePath%>/images/index_icon_21.gif' width=12 height=12 /><a href="javascript:doOpenBaDoc('<%=lm.getBaId()%>')"><%=lm.getStrTitle()%></a></td>
			<td align="right" style='font-size:12px;color:#cccccc;' valign='middle' class=td_dash ><img src='<%=basePath%>/images/index_icon_21.gif' width=12 height=12 /><%=lm.getReaders()%>&nbsp;阅读</td>
			</tr>
			<%
		}
		intA=intB;
		if (intB<8){
			intA=(8-intA)*28;
			%>
			<tr style='height:<%=intA%>px;'><td colspan=2>&nbsp;</td></tr>
			<%
		}
	}else
	{
	%>
	  <tr><td colspan=2 style='height:224px;'>&nbsp;</td></tr>
	<%
	}
	%>
</table>
