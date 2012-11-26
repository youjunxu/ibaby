<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strDocId=request.getParameter("id");

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
List lstmk=(List)request.getAttribute("baList_mkxx");
String strFbr=(String)request.getAttribute("baIndex_docFbr");
String strMkDisp="";

if(objUser==null)
{
	flagUser=0;
}else
{
	flagUser=(Integer)request.getSession().getAttribute("flagUser");
	if(flagUser==null)
	{
		flagUser=0;
	}
}
LmBaxy lm=(LmBaxy)request.getAttribute("baIndex_docOpen");

if (lm==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
date=simpleDateFormat.parse(lm.getDtCrea());
strFbsj=simpleDateFormat.format(date);

Integer intSize;
Integer intCur;
Integer intLmp;
String[] objMemo=null;
String strLmp;
String strTmp;
//String strSplit="<div style=\"page-break-after: always;\"><span style=\"display: none;\">&nbsp;</span></div>";
String strSplit="<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />";

String strPageOut="";
String[] slmp;
strLmp=lm.getStrMemo();
intSize=1;
if (strLmp.contains(strSplit))
{
	objMemo=strLmp.split(strSplit);
	intSize=objMemo.length;
}
strLmp=(String)request.getParameter("pCur");
intCur=1;
if (strLmp!=null)
{
	if (!strLmp.isEmpty())
	{
		intCur=Integer.valueOf(strLmp);
	}
}
if (intCur>1)
{
	intLmp=intCur-1;
	strPageOut="<input type='button' value='上一页' onclick='toPage("+intLmp.toString()+")' />";
}
if (intCur<intSize)
{
	intLmp=intCur+1;
	strPageOut="&nbsp;&nbsp;<input type='button' value='下一页' onclick='toPage("+intLmp.toString()+")' />";
}
strMkDisp="";
strLmp="";
for (intLmp=0;intLmp<lstmk.size();intLmp++)
{
	String temp=(String) lstmk.get(intLmp);
	slmp=temp.split("`");
	strLmp="<a href='"+basePath+"/baSeekList.action?lmCode="+slmp[1]+"' >";
	
	if (lm.getLmCode().equals(Integer.valueOf(slmp[1])))
	{
		strLmp=strLmp+"<font color='FF0000'>";
	}else
	{
		strLmp=strLmp+"<font color='#2F9681'>";
	}
	strLmp=strLmp+slmp[0]+"</font></a>";
	if (!"".equals(strMkDisp))
	{
		strMkDisp=strMkDisp+"/";
	}
	strMkDisp=strMkDisp+strLmp;
}
strLmp="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strLmp=strLmp+" > <a href='"+basePath+"/firstBA.action'><font color='#2F9681'>贝爱学园</font></a>";
strMkDisp=strLmp+" > "+strMkDisp;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
out.print("<title>贝家爱--贝爱学园--"+lm.getLmName()+"--"+lm.getStrTitle()+"</title>");
%>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<style type="text/css">
<!--
.grnbold {
	color: #079607;
	font-weight: bold;
}
#idBaYyys {
	color: #59B1A9;
	font-size: 24px;
}
-->
</style>
<script LANGUAGE='Javascript'>
function toOpenDoc(strId)
{
	var t1='<%=basePath%>/prevOpenBADoc.action?baId='+strId;
	location.href=t1;
}
function doWyfx()
{
    <%
    if (objUser!=null)
    {
	    if(strUserAcl.indexOf("BA303")>=0 || strUserAcl.indexOf("BA507")>=0 || strUserAcl.indexOf("BA509")>=0 || strUserAcl.indexOf("999")>=0){
			%>
			location.href='<%=basePath%>/prevSay.action';
			<%
		}else
		{
		    %>
			alert('对不起，您的账号暂时不支持此操作，请联系网站管理员！');
			<%
		}
    }else
    {
	    %>
		alert('请您先登录再进行此操作！');
		location.href='<%=basePath%>/login.jsp';
		<%
    }
    %>
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	t1='<%=basePath%>/prevOpenBADoc.action?baId=<%=lm.getBaId()%>&pCur='+strP;
	location.href=t1;
}

function doChgPl(strPl)
{
<%
	if (objUser==null)
	{
		out.println("alert('请您先登录后，再进行评价！')");
	}else
	{
%>
	var t1='<%=basePath%>/changeDocPlResult.action?userName=<%=objUser.getUserName()%>&baId=<%=lm.getBaId()%>&pl='+strPl;
	getByAjax(t1,'after_chgPl');
<%
	}
%>
}
function after_chgPl()
{
	var resp=xml_Http.responseText;
	var objM=null;
	var objN=null;


	eval('objM=('+resp+')');
	if (!objM.success)
	{
		alert(objM.tip);
	}else
	{
		alert('谢谢您的评论！');
		objN=document.getElementById('flower'+objM.plSort);
		if (objN)
		{
			objN.innerHTML=parseInt(objN.innerHTML)+1;
		}
	}
}
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">BAXY</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
        <%
        if (flagUser>0)
        {
        %>
    	<td align="left" width=70%>
    		您现在所在的位置: <%=strMkDisp%>
		</td>
    	<td align='right'><a href='javascript:doWyfx()' ><img src="images/wyfx.jpg" /></a>
    	</td>
    	<%
    	}else
    	{
    	%>
    	<td align="left">
    		您现在所在的位置: <%=strMkDisp%>
		</td>
    	<%
    	}
    	%>
    	</tr>
    	</table>
    </td>
</tr>
<tr><td style='height:10px;'>&nbsp;</td></tr>
<tr>
<td align='left'>
	<table cellspacing='0' cellpadding="0" border='0' style='width:95%;margin-left:20px;'>
	<tr><td colspan=2 style='height:5px;' valign="middle"><hr class='hr1'></td></tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr><td colspan=2 style='height:20px; font-size: 16px; font-weight: bold;' align='center'><%=lm.getStrTitle()%></td></tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr><td colspan=2 >
    	<table align='center' cellspacing='0' cellpadding="0" border='0'>
        <tr>
    	<td valign='middle'>
    	<%
    	strLmp="发表日期:&nbsp;"+strFbsj;
    	if (lm.getStrAuthor()!=null)
    	{
    		if (!"".equals(lm.getStrAuthor()))
    		{
            	intLmp=MyUtils.getStringLength(lm.getStrAuthor());
   		        strLmp=strLmp+"&nbsp;&nbsp;作者:&nbsp;"+lm.getStrAuthor();
    		}
    	}
        if (lm.getFromName()!=null)
        {
        	intLmp=MyUtils.getStringLength(lm.getFromName());

    	    if (intLmp<5)
       		{
       	        if (!"".equals(lm.getFromName()))
       	        {
      				strLmp=strLmp+"&nbsp;&nbsp;来源:&nbsp;"+lm.getFromName();
       	        }
       		}else
    	   	{
        	    if (intLmp<7)
           		{
      				strLmp=strLmp+"&nbsp;&nbsp;来源:&nbsp;"+lm.getFromName();
       	        }else
       	        {
      				strTmp=lm.getFromName();
	  				strTmp=strTmp.substring(1,strTmp.length());
      				strLmp=strLmp+"&nbsp;&nbsp;来源:&nbsp;"+strTmp+"...";
       	        }
       		}
        }
        strLmp=strLmp+"&nbsp;&nbsp;发布者:&nbsp;"+strFbr;
        strLmp=strLmp+"&nbsp;&nbsp;阅读数:&nbsp;<font color=red>"+String.valueOf(lm.getReaders())+"</font>";
        out.print(strLmp);
        %>
        </td>
        </tr>
        </table>
    </td></tr>
	<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
	<TR><TD height=12 colspan=2></TD></TR>
    <tr bgcolor="#FFFCC9">
    <td colspan='2' align="left" valign="middle" style='background:url(images/ba_zy.gif) no-repeat;background-color:#FFFCC9;height:70px;border:#CCCCC0 1px solid;'>
	    <table cellspacing="0" cellpadding="0" border="0" width=90% align="left" style='margin-left:40px;'>
        <tr>
        <%
        if (lm.getStrContent()==null)
        {
       		out.println("<td></td>");
        }else
        {
        %>
        <td style='font-size:12px;word-break:break-word;table-layout:fixed;' align='left'><%=lm.getStrContent()%></td>
        <%
        }
        %>
		</tr>
		</table>
    </td>
    </tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr>
    <td colspan=2 align="center" >
		<table width=95% cellspacing="0" cellpadding="0" border="0" >
		<tr>
	    <td align="left" style='line-height:30px;word-break:break-word;table-layout:fixed;'>
    <%
    if (intSize>1)
    {
    	out.print(objMemo[intCur-1]);
    }else
    {
    	out.println(lm.getStrMemo());
    }
    %>
		</td></tr>
		</table>
    </td>
    </tr>
	<tr><td colspan=2 style='height:50px;'>&nbsp;</td></tr>
	<tr>
    	<td colspan=2 style='height:20px;' align="center">
		<%=strPageOut%>
    	</td>
    </tr>
	<tr><td colspan=2 style='height:50px;'>&nbsp;</td></tr>
	<tr>
    <td colspan=2 align="center">
    	<table width=378 cellpadding="0" cellspacing="0" border="0" align="center">
        <tr>
        <td style='width:53px;height:30px;' align="center">
        <a href="javascript:doChgPl('1')"><img width=53 height=30 src='<%=basePath%>/images/pl1.jpg' /></a></td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='width:64px;height:30px;' align="center">
        <a href="javascript:doChgPl('2')"><img width=64 height=30 src='<%=basePath%>/images/pl2.jpg' /></a></td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='width:64px;height:30px;' align="center">
        <a href="javascript:doChgPl('3')"><img width=64 height=30 src='<%=basePath%>/images/pl3.jpg' /></a></td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='width:64px;height:30px;' align="center">
        <a href="javascript:doChgPl('4')"><img width=64 height=30 src='<%=basePath%>/images/pl4.jpg' /></a></td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='width:53px;height:30px;' align="center">
        <a href="javascript:doChgPl('5')"><img width=53 height=30 src='<%=basePath%>/images/pl5.jpg' /></a></td>
        </tr>
		<tr><td colspan=2 style='height:5px;'>&nbsp;</td></tr>
        <tr>
        <td align="center"><span id='flower1'><%=lm.getPlZans()==null?0:lm.getPlZans()%></span>&nbsp;人</td>
        <td >&nbsp;</td>
        <td align="center"><span id='flower2'><%=lm.getPlFlowers()==null?0:lm.getPlFlowers()%></span>&nbsp;人</td>
        <td >&nbsp;</td>
        <td align="center"><span id='flower3'><%=lm.getPlHands()==null?0:lm.getPlHands()%></span>&nbsp;人</td>
        <td >&nbsp;</td>
        <td align="center"><span id='flower4'><%=lm.getPlYms()==null?0:lm.getPlYms()%></span>&nbsp;人</td>
        <td >&nbsp;</td>
        <td align="center"><span id='flower5'><%=lm.getPlCais()==null?0:lm.getPlCais()%></span>&nbsp;人</td>
        </tr>
        </table>
    </td>
    </tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr><td colspan=2 style='height:5px;' valign="middle"><hr class='hr1'></td></tr>
	<tr><td colspan=2 style='height:10px;'>&nbsp;</td></tr>
	</table>
</td>
</tr>
<tr style='height:5px;'><td>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>

