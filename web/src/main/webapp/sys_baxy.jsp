<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.io.*"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
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
	<jsp:forward page="error.jsp" />
<%
}
if (strUserAcl.indexOf("BA509")==-1 && strUserAcl.indexOf("999")==-1)
{
%>
	<jsp:forward page="error.jsp" />
<%
} 

List ls=(List)request.getAttribute("sysList_disp");
Integer intLmp;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
String strLmp="";
String strNav="";
Integer intTmp;

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaBa.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > 文章审核";

//页码等信息
Integer intSize=(Integer)request.getAttribute("sysCount_disp");
if (intSize==null) intSize=0;
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageCur=1;
strLmp=(String)request.getParameter("pCur");
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
Integer intPageLine=10;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/validate.js"></script>
<style type="text/css">
#idABack{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: gray;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
#idBBack{display: none;  position: absolute;  top: 28%;  left: 26%;  width: 350;  height: 300;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
</style>

<script LANGUAGE='Javascript'>
<!--
function doSeekDoc(strId)
{
	location.href='<%=basePath%>/prevOpenBAShDoc.action?baId='+strId;
}
function toSub(strId,strbj)
{
	var t1='<%=basePath%>/passBaxyShDoc.action?baId='+strId+'&JG='+strbj;
	var t2='';
	var t3='<%=basePath%>/passBaxyEDoc.action?baId='+strId;
	var t4='<%=basePath%>/forceRemoveBADoc.action?baId='+strId;
	var objA=null;
	var objB=null;
	
	if (parseInt(strbj)==1)
	{
		t2='确认通过该文档审核吗？';
		if (confirm(t2))
		{
			location.href=t1;
		}
	}else
	{
		if (parseInt(strbj)==2)
		{
			t2='确认审核不通过该文档吗？';
			objA=document.getElementById('idABack');
			objB=document.getElementById('idBBack');
			objA.style.display='block';
			objB.style.display='block';
			document.frm0.lnk.value=t1;
		}else
		{
			if (parseInt(strbj)==3)
			{
				location.href=t3;
			}else
			{
				if (parseInt(strbj)==4)
				{
					if (confirm('确实删除此文章吗？'))
					{
						location.href=t4;
					}
				}else
				{
					alert('错误操作！');
				}
			}
		}
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
	
	t2=doc.shReason.value;
	if (t2=='' )
	{
		alert('请输入查看密码！');
		return ;
	}
	if ( isLetterNumberA(t2))
	{
		alert('请输入正确的查看未通过审核的原因！');
		return ;
	}
	if (confirm('确实不通过该文档的审核吗？'))
	{
		t1=doc.lnk.value+'&shLy='+t2;
		location.href=t1;
	}
}

function toPage(strP)
{
	var i=0;
	var t1='';
	
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/sysmanaBa.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
	location.href=t1;
}
function toTurnPage()
{
	var doc=document.frmTurnPage;
	var t1=doc.ipg.value;

	if (t1=='')
	{
		alert('请输入欲跳转的页数！');
		return false;
	}
	if (!checkIsNumber(doc.ipg))
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	if (parseInt(t1)==0 || parseInt(t1)><%=intPageZs%>)
	{
		alert('非法输入，请重新输入跳转页数！');
		return false;
	}
	toPage(t1);
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
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%;'>
	<tr>
	<td width=240 >
		<font color='#A9714E' size='5'>贝爱学园</font>
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

		<table cellspacing='0' cellpadding="0" border='0' width='95%'>
        <tr>
        <td align='center' width=50% style='font-face:黑体;font-size:12px;'>主题</td>
        <td align='center' width=13% style='font-face:黑体;font-size:12px;'>发布人员</td>
        <td align='center' width=13% style='font-face:黑体;font-size:12px;'>发布日期</td>
        <td align='center' style='font-face:黑体;font-size:12px;'>功能</td>
        </tr>
		<tr><td style='height:3px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
		<%
		if (intSize==0)
		{
			out.print("<tr><td style='height:10px;' colspan=4 >&nbsp;</td></tr>");
			out.println("<tr><td colspan=4>暂无数据记录。</td></tr>");
		}else
		{
			for (intLmp=0;intLmp<ls.size();intLmp++)
			{
				LmBaxy ba=(LmBaxy) ls.get(intLmp);
				out.println("<tr style='height:40px;'>");
				out.println("<td valign='middle' class='td_dash' >");
				%>
				<a href="javascript:doSeekDoc('<%=ba.getBaId()%>')"><%=ba.getStrTitle()%></a>
				</td>
				<%
				out.println("<td align=center valign='middle' class='td_dash'>"+ba.getUserName()+"</td>");
				date=simpleDateFormat.parse(ba.getDtCrea());
				strLmp=simpleDateFormat.format(date);
				out.println("<td align=center valign='middle' class='td_dash'>"+strLmp+"</td>");
				%>
		   		<td align='center' valign='middle' class='td_dash' >
		   		<input type='button' value='通过' onclick="toSub('<%=ba.getBaId()%>','1')" />
		   		<input type='button' value='不通过' onclick="toSub('<%=ba.getBaId()%>','2')" />
		   		<input type='button' value='编辑' onclick="toSub('<%=ba.getBaId()%>','3')" />
		   		<input type='button' value='删除' onclick="toSub('<%=ba.getBaId()%>','4')" />
   				</td></tr>
	   		<%
			}
		}
		%>
	   		<tr style='height:20px;'><td colspan=4>&nbsp;</td></tr>
	   		<tr><td colspan=4>
	   		<table cellspacing='0' cellpadding="0" border='0' width=100% >
	   		<tr>
			<td align=center valign=middle style='font-size:12px;'>
			<%=strPageOut%>
	   		</td></tr>
	   		</table>
	   		</td></tr>
		</table>
  		</td></tr>
	<tr>
	<td colspan=3 style='height:20px;'></td>
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
	<tr><td>请输入未通过审核的原因：</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<textarea name='shReason' rows=5 cols=70 ></textarea>
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	<tr><td>
	<input type='button' value='提交' onclick='toCheckPh()' />
	&nbsp;&nbsp;<input type='button' value='放弃' onclick='toCheckAPh()' />
	</td></tr>
	<tr style='height:20px;'><td></td></tr>
	</table>
	<input type=hidden name="lnk" value='' />
</form>
</div>

</body>
</html>
<s:include value='footer.jsp'></s:include>
