<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.ActXx"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
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
strNav=strNav+" > <a href='"+basePath+"/sysmanaHd.action'><font color='#2F9681'>贝爱乐园</font></a>";
strNav=strNav+" > 新增活动";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/lang/zh_CN.js"></script>
<script>
var editor1;
var editor2;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[name="actContent_p"]', {
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
//					document.forms['form1'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
//					document.forms['form1'].submit();
			});
		}
	});
	editor2 = K.create('textarea[name="jpJs_p"]', {
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
//					document.forms['form1'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
//					document.forms['form1'].submit();
			});
		}
	});
	prettyPrint();
});
</script>

<script LANGUAGE='Javascript'>
<!--
function doSubmit()
{
	var doc=document.form1;
	var t1='';
	var t2='';
	if (doc.actName.value=='')
	{
		alert('对不起，请输入活动的主题！')
		return ;
	}
	if (doc.dtStart.value=='' || doc.dtEnd.value=='')
	{
		alert('对不起，请输入活动的起止时间！')
		return ;
	}
	if (!doc.actStatus[0].checked && !doc.actStatus[1].checked)
	{
		alert('对不起，请选择活动的当前状态！')
		return ;
	}
	t1=doc.fActImg.value;
	if (t1=='')
	{
		alert('请上传活动图标！');
		return ;
	}else
	{
		t2=t1.substring(t1.length-3,t1.length);
		if (t2.toUpperCase()!='JPG' && t2.toUpperCase()!='GIF')
		{
			alert('不支持该文件类型！');
			return ;
		}
	}
	if (editor1.isEmpty() || editor2.isEmpty())
	{
		alert('请输入活动规则及奖品介绍！');
		return ;
	}
	doc.actContent.value=editor1.html();
	doc.jpJs.value=editor2.html();
	if (confirm('确实提交吗？'))
	{
		doc.actImg.value=doc.fActImg.value;
		doc.submit();
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
		<font color='#A9714E' size='5'>贝爱乐园</font>
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
    <td width=5% style='background:url(images/icon_dash.gif) repeat-y;' /></td>
    <td valign="top" align='left'>
  	<s:form method="post" action="saveActXx" name="form1" theme="simple" enctype="multipart/form-data" >
		<input type='hidden' name='actImg' value='' />
		<input type='hidden' name='actContent' value='' />
		<input type='hidden' name='jpJs' value='' />

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% >活动名称:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value=""
			style="WIDTH: 400px" type="text" maxLength=50
				name="actName" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >开始地址:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value=""
			style="WIDTH: 400px" type="text" maxLength=50
				name="actLink" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >活动介绍:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='hdJs' cols="70" rows="5" ></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >活动规则:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='actContent_p' cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >奖品介绍:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='jpJs_p' cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >开始时间:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value=""
			style="WIDTH: 100px" type="text" maxLength=50
				name="dtStart" minlength="6">        
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >结束时间:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value=""
			style="WIDTH: 100px" type="text" maxLength=50
				name="dtEnd" minlength="6">        
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >当前状态:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<input type='radio' name='actStatus' value='1' />开放
			&nbsp;<input type='radio' name='actStatus' value='2' />关闭
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >活动图标:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
				<input type=file name='fActImg' size=60>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href="javascript:doSubmit()" /><img src="images/btnWytj.gif" /></a>
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
