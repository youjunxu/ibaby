<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
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
LmBaxy baPrev=(LmBaxy)request.getAttribute("baIndex_docPrev");
LmBaxy baNext=(LmBaxy)request.getAttribute("baIndex_docNext");

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
	strLmp=strLmp+"<font color='#2F9681'>";
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看文章</title>
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
	var t1='<%=basePath%>/prevOpenBAShDoc.action?baId='+strId;
	location.href=t1;
}
function doWyfx()
{
	location.href='<%=basePath%>/prevSay.action';
}
function toPage(strP)
{
	var i=0;
	var t1='';
	
	t1='<%=basePath%>/prevOpenBAShDoc.action?baId=<%=lm.getBaId()%>&pCur='+strP;
	location.href=t1;
}

</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">BA</s:param>
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
    	<td align='right'><input name="" type="image" src="images/wyfx.jpg" onclick='doWyfx()'/>
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
<td >
	<table cellspacing='0' cellpadding="0" border='0' style='width:95%;margin-left:33px;'>
	<tr>
	<%
	if (baPrev==null)
	{
	%>
	<td align='left' width=50%><img src='images/arrow_left.jpg'/> 上一篇 <font color=red></font></td>
	<%
	}else
	{
	%>
	<td align='left' width=50%><img src='images/arrow_left.jpg'/> 上一篇 <font color=red><a href="javascript:toOpenDoc('<%=baPrev.getBaId()%>')"><%=baPrev.getStrTitle()%></a></font></td>
	<%
	}
	if (baNext==null)
	{
	%>
	<td align='right' width=50%><font color=red></font> 下一篇 <img src='images/arrow_right.jpg'/></td>
	<%
	}else
	{
	%>
	<td align='right' width=50%><font color=red><a href="javascript:toOpenDoc('<%=baNext.getBaId()%>')"><%=baNext.getStrTitle()%></a></font> 下一篇 <img src='images/arrow_right.jpg'/></td>
	<%
	}
	%>
	</tr>
	<tr><td colspan=2 style='height:5px;' valign="middle"><hr class='hr1'></td></tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr><td colspan=2 style='height:20px; font-size: 16px; font-weight: bold;' align='center'><%=lm.getStrTitle()%></td></tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr><td colspan=2 >
    	<table width=75% align='center' cellspacing='0' cellpadding="0" border='0'>
        <tr>
    	<td width=12% valign='middle'><%=strFbsj%></td>
    	<%
    	if (lm.getStrAuthor()!=null)
    	{
    		if (!"".equals(lm.getStrAuthor()))
    		{
            	intLmp=MyUtils.getStringLength(lm.getStrAuthor());
        		out.print("<td width=40 valign='middle'>作者：</td>");
        		if (intLmp<5)
        		{
    		        out.print("<td width=30 valign='middle'>"+lm.getStrAuthor()+"</td>");
        		}else
        		{
            		if (intLmp<7)
            		{
        		        out.print("<td width=40 valign='middle'>"+lm.getStrAuthor()+"</td>");
            		}else
            		{
        		        out.print("<td width=60 valign='middle'>"+lm.getStrAuthor()+"</td>");
            		}
        		}
    		}
    	}
        if (lm.getFromName()!=null)
        {
        	intLmp=MyUtils.getStringLength(lm.getFromName());

    	    if (intLmp<5)
       		{
       	        if (!"".equals(lm.getFromName()))
       	        {
            		out.print("<td width=50 valign='middle'>来源：</td>");
        	    	out.print("<td width=40 valign='middle' style='word-break:break-word;table-layout:fixed;' align='left'>");
      				strLmp=lm.getFromName();
        	   		out.print(strLmp);
    	        	out.print("</td>");
       	        }
       		}else
    	   	{
        	    if (intLmp<7)
           		{
            		out.print("<td width=50 valign='middle'>来源：</td>");
        	    	out.print("<td width=55 valign='middle' style='word-break:break-word;table-layout:fixed;' align='left'>");
	            	out.print(lm.getFromName());
	    	        out.print("</td>");
       	        }else
       	        {
      				strLmp=lm.getFromName();
	  				strLmp=strLmp.substring(1,strLmp.length());
            		out.println("<td width=50 valign='middle'>来源：</td>");
        	    	out.println("<td width=65 valign='middle' style='word-break:break-word;table-layout:fixed;' align='left'>");
	            	out.print(strLmp);
	    	        out.print("...</td>");
       	        }
       		}
        }
        %>
        <td width=55 valign='middle'>发布者：</td>
        <%
        if (MyUtils.getStringLength(strFbr)<5)
        {
            %>
            <td width=40 valign='middle'><%=strFbr%></td>
	        <%
        }else
        {
            if (MyUtils.getStringLength(strFbr)<6)
            {
                %>
                <td width=50 valign='middle'><%=strFbr%></td>
    	        <%
            }else
            {
                %>
                <td width=65 valign='middle'><%=strFbr%></td>
    	        <%
            }
        }
        %>
        <td width=9% valign='middle'>阅读数：</td>
        <td width=5% valign='middle'><font color='#FF0000'><%=lm.getReaders()%></font></td>
        </tr>
        </table>
    </td></tr>
	<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
	<TR><TD height=12 colspan=2></TD></TR>
    <tr bgcolor="#FFFCC9">
    <td colspan='2' align="left" valign="middle" bgcolor="#FFFCC9" style='background:url(images/ba_zy.gif) no-repeat;height:70px;border:#CCCCC0 1px solid;'>
	    <table cellspacing="0" cellpadding="0" border="0" width=90% align="left" style='margin-left:50px;'>
        <tr>
        <td style='font-size:12px;' align='left'><%=lm.getStrContent()%>
		</td>
		</tr>
		</table>
    </td>
    </tr>
	<tr><td colspan=2 style='height:20px;'>&nbsp;</td></tr>
	<tr>
    <td colspan=2 align="left" style='line-height:30px;word-break:break-word;table-layout:fixed;'>
    <%
    if (intSize>1)
    {
    	out.print(objMemo[intCur-1]);
    }else
    {
    	out.println(lm.getStrMemo());
    }
    %>
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
        <td style='background:url(images/z_zan.gif);width:53px;height:30px;' align="right">赞&nbsp;</td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='background:url(images/z_xh.gif);width:64px;height:30px;' align="right">鲜花&nbsp;</td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='background:url(images/z_zs.gif);width:64px;height:30px;' align="right">掌声&nbsp;</td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='background:url(images/z_ym.gif);width:64px;height:30px;' align="right">仰慕&nbsp;</td>
        <td style='width:20px;'>&nbsp;</td>
        <td style='background:url(images/z_cai.gif);width:53px;height:30px;' align="right">踩&nbsp;</td>
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
	<tr>
	<%
	if (baPrev==null)
	{
	%>
	<td align='left' width=50%><img src='images/arrow_left.jpg'/> 上一篇 <font color=red></font></td>
	<%
	}else
	{
	%>
	<td align='left' width=50%><img src='images/arrow_left.jpg'/> 上一篇 <font color=red><a href="javascript:toOpenDoc('<%=baPrev.getBaId()%>')"><%=baPrev.getStrTitle()%></a></font></td>
	<%
	}
	if (baNext==null)
	{
	%>
	<td align='right' width=50%><font color=red></font> 下一篇 <img src='images/arrow_right.jpg'/></td>
	<%
	}else
	{
	%>
	<td align='right' width=50%><font color=red><a href="javascript:toOpenDoc('<%=baNext.getBaId()%>')"><%=baNext.getStrTitle()%></a></font> 下一篇 <img src='images/arrow_right.jpg'/></td>
	<%
	}
	%>
	</tr>
	<tr><td colspan=2 style='height:10px;'>&nbsp;</td></tr>
	</table>
</td>
</tr>
<tr style='height:5px;'><td>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>

