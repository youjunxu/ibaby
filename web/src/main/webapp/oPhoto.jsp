<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.PhotoPz"%>
<%@ page import="com.lhq.prj.bms.po.PhotoMemo"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lsXc=(List)request.getAttribute("waitDisp_xcxcxx");
List lsFm=(List)request.getAttribute("waitDisp_fmxx");
List lstGs=(List)request.getAttribute("waitDisp_xcgs");
Integer intAllzs=(Integer)request.getAttribute("waitDisp_zpall");
String strPhotoPath="graph/people";
UserEj ej=(UserEj)request.getSession().getAttribute("waitListA_ej");
String strLmp="";
Integer intXcZs=0;
if (lsXc==null)
{
	intXcZs=0;
}else
{
	intXcZs=lsXc.size();
}
if (intAllzs==null)
{
	intAllzs=0;
}
if (ej==null)
{
	strLmp="error.jsp";
%>
	<jsp:forward page="<%=strLmp%>" />
<%
}

strLmp="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/mask.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<style type="text/css">
#idABack{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: gray;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
#idBBack{display: none;  position: absolute;  top: 28%;  left: 36%;  width: 350;  height: 300;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>

<script LANGUAGE='JavaScript'>
function toGrContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=ej.getUserId()%>';
	location.href=t1;
}
function toPh(sid,sst)
{
	var t2='<%=basePath%>/opPersonPhoto.action?xcId='+sid;
	var doc=document.frm0;
	var bodyBack=null;
	var objB=null;
	var t0='';
	var objA=null;
	if (parseInt(sst)==1)
	{
		doc.sid.value=sid;
		objA=document.getElementById('idABack');
		objB=document.getElementById('idBBack');
		objA.style.display='block';
		objB.style.display='block';
		
	}else
	{
		location.href=t2;
	}
}
function toCheckAPh()
{
	var objB=null;
	var objA=null;
	objA=document.getElementById('idABack');
	objB=document.getElementById('idBBack');
	objA.style.display='none';
	objB.style.display='none';
}
function toCheckPh()
{
	var doc=document.frm0;
	var t1='';
	var t2='';
	
	t2=doc.pas.value;
	if (t2=='' )
	{
		alert('请输入查看密码！');
		return ;
	}
	if ( isLetterNumberA(t2))
	{
		alert('请输入正确的查看密码！');
		return ;
	}

	t1='<%=basePath%>/checkPhotoAcl.action?xcId='+doc.sid.value+'&xcPassword='+t2;
	getByAjax(t1,"after_toPhA('"+doc.sid.value+"')");
}
function after_toPhA(sid)
{
	var resp=xml_Http.responseText;
	var t1='<%=basePath%>/opPersonPhoto.action?xcId='+sid;
	var objM=null;
	
	eval('objM='+resp);
	if (objM)
	{
		if (objM.tip=='')
		{
			location.href=t1;
		}else
		{
			alert(objM.tip);
		}
	}else
	{
		alert('系统错误！');
	}
}
</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align="left" width=76% style='font-size:24px;' valign='middle' >
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'>
   	<font color='#248D93'><b><%=ej.getEjName()%></b></font></a>
	</td>
   	<td align='left' valign="middle" style='font-size:14px;'>
    	<img src="<%=basePath%>/images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toGrContent()'><font color='#2F9681'>博文列表</font></a>
   	</td>
   	<td align='left' valign="middle" style='font-size:14px;' >
   	<img src="images/index_icon_03s.gif" />&nbsp;&nbsp;
   	<a href='<%=basePath%>/toPersonHome.action?userId=<%=ej.getUserId()%>'><font color='#2F9681'>家庭管理</font></a>
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
    <td valign='top'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td align='left'>
		&nbsp;&nbsp;<img src="images/xc1.gif" />
		</td>
   		<tr style='height:15px;' ><td ></td></tr>
		<tr>
		<td >
	    	<table border="0" cellspacing="0" cellpadding="0" width=100% style='margin-left:20px;'>
	    	<%
	    	if (intXcZs>0)
	    	{
	    		for (intLmp=0;intLmp<intXcZs;intLmp++)
	    		{
	    			intTmp=intLmp+1;
	    			PhotoPz pz=(PhotoPz)lsXc.get(intLmp);
	    			PhotoMemo pm=(PhotoMemo)lsFm.get(intLmp);
	    			if (intTmp%5==1)
	    			{
	    				if (intTmp>5) out.println("<tr style='height:20px;'><td colspan=9></td></tr>");
	    				out.println("<tr>");
	    			}else
	    			{
	    				out.println("<td style='width:20px;'></td>");
	    			}
    				%>
    				<td align='left' style='width:145px;'>
    				   	<table border="1" cellspacing="0" cellpadding="0" width=100% >
						<tr>
							<td style="width:145px;height:144px;" >
						<%
						if (pm==null)
						{
							strLmp="";
						}else
						{
							strLmp=basePath+"/"+strPhotoPath+"/"+pm.getWjName();
						}
						if (pz.getXcStatus().equals(1))
						{
							%>
							<img src='<%=basePath%>/images/need_pass_135.png' width=145 height=144 />
							<%
						}else
						{
							if("".equals(strLmp))
							{
							%>
							<img src='<%=basePath%>/images/index_icon_10a.gif' width=145 height=144 />
							<%
							}else
							{
							%>
							<img src='<%=strLmp%>' width=145 height=144 />
							<%
							}
						}
						%>
						</td>
   						</tr>
						<tr style='height:20px;'>
						<td align='center' valign='middle' style="background-color:#56B1A8;">
						<%
						intTmp=(Integer)lstGs.get(intLmp);
						if (intTmp==0)
						{
						%>
						<font color=#FFFFFF><%=pz.getStrTitle()%>&nbsp;&nbsp;(<%=intTmp%>)</font>
						<%
						}else
						{
						%>
						<a href="javascript:toPh('<%=pz.getXcId()%>','<%=pz.getXcStatus()%>')">
						<font color=#FFFFFF><%=pz.getStrTitle()%>&nbsp;&nbsp;(<%=intTmp%>)</font>
						</a>
						<%
						}
						%>
						</td>
   						</tr>
					   	</table>    				
    				</td>
    				<%
	    			if ((intLmp+1)%5==0)
	    			{
	    				out.println("</tr>");
	    			}
	    		}
	    		if (intXcZs%5>0)
	    		{
	    			intTmp=5-intXcZs%5;
	    			intLmp=intTmp*2;
	    			%>
    				<td colspan="<%=intLmp%>"></td>
    				</tr>
    				<%
	    		}
	    	}
	    	%>
			<tr style='height:30px;'><td colspan=9></td></tr>
			</table>
		</td>
   		</tr>
	   	</table>
    <!-- 文档区over -->
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>
<div  width=350 height=200 id='idABack' ></div>
<div  width=350 height=200 id='idBBack' >
<form name="frm0">
<table border="0" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" width=300 align="center">
	<tr style='height:20px;'><td></td></tr>
	<tr><td>请输入本相册查看密码：</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='password' name='pas' value='' size=10 />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='button' value='提交' onclick='toCheckPh()' />
	&nbsp;&nbsp;<input type='button' value='放弃' onclick='toCheckAPh()' />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	</table>
	<input type=hidden name="sid" value='' />
</form>
</div>

</body>
</html>
<s:include value='footer.jsp'></s:include>
