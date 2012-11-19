<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.NetXx"%>
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
if (!(strUserAcl.indexOf("999")>=0))
{
%>
	<jsp:forward page="login.jsp" />
<%
}
NetXx nx=(NetXx)request.getAttribute("waitDoc");
Integer intLmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
String strLmp="";
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 网站信息";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/lang/zh_CN.js"></script>
<script>
var editor1;
var editor2;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[name="aboutUs_p"]', {
		cssPath : '<%=basePath%>/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=basePath%>/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=basePath%>/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link','pagebreak'],
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
			});
		}
	});
	editor2 = K.create('textarea[name="xgSm_p"]', {
		cssPath : '<%=basePath%>/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=basePath%>/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=basePath%>/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link','pagebreak'],
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
			});
		}
	});
	prettyPrint();
});
</script>
<script LANGUAGE='Javascript'>
<!--
<%
if (nx!=null)
{
%>
	function toEdit()
	{
		var objA=document.getElementById('idWaitNew');
		var objB=document.getElementById('idSeek');

		objA.style.display='block';
		objB.style.display='none';
	}
<%
}else
{
%>

function toNew()
{
	var objA=document.getElementById('idWaitNew');
	var objB=document.getElementById('idSeek');

	objA.style.display='block';
	objB.style.display='none';
}
<%
}
%>
function doSubmit()
{
	var frm=document.form1;
	if (editor1.isEmpty() || editor2.isEmpty())
	{
		alert('对不起，相关说明及关于我们必须至少输入一项！');
		return ;
	}
	frm.aboutUs.value=editor1.html();
	frm.xgSm.value=editor2.html();
	if (confirm('确实提交吗？'))
	{
		<%
	    if (nx==null)
	    {
			%>
			frm.action='saveNetXx.action';
			<%
	    }else
	    {
			%>
			frm.action='updateNetXx.action';
			<%
	    }
		%>
		frm.submit();
	}
	
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'>
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
	<table cellspacing='0' cellpadding="0" border='0' width=950 >
	<tr>
	<td width=240 ><font color='#A9714E' size='5'>网站信息</font></td>
    <td valign="bottom" width=760 >&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693/></td>
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
    <td width=5% style='background:url(images/icon_dash.gif) repeat-y;' /></td>
    <td valign="top" align='left'>
	  	<s:form method="post" action='' name="form1" theme="simple" >
  		<input type='hidden' name='aboutUs' value=''/>
  		<input type='hidden' name='xgSm' value=''/>
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
		<tbody id='idSeek'>
        <tr>
        <td align='right' width=20% >关于我们:&nbsp;</td>
        <td align='left'>&nbsp;
		<%
		if (nx==null)
		{
			out.print("尚未提供相关数据！");
		}else
		{
			out.print(nx.getAboutUs());
		}
		%>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >相关说明:&nbsp;</td>
        <td align='left'>&nbsp;
		<%
		if (nx==null)
		{
			out.print("尚未提供相关数据！");
		}else
		{
			out.print(nx.getXgSm());
		}
		%>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<%
		if(nx==null)
		{
			%>
			<input type='button' value='新增' onclick='toNew()' />
			<%
		}else
		{
			%>
			<input type='button' value='编辑' onclick='toEdit()' />
			<%
		}
		%>
		</TD></TR>
		</tbody>
		<tbody id='idWaitNew' style='display:none;'>
        <tr>
        <td align='right' width=20% >关于我们:&nbsp;</td>
        <td align='left'>&nbsp;
        <%
        if (nx==null)
        {
			%>
			<textarea name="aboutUs_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"></textarea>
			<%
        }else
        {
			%>
			<textarea name="aboutUs_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=nx.getAboutUs()%></textarea>
			<%
        }
        %>
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >相关说明:&nbsp;</td>
        <td align='left'>&nbsp;
        <%
        if (nx==null)
        {
			%>
			<textarea name="xgSm_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"></textarea>
			<%
        }else
        {
			%>
			<textarea name="xgSm_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=nx.getXgSm()%></textarea>
			<%
        }
        %>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
		</tbody>
		</table>
		</s:form>
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
