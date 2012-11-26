<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.Spgg"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer flagAdmin=0;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date date;

if (objUser!=null)
{
	if (strUserAcl.indexOf("999")>=0 && flagUser==9)
	{
		flagAdmin=1;
	}
}

Spgg sp=(Spgg)request.getAttribute("waitOpen_spggDoc");
Integer iEdit=(Integer)request.getAttribute("waitOpen_Edit");

if (sp==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
if (iEdit==null)
{
	iEdit=0;
}
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
date=simpleDateFormat.parse(sp.getDtCrea());
strFbsj=simpleDateFormat.format(date);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文章</title>
<link href="'<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" src="<%=basePath%>/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=basePath%>/kindeditor/lang/zh_CN.js"></script>
<script>
var editor1;
	KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="strContent_p"]', {
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
<%
	if(flagAdmin==1)
	{
%>
function doSubmit()
{
	var doc=document.form1;
	if (doc.strTitle.value=='' )
	{
		alert('对不起，请输入信息的主题！')
		return false;
	}
	if (editor1.isEmpty())
	{
		alert('请输入文章内容！');
		return ;
	}
	doc.strContent.value=editor1.html();
	doc.submit();
}
function doEdit()
{
	location.href='<%=basePath%>/sysGgOpen.action?flagEdit=1&ggId=<%=sp.getGgId()%>';
}
<%
	}
%>
//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SYS</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>&nbsp;
    </td>
</tr>
<tr>
<td align=center>
<%
	if (iEdit==0)
	{
%>
	<table cellspacing='0' cellpadding="0" border='0' style='width:500px;margin-left:33px;'>
	<tr>
	<td align=center valign=middle style='font-size:24px;'><%=sp.getStrTitle()%></td>
	</tr>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD height=12 align=center valign=middle><%=sp.getStrAuthor()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+strFbsj%></TD></TR>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD style='word-break:always;' align=left><%=sp.getStrContent()%></TD></TR>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD style='word-break:always;' align=left><%=sp.getMkCode().equals("BALY")?"贝爱乐园":"贝爱学园"%></TD></TR>
	<%
	if(flagAdmin==1)
	{
%>
	<TR><TD height=8 class=td_dash></TD></TR>
	<TR><TD height=12 >&nbsp;</TD></TR>
	<TR><TD ><input type="button" value='编辑' onClick='doEdit()'></TD></TR>
	<%
	}
	%>
	<TR><TD height=25 >&nbsp;</TD></TR>
	</table>
	<%
	}else
	{
	%>
	  	<s:form method="post" action="updateSpgg" name="form1" theme="simple" >
	  	<input type='hidden' name='ggId' value='<%=sp.getGgId()%>'/>
	  	<input type='hidden' name='strContent' value='<%=sp.getStrContent()%>'/>
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% >主题:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value="<%=sp.getStrTitle()%>"
			style="WIDTH: 400px" type="text" maxLength=32
				name="strTitle" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' >内容:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name="strContent_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=sp.getStrContent()%></textarea>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >所属栏目:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
        	<%
        	if (sp.getMkCode().equals("BALY"))
        	{
            	%>
    		  	<input type='radio' name='mkCode' value='BALY' checked />&nbsp;贝爱乐园
    		  	&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='mkCode' value='BAXY' />&nbsp;贝爱学园
        		<%
        	}else
        	{
            	%>
    		  	<input type='radio' name='mkCode' value='BALY' />&nbsp;贝爱乐园
    		  	&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='mkCode' value='BAXY' checked />&nbsp;贝爱学园
        		<%
        	}
        	%>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' >发布时间:&nbsp;&nbsp;</td>
        <td align='left'>&nbsp;
			<%=strFbsj%></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' >发布人:&nbsp;&nbsp;</td>
        <td align='left'>&nbsp;
			<%=sp.getStrAuthor()%></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
   		<tr><td style='height:20px;' colspan=2>&nbsp;</td></tr>
		</table>
	</s:form>
	<%
	}
	%>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>

