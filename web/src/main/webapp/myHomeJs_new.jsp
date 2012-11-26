<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.HomeJs"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
if (objUser==null || ej==null || flagUser==0)
{
%>
	<jsp:forward page="login.jsp" />
<%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script>
var editor1;
	KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="strMemo_p"]', {
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
var oIE=appInfo();
function doSubmit()
{
	var frm=document.form1;
	if (frm.jsTitle.value=='' )
	{
		alert('请输入标题！');
		return ;
	}
	if (editor1.isEmpty())
	{
		alert('请输入文章内容！');
		return false;
	}
	frm.strMemo.value=editor1.html();
	if (!frm.docLevel[0].checked && !frm.docLevel[1].checked && !frm.docLevel[2].checked)
	{
		alert('请选择文档观看级别！');
		return ;
	}
	if (frm.docLevel[2].checked)
	{
		if (frm.docPass.value=='')
		{
			alert('请设置文档观看密码！');
			return ;
		}
	}else
	{
		frm.docPass.value='';
	}
	if (confirm('确实提交吗？'))
	{
		frm.submit();
	}
}
function doChgAcl()
{
	var frm=document.form1;
	var objA=frm.docLevel;
	var objB=frm.docPass;
	var objD=document.getElementById('idDocPass0');
	var objE=document.getElementById('idDocPass1');
	var objF=document.getElementById('idDocPass2');

	if(oIE.appname=='chrome')
	{
		if (objF) objF.style.display='none';
		if (objA[2].checked)
		{
			if (objF) objF.style.display='block';
		}else
		{
			objB.value='';
		}
	}else
	{
		if (objE) objE.parentElement.style.display='none';
		if (objA[2].checked)
		{
			if (objE) objE.parentElement.style.display='block';
		}else
		{
			objB.value='';
		}
	}
}
</script>
</head>
<body onload='doChgAcl()'>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(images/top_bottom.gif) no-repeat;'/>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">HOMEJS</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td colspan=3></td></tr>
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
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toContent('BA')"><font color='#33927E'>贝爱学园</font></a>
    			</td>
    			<td >&nbsp;</td>
    			<td >&nbsp;</td>
				</tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/firstMyHomeJs.action'><font color='#33927E'>博文记事</font></a>
    			</td>
    			<td >&nbsp;</td>
    			<td >&nbsp;</td>
				</tr>
	    		<tr style='height:40px;' ><td colspan=3></td></tr>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
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
  		<s:form method="post" action="saveHomeJs" name="form1" theme="simple" >
  		<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
	  	<input type='hidden' name='userName' value='<%=objUser.getUserName()%>'/>
	  	<input type='hidden' name='strMemo' value=''/>
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
   		<tr style='height:10px;' ><td colspan=2></td></tr>
		<tr>
		<td align='right' width=70 >主题<font color=red>*</font>：</td>
    	<td align='left'>&nbsp;
    	<INPUT class=form value="" style="WIDTH: 400px" type="text" name="jsTitle" />
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >摘要<font color=red>*</font>：</td>
    	<td align='left'>&nbsp;
    	<INPUT class=form value="" style="WIDTH: 400px" type="text" name="strContent" />
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >内容<font color=red>*</font>：</td>
    	<td align='left'><textarea name="strMemo_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"></textarea>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr style='height:20px;'>
		<td align='right' width=70 >文档级别<font color=red>*</font>：</td>
    	<td align='left'>&nbsp;
    	<INPUT class=form value="0" type="radio" name="docLevel" style='border:0px;' onclick='doChgAcl()' />仅自己可看
    	&nbsp;<INPUT class=form value="1" type="radio" name="docLevel" style='border:0px;' onclick='doChgAcl()' />全部用户可看
    	&nbsp;<INPUT class=form value="2" type="radio" name="docLevel" style='border:0px;' onclick='doChgAcl()' />需要验证密码
    	</td>
		</tr>
		<tr id='idDocPass0' style='height:20px;'>
   		<td id='idDocPass1' align='right' >口令<font color=red>*</font>：
   		</td>
   		<td id='idDocPass2' ><input type="password" class="input_seabox" value="" style="WIDTH: 100px" maxLength=20 minLength=1 name='docPass' />
   		</td>
   		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<TR><TD height=8 colspan=2 align='center'>
			<a href='javascript:doSubmit()'><img src='<%=basePath%>/images/btnWytj.gif' /></a>
		</TD></TR>
   		<tr style='height:5px;' ><td colspan=2 class=td_dash></td></tr>
		</table>
		</s:form>
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
