<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String tmpa=request.getParameter("E");
Integer intEdit=0;
if (tmpa!=null) intEdit=Integer.valueOf(tmpa);
String strCss="";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱一家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE='Javascript'>
function toContent()
{
	var t1='';
	t1='<%=basePath%>/myPersonContent.action';
	location.href=t1;
}
function toGrPhoto()
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action';
	location.href=t1;
}
function doEdit()
{
	var objA=document.getElementById('idDisp');
	var objB=document.getElementById('idEdit');
	if (objA) objA.style.display='none';
	if (objB) objB.style.display='block';
}
function doSubmit()
{
	var doc=document.form1;
	var t1='';
	<%
	if (objUser.getUserStatus()==0)
	{
		%>
		alert('请您先进行邮箱验证！');
		<%
	}else
	{
	%>
		if (doc.ejName.value=='')
		{
			alert('请输入家名！');
		}else
		{
			if (confirm('确实更新吗？'))
			{
				doc.submit();
			}
		}
	<%
	}
	%>
}
</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='width:100px;font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">BASEINFO</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td ></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=95% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr style='width:189px;height:165px;'>
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;height:165px;background:url(images/content_bk.gif) no-repeat;'>
	    	<tr><td align='left' >
				<s:action name="myPageLeft" executeResult="true" >
					<s:param name="leftMk">EHOME</s:param>
				</s:action>
    		</td>
	    	</tr>
	    	</table>
    	</td>
    	</tr>
    	<tr>
    	<td></td>
    	</tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
    	<table border='0' cellspacing='0' cellpadding='0' width=95% height=100% style='margin-left:30px;' >
    	<tr style='height:5px;'><td ></td></tr>
    	<tr>
    	<td>
    	<!-- 显示区 -->
    	<%
    	if (intEdit==0)
    	{
    		strCss="display:none;";
    	%>
   			<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align=center id='idDisp' >
				<TR><TD height=15 colspan=3></TD></TR>
				<TR>
					<td style='width:20px;' ></td>
					<TD align='left' style='width:100px;' >
						<SPAN class=content_black_bold>用户名： &nbsp;</SPAN>
					</TD><td align=left >
						<%=ej.getUserName()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>家名： &nbsp;</SPAN>
					</TD><td align='left' >
						<%=ej.getEjName()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>心愿： &nbsp;</SPAN>
					</TD><td align='left' >
						<%=ej.getHomeXy()==null?"":ej.getHomeXy()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>介绍： &nbsp;</SPAN>
					</TD><td align='left' >
						<%=ej.getEjContent()==null?"":ej.getEjContent()%>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<TD align='center' colspan=3>
						<TABLE cellSpacing=0 cellPadding=0 border=0 align=center >
						<tr style='height:31px;'>
						<td width=4 style='background:url(<%=basePath%>/images/btnAl.jpg) no-repeat;'></td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAm.jpg) repeat-x;' align='center' >
						<a href='javascript:doEdit()'>
						<font color='#FFFFFF'>&nbsp;&nbsp;编&nbsp;&nbsp;辑&nbsp;&nbsp;</font></a>
						</td>
						<td width=4 style='background:url(<%=basePath%>/images/btnAr.jpg) no-repeat;'></td>
						</tr>
						</TABLE>
					</TD>
				</TR>
				<TR><TD height=20 colspan=3></TD></TR>
			</TABLE>
		<%
    	}
		%>
    	<!-- 显示区 over  编辑区开始-->
    	  	<s:form method="post" action="updateBaej" name="form1" theme="simple" enctype="multipart/form-data">
	 	 	<input type='hidden' name='userId' value='<%=ej.getUserId()%>'/>
    		<input type='hidden' name='syPhoto' value='' />
    		<input type='hidden' name='grLable' value='' />
   			<TABLE cellSpacing=0 cellPadding=0 width=600 border=0 align=center style='<%=strCss%>;' id='idEdit' >
				<TR><TD height=15 colspan=3></TD></TR>
				<TR>
					<td width=20 ></td>
					<TD align='left' style='width:100px;' >
						<SPAN class=content_black_bold>家庭名： &nbsp;</SPAN>
					</TD><td align='left' >
						<INPUT type="text" value="<%=ej.getEjName()%>"
								style="WIDTH: 100px" maxLength=20
								name="ejName" minlength="6" />
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>心愿： &nbsp;</SPAN>
					</TD><td align='left' >
						<textarea cols=50 rows=5 name="homeXy" ><%=ej.getHomeXy()==null?"":ej.getHomeXy()%></textarea>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>e家介绍： &nbsp;</SPAN>
					</TD><td align='left' >
						<textarea cols=50 rows=5 name="strContent" ><%=ej.getEjContent()==null?"":ej.getEjContent()%></textarea>
					</TD>
				</TR>
				<TR><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR><TD height=8 colspan=3></TD></TR>
				<TR style='display:none;'>
					<td ></td>
					<TD align='left' >
						<SPAN class=content_black_bold>家庭照片： &nbsp;</SPAN>
					</TD><td align='left' >
					<input type=file name='fiSyPhoto' size=60>
					</TD>
				</TR>
				<TR style='height:20px;display:none;'>
					<td ></td>
					<td ></td>
					<TD align='left' valign='bottom'>
					&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>文件后缀：JPG/GIF，大小不得超过2MB。</font>
					</TD>
				</TR>
				<TR style='display:none;'><TD height=8 colspan=3 class=td_dash></TD></TR>
				<TR style='display:none;'><TD height=8 colspan=3></TD></TR>
				<TR><TD colspan=3 align="center"><a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a></TD></TR>
				<TR><TD height=20 colspan=3></TD></TR>
			</TABLE>
			</s:form>
			<!-- 编辑区over -->
    	</td>
    	</tr>
   		</table>
   	</td>
   	</tr>
   	</table>
</td>
</tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
