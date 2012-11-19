<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.SpBrand"%>
<%@ page import="com.lhq.prj.bms.po.SpType"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
List lss=(List)request.getAttribute("waitList_lx");
String strLmp;
Integer intLmp;
Integer intTmp;
if (flagUser==0)
{
%>
	<jsp:forward page="login.jsp" />
<%
}
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaPP.action'><font color='#2F9681'>品牌管理</font></a>";
strNav=strNav+" > 新增品牌";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doSubmit()
{
	var doc=document.form1;
	var t1='';

	if (doc.brandName.value=='' || doc.spTypeName.value=='')
	{
		alert('对不起，请选择类型并输入该类型下的品牌！')
	}else
	{
		t1=doc.fiBrandImg.value;
		t2=t1.substring(t1.length-3,t1.length);
		if (t2.toUpperCase()!='JPG' && t2.toUpperCase()!='GIF')
		{
			alert('不支持该文件后缀类型！');
		}else
		{
			doc.brandImg.value=t1;
			if (confirm('确实提交吗？'))
			{
				doc.submit();
			}
		}
	}
}
function doChgLx()
{
	var doc=document.form1;
	var t1=getValueBySelected(doc.spTypeId,"1");
	doc.spTypeName.value=t1;
}
function checkPx()
{
	var frm=document.form1;
	if (!checkIsNumber(frm.dispXh))
	{
		frm.dispXh.value='';
		return false;
	}
	return true;
}

//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
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
	<td width=240>
		<font color='#A9714E' size='5'>品牌管理</font>
	</td>
    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693 /></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%; height:500px; font-size: 12px;'>
	<tr>
	<td width=20% valign="top">
	<jsp:include page="sys_left.jsp" />
	</td>
    <td width=5% style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' /></td>
    <td valign="top" align='left'>
   	<s:form method="post" action='saveSpBrand.action' name="form1" theme="simple" enctype="multipart/form-data" >
  	<input type='hidden' name='spTypeName' value='' />
  	<input type='hidden' name='brandImg' value='' />
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
   		<tr><td style='height:30px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font size=4>所属类型：</font></td>
        <td align='left'>
	   	 	<select name='spTypeId' onchange='doChgLx()'>
	   	 		<option value=''></option>
			<%
			if (lss.size()>0)
			{
				for (intLmp=0;intLmp<lss.size();intLmp++)
				{
					SpType tp=(SpType) lss.get(intLmp);
					out.println("<option value='"+tp.getSpTypeId()+"' >"+tp.getSpTypeName()+"</option>");
				}
			}
			%>
	   	 	</select>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font size=4>品牌名称：</font></td>
        <td align='left'>
            <INPUT class=form value=""
			style="WIDTH: 400px" type="text" maxLength=32
				name="brandName" minlength="6">
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
		<td align='right'>排序号：</td>
		<td align='left' >
		<INPUT class=form value=""
			style="WIDTH: 20px" type="text" maxLength=10
				name="dispXh" onchange='checkPx()'/>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% ><font size=4>品牌LOG：</font></td>
        <td align='left'>
			<input type=file name='fiBrandImg' size=60 />
        </td>
        </tr>
        <tr>
        <td align='right' width=20% ><font size=4>品牌LOG：</font></td>
        <td align='left'>
			<font color=red>备注：图片宽度和高度分别不超过78、41。</font>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
	</s:form>
	</td>
	</tr>
	<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
