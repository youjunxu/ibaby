<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.HomeJs"%>
<%@ page import="net.fckeditor.*" %>

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
HomeJs hj=(HomeJs)request.getAttribute("waitEdit_doc");
if (hj==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/global.js"></script>
<script LANGUAGE='Javascript'>
var oIE=appInfo();
function doSubmit()
{
	var frm=document.form1;
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
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
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
    			<td >&nbsp;</td></tr>
	    		<tr><td>
	    			&nbsp;&nbsp;&nbsp;&nbsp;<a href='<%=basePath%>/firstMyHomeJs.action'><font color='#33927E'>博文记事</font></a>
    			</td>
    			<td >&nbsp;</td>
    			<td >&nbsp;</td></tr>
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
  		<s:form method="post" action="updateAclHomeJs" name="form1" theme="simple" >
  		<input type='hidden' name='jsId' value='<%=hj.getJsId()%>'/>
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
   		<tr style='height:10px;' ><td colspan=2></td></tr>
		<tr>
		<td align='right' width=70 >主题：</td>
    	<td align='left'>&nbsp;
    	<%=hj.getJsTitle()%>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >摘要：</td>
    	<td align='left'>&nbsp;
    	<%=hj.getStrContent()%>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr>
		<td align='right' width=70 >内容：</td>
    	<td align='left'>&nbsp;
		<%=hj.getStrMemo()%>
    	</td>
		</tr>
		<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
		<TR><TD height=8 colspan=2></TD></TR>
		<tr style='height:20px;'>
		<td align='right' width=70 >文档权限：</td>
    	<td align='left'>&nbsp;
    	<%
    		if (hj.getDocLevel()==0)
    		{
    			out.println("<input type=radio name='docLevel' value='0' checked onclick='doChgAcl()'/>仅自己可看");
    			out.println("<input type=radio name='docLevel' value='1' onclick='doChgAcl()'/>全部可看");
    			out.println("<input type=radio name='docLevel' value='2' onclick='doChgAcl()'/>需要密码验证");
    		}else
    		{
    			out.println("<input type=radio name='docLevel' value='0' onclick='doChgAcl()'/>仅自己可看");
        		if (hj.getDocLevel()==1)
        		{
        			out.println("<input type=radio name='docLevel' value='1' checked onclick='doChgAcl()'/>全部可看");
        			out.println("<input type=radio name='docLevel' value='2' onclick='doChgAcl()'/>需要密码验证");
        		}else
        		{
        			out.println("<input type=radio name='docLevel' value='1' onclick='doChgAcl()'/>全部可看");
            		if (hj.getDocLevel()==2)
            		{
            			out.println("<input type=radio name='docLevel' value='2' checked onclick='doChgAcl()'/>需要密码验证");
            		}
        		}
    		}
    	%>
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
