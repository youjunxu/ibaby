<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.BaType"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
if (flagUser==0 || objUser==null)
{
%> 
	<jsp:forward page="login.jsp" />
<%
}
LmBaxy lm=(LmBaxy)request.getAttribute("waitEdit_doc");
List lstBalx=(List)request.getAttribute("waitList_balx");
if (lm==null)
{
	%>
		<jsp:forward page="error.jsp" />
	<%
}
Integer intLmp;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要分享</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="vender/assets/stylesheets/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="vender/assets/stylesheets/chosen.css" rel="stylesheet" type="text/css"/>
<link href="assets/stylesheets/tags.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="vender/assets/javascripts/jquery.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/jquery-ui.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/chosen.jquery.js"></script>
<script type="text/javascript" src="vender/assets/javascripts/ajax-chosen.js"></script>
<script type="text/javascript" src="assets/javascripts/application.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
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

<script language="javascript">
function doSubmit()
{
	var frm=document.form1;
	var t1='';
	
	if(frm.strTitle.value=='')
	{
		alert('请输入主题！');
		return false;
	}
	if(frm.strContent.value=='')
	{
		alert('请输入文章摘要！');
		return false;
	}
	if(frm.strMemo.value=='')
	{
		alert('请输入文章内容！');
		return false;
	}
	t1=getValueBySelected(frm.lmCode,1);
	if(t1=='')
	{
		alert('请输入所属板块！');
		return false;
	}
	if (editor1.isEmpty())
	{
		alert('请输入文章内容！');
		return false;
	}
	frm.strMemo.value=editor1.html();
	
	if (confirm('确实提交修改吗？'))
	{
		frm.submit();
	}
}
function doChgLm()
{
	var frm=document.form1;
	var n;
	
	n=frm.lmCode.selectedIndex;
	if (n==-1)
	{
		frm.lmName.value='';
	}else
	{
		frm.lmName.value=frm.lmCode.options[n].text;
	}
}
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
    	<td align="left">
    		您现在所在的位置: <a href='<%=basePath%>'>首页</a> > <a href='<%=basePath%>/toMyHome.action'>我的家</a> > <a href='<%=basePath%>/myPersonContent.action'>博文列表</a>
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td style='height:40px;'>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%;'>
	<tr>
	<td align='center' width=20%>
		<font color='#1F9393' size='4'><b>我要分享</b></font>
	</td>
    <td>&nbsp;</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td align=center >
  	<s:form method="post" action="updateBaxy" name="form1" theme="simple" >
  	<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
  	<input type='hidden' name='baId' value='<%=lm.getBaId()%>'/>
  	<input type='hidden' name='userName' value='<%=objUser.getUserName()%>'/>
  	<input type='hidden' name='lmName' value='<%=lm.getLmName()%>'/>
  	<input type='hidden' name='strMemo' value='<%=lm.getStrMemo()%>'/>
	<table cellspacing='0' cellpadding="0" border='0' width=750 align="center" style='margin-left:50px;'>
	<tr style='height:25px;'><td colspan=2>&nbsp;</td></tr>
	<tr>
	<td align='right' width=10%>主题<font color=red>*</font>：</td>
    <td colspan=3 align='left'>&nbsp;
    <INPUT class=form value="<%=lm.getStrTitle()%>"
			style="WIDTH: 400px" type="text" maxLength=100
				name="strTitle" minlength="1">
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>作者：</td>
    <td width=37% align='left'>&nbsp;
    <INPUT class=form value="<%=lm.getStrAuthor()%>"
			style="WIDTH: 200px" type="text" maxLength=32
				name="strAuthor" >
    </td>
	<td align='right' width=12%>来源：</td>
    <td align='left'>&nbsp;
    <INPUT class=form value="<%=lm.getFromName()%>"
			style="WIDTH: 200px" type="text" maxLength=100
				name="fromName" >
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>提要<font color=red>*</font>：</td>
	<td colspan=3 align='left'>&nbsp;&nbsp;<textarea name='strContent' cols=70 rows="4" style='overflow-y:auto;overflow-x:auto;'><%=lm.getStrContent()%></textarea></td>
    </tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr >
	<td align='right'>内容<font color=red>*</font>：</td>
	<td colspan=3 align='left' valign="top">&nbsp;
		<textarea name="strMemo_p" cols="100" rows="8" style="width:600px;height:200px;visibility:hidden;"><%=lm.getStrMemo()%></textarea>
	</td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>板块<font color=red>*</font>：</td>
    <td width=37% align='left'>&nbsp;
    	<select name='lmCode' onchange='doChgLm()' id="module_input">
    	<option value=''></option>
    	<%
    	for (intLmp=0;intLmp<lstBalx.size();intLmp++)
    	{
    		BaType b=(BaType)lstBalx.get(intLmp);
   			if ("译言堂".equals(b.getLmName()))
   			{
				if (strUserAcl.indexOf("999")>=0 | strUserAcl.indexOf("507")>=0)
   				{
	        		if (b.getLmId().equals(lm.getLmCode()))
	        		{
	       				out.println("<option value='"+b.getLmId().toString()+"' selected>"+b.getLmName()+"</option>");
	        		}else
	        		{
	       				out.println("<option value='"+b.getLmId().toString()+"'>"+b.getLmName()+"</option>");
	        		}
   				}
    		}else
    		{
        		if (b.getLmId().equals(lm.getLmCode()))
        		{
            		out.println("<option value='"+b.getLmId().toString()+"' selected>"+b.getLmName()+"</option>");
        		}else
        		{
            		out.println("<option value='"+b.getLmId().toString()+"'>"+b.getLmName()+"</option>");
        		}
    		}

    	}
    	%>
    	</select>
    </td>
	<td align='right' width=8%>标签：</td>
    <td align='left'>
        <select data-placeholder="Choose tags" name="tags" id="tag_input" multiple="multiple" class="chzn-select"></select>
    </td>
	</tr>
	<tr style='height:22px;'>
	<td colspan=3></td>
	<td style='text-align:left;'><font color=red>&nbsp;&nbsp;备注：多值请用半角逗号隔开。</font></td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=20 colspan=4></TD></TR>
	<TR><TD colspan=4 align="center">
	<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/formBtn_wyfx.gif" /></a>
	</TD></TR>
	</table>
	</s:form>
</td>
</tr>
<tr style='height:5px;'><td>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>