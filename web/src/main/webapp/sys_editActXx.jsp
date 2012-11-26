<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
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

ActXx sp=(ActXx)request.getAttribute("waitOpen_actXxDoc");
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
var editor2;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[name="actContent"]', {
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
	editor2 = K.create('textarea[name="jpJs"]', {
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
	if (t1!='')
	{
		t2=t1.substring(t1.length-3,t1.length);
		if (t2.toUpperCase()!='JPG' && t2.toUpperCase()!='GIF')
		{
			alert('不支持该文件后缀类型！');
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

	if (confirm('确实提交此次修改吗？'))
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
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>&nbsp;
    </td>
</tr>
<tr>
<td align=center>

  	<s:form method="post" action="updateActXx" name="form1" theme="simple" enctype="multipart/form-data" >
		<input type='hidden' name='actId' value='<%=sp.getActId()%>' />
		<input type='hidden' name='actImg' value='' />
		
		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% >活动名称:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value="<%=sp.getActName()%>"
			style="WIDTH: 400px" type="text" maxLength=50
				name="actName" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >开始地址:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
            <INPUT class=form value="<%=sp.getActLink()==null?"":sp.getActLink()%>"
			style="WIDTH: 400px" type="text" maxLength=50
				name="actLink" minlength="6">        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >活动介绍:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='hdJs' cols="70" rows="5" ><%=sp.getHdJs()==null?"":sp.getHdJs()%></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >活动规则:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='actContent' cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=sp.getActContent()==null?"":sp.getActContent()%></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >奖品介绍:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
			<textarea name='jpJs' cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=sp.getJpJs()==null?"":sp.getJpJs()%></textarea></td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >开始时间:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
        <%
        date=simpleDateFormat.parse(sp.getDtStart());
		strFbsj=simpleDateFormat.format(date);
        %>
            <INPUT class=form value="<%=strFbsj%>"
			style="WIDTH: 100px" type="text" maxLength=50
				name="dtStart" minlength="6">        
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >结束时间:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
        <%
        date=simpleDateFormat.parse(sp.getDtEnd());
		strFbsj=simpleDateFormat.format(date);
        %>
            <INPUT class=form value="<%=strFbsj%>"
			style="WIDTH: 100px" type="text" maxLength=50
				name="dtEnd" minlength="6">        
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >当前状态:&nbsp;<font color=red>*</font>&nbsp;</td>
        <td align='left'>&nbsp;
        <%
        if (sp.getActStatus()==1)
        {
            %>
			<input type='radio' name='actStatus' checked value='1' />开放
			&nbsp;<input type='radio' name='actStatus' value='2' />关闭
			<%
        }else
        {
            if (sp.getActStatus()==2)
            {
                %>
    			<input type='radio' name='actStatus' value='1' />开放
    			&nbsp;<input type='radio' name='actStatus' checked value='2' />关闭
    			<%
            }else
            {
                %>
				<input type='radio' name='actStatus' value='1' />开放
				&nbsp;<input type='radio' name='actStatus' value='2' />关闭
	    		<%
            }
        }
        %>
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
        <tr style='height:25px;'>
        <td align='right' width=20% >&nbsp;</td>
        <td align='left' valign='middle'>&nbsp;&nbsp;
			<font color=red>备注：如果不上传，将继续采用原图标。</font>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr >
        <td align='right' width=20% >原图标展示:&nbsp;&nbsp;</td>
        <td align='left'>
        <%
        if (sp.getActImg()!=null && !"".equals(sp.getActImg()))
        {
            Integer iw=640;
            Integer ih=480;
            if (sp.getPhotoWidth()!=null)
            {
            	if (sp.getPhotoWidth()<iw) iw=sp.getPhotoWidth();
            }
            if (sp.getPhotoHeight()!=null)
            {
            	if (sp.getPhotoHeight()<ih) ih=sp.getPhotoHeight();
            }
        %>
			<img src='<%=basePath%>/graph/game/<%=sp.getActImg()%>' width=<%=iw%> height=<%=ih%> />
		<%
        }
		%>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()' /><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		</table>
	</s:form>


</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>

