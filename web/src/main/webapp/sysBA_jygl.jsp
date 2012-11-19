<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.BaDocSh"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

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
String strNav="";
Integer intBj=(Integer)request.getAttribute("waitDisp_bj");
BaDocSh bd=(BaDocSh)request.getAttribute("waitDisp_doc");
if (intBj==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
if (intBj!=1 & intBj!=0)
{
	%>
	<jsp:forward page="error.jsp" />
	<%
}

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 文档校验管理";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doSubmit()
{
	var doc=document.form1;
	if (!doc.reEdit[0].checked && !doc.reEdit[1].checked)
	{
		alert('对不起，请选择重新编辑后的文档是否需要再次审核！')
		return ;
	}
	if (doc.shKey.value=='')
	{
		alert('请输入文档不能包含的关键字、词！');
		return;
	}
	if (confirm('确实提交吗？'))
	{
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
		<font color='#A9714E' size='5'>文档校验管理</font>
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
    <%
    if (intBj==1)
    {
	    %>
  		<s:form method="post" action="updateBaDocSh" name="form1" theme="simple" >
  		<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
  		<input type='hidden' name='userName' value='<%=objUser.getUserName()%>'/>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% >再次编辑是否重审：<font color=red>*</font>&nbsp;</td>
        <td align='left'>
            <INPUT type=radio name='reEdit' value='1' <%=bd.getReEdit()==1?"checked":""%> />是        
            &nbsp;<INPUT type=radio name='reEdit' value='0' <%=bd.getReEdit()==0?"checked":""%> />否        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >文档关键词<font color=red>*</font></td>
        <td align='left'>
			<textarea name='shKey' cols=70 rows="10" ><%=bd.getShKey()%></textarea>
		</td>
        </tr>
        <tr style='height:20px;'>
        <td align='right' ></td>
        <td align='left'>
		<font color=red>备注：多值间请用半角逗号隔开</font>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
		</s:form>
    	<%
    }else
    {
        %>
      	<s:form method="post" action="saveBaDocSh" name="form1" theme="simple" >
  		<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
  		<input type='hidden' name='userName' value='<%=objUser.getUserName()%>'/>

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='right' width=20% >再次编辑是否重审：<font color=red>*</font>&nbsp;</td>
        <td align='left'>
            <INPUT type=radio name='reEdit' value='1'>是        
            &nbsp;<INPUT type=radio name='reEdit' value='0'>否        
        </td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
        <tr>
        <td align='right' width=20% >文档关键词<font color=red>*</font></td>
        <td align='left'>
			<textarea name='shKey' cols=70 rows="10" ></textarea>
		</td>
        </tr>
        <tr style='height:20px;'>
        <td align='right' ></td>
        <td align='left'>
		<font color=red>备注：多值间请用半角逗号隔开</font>
		</td>
        </tr>
			<tr><td style='height:5px;' colspan=2 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=2>&nbsp;</td></tr>
		<TR><TD colspan=2 align="center">
		<a href='javascript:doSubmit()'><img src="images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
		</s:form>
        <%
    }
    %>
</td>
</tr>
<tr style='height:1px;'><td colspan=3>&nbsp;</td></tr>
</table>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
