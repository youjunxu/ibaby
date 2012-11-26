<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmSpzz"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strDocId=request.getParameter("id");

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser;

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
LmSpzz zzDoc=(LmSpzz)request.getAttribute("waitDisp_docOpen");

if (lm==null)
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
<title>查看文章</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
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
function doWySay()
{
	var t1='';
    <%
    if (objUser!=null)
    {
	    if(strUserAcl.indexOf("SP303")>=0 || strUserAcl.indexOf("SP509")>=0 || strUserAcl.indexOf("999")>=0){
			%>
			t1='<%=basePath%>/sp_prevSay.action';
			location.href=t1;
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
		<%
    }
    %>
}

function doFcs()
{
	var doc=document.forms[0];
<%
	if (objUser==null)
	{
		out.println("alert('请您先登录后，再进行评价！')");
	}else
	{
%>
	doc.strContent.value='';
<%
	}
%>
}
function doTurnStar(strA,strB)
{
	var objA=null;
	var i;
	var j;
	var t1;
	var ifs;

	ifs=parseInt(strB)*2;
	for (i=1; i<=parseInt(strB); i++)
	{
		t1='idStart'+strA+i;
		objA=document.getElementById(t1);
		objA.src='images/star2.gif';
	}

	if (parseInt(strB)<5)
	{
		j=parseInt(strB)+1;
		for (i=j; i<=5; i++)
		{
			objA=document.getElementById('idStart'+strA+i);
			objA.src='images/star1.gif';
		}
	}
	if (strA=='1')
	{
		objA=document.getElementById('idFsMyd');
		objA.innerHTML=ifs;
		doc.fsMyd.value=ifs;
	}
	if (strA=='2')
	{
		objA=document.getElementById('idFsKg');
		objA.innerHTML=ifs;
		doc.fsKg.value=ifs;
	}
	if (strA=='3')
	{
		objA=document.getElementById('idFsSyx');
		objA.innerHTML=ifs;
		doc.fsSyx.value=ifs;
	}
	if (strA=='4')
	{
		objA=document.getElementById('idFsXjb');
		objA.innerHTML=ifs;
		doc.fsXjb.value=ifs;
	}
}

</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SP</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>
	    <table width=100%>
    	<tr>
        <td width=4%></td>
    	<td align="left" width=70% >
    		您现在所在的位置: <a href='<%=basePath%>/manager.jsp'>首页</a> > <a href='<%=basePath%>/firstSP.action'>拾识看看</a> > <%=zzDoc.getLbName()%> > <%=zzDoc.getSpTitle()%>
    	<td align='right'>
        <input name="" type="image" src='images/sp_say.gif' onclick='doWysay()'/>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td valign="middle" align="center">
	<table border="0" cellspacing="0" cellpadding="0" style='height:305px;' width=100% >
    <tr>
    <td style='width:350px;'><img src='<%=zzDoc.getStrZzImg()%>' width=300 height=300 />
    </td>
    <td align="left" valign="middle">
		<table border="0" cellspacing="0" cellpadding="0" width=98% height=100% >
    		<tr>
    			<td colspan=4 style='height:50px;font-size:16px;' align="left">
                <font color="#249194">
                <%=zzDoc.getSpTitle()%>
                </font>
    			</td>
    		</tr>
    		<tr style='height:25px;' >
	    		<td align="left" valign="middle" width=50 ><b>类&nbsp;&nbsp;&nbsp;&nbsp;别:</b></td>
                <td align="left" valign="middle" width=140><%=zzDoc.getLbName()%></td>
			    <td align="left" valign="middle" width=50><b>型&nbsp;&nbsp;&nbsp;&nbsp;号:</b></td>
                <td align="left" valign="middle"><%=zzDoc.getBrandName()%></td>
		    </tr>
    		<tr style='height:25px;'>
	    		<td align="left" valign="middle" ><b>创建人:</b></td>
                <td align="left" valign="middle"><%=zzDoc.getStrAuthor()%></td>
			    <td align="left" valign="middle"><b>心&nbsp;&nbsp;&nbsp;&nbsp;情:</b></td>
			    <%
			    if (zzDoc.getStrXq()==null)
			    {
			    %>
                	<td align="left" valign="middle"></td>
                <%
			    }else
			    {
			    %>
                	<td align="left" valign="middle"><img src='<%=zzDoc.getStrXq()%>' /></td>
                <%
			    }
                %>
		    </tr>
    		<tr style='height:25px;'>
	    		<td align="left" valign="middle" ><b>满意度:</b></td>
                <td align="left" valign="middle" colspan="3">
                	<table cellspacing="0" cellpadding="0" border="0" width=100% >
                    <tr><td width=96 align="left" valign="bottom">
            	    	<%
            	    	out.print(MyUtils.dispStartByFs(zzDoc.getFsMyd()));
            	    	%>
                    </td><td align="left" valign="middle">
    	            <font color="#EA6C15" size="+0"><%=zzDoc.getFsMyd()%></font>
    	            <font color="#EA6C15">分</font>
                    </td></tr>
	                </table>
                </td>
		    </tr>
    		<tr style='height:25px;'>
	    		<td align="left" valign="middle" ><b>质感/口感:</b></td>
                <td align="left" valign="middle" colspan="3">
                	<table cellspacing="0" cellpadding="0" border="0" width=100% >
                    <tr><td width=96 align="left" valign="bottom">
            	    	<%
            	    	out.print(MyUtils.dispStartByFs(zzDoc.getFsKg()));
            	    	%>
                    </td><td align="left" valign="middle">
    	            <font color="#EA6C15" size="+0"><%=zzDoc.getFsKg()%></font>
    	            <font color="#EA6C15">分</font>
                    </td></tr>
	                </table>
                </td>
		    </tr>
    		<tr style='height:25px;' >
	    		<td align="left" valign="middle"><b>实用性:</b></td>
                <td align="left" valign="middle" colspan="3">
                	<table cellspacing="0" cellpadding="0" border="0" width=100% >
                    <tr><td width=96 align="left" valign="bottom">
            	    	<%
            	    	out.print(MyUtils.dispStartByFs(zzDoc.getFsSyx()));
            	    	%>
                    </td><td align="left" valign="middle">
    	            <font color="#EA6C15" size="+0"><%=zzDoc.getFsSyx()%></font>
    	            <font color="#EA6C15">分</font>
                    </td></tr>
	                </table>
                </td>
		    </tr>
    		<tr style='height:25px;'>
	    		<td align="left" valign="middle"><b>价&nbsp;&nbsp;&nbsp;&nbsp;格:</b></td>
                <td align="left" valign="middle" colspan="3" style="font-size:16px;">
            	<font color="E80413"><b><%=zzDoc.getSpPrice()==null?"&nbsp;&nbsp;":zzDoc.getSpPrice()%></b></font> 元
                </td>
		    </tr>
    		<tr>
            <td colspan="4" align="center" valign="middle" style="height:90px; border:1px solid; border-color:#FEC582; background:#FFFDD6;">
               	<table cellspacing="0" cellpadding="0" border="0" width=95% height="100%" >
    			<tr>
                <td valign="middle" align="left" style='line-height:30px;'>
	            <font color="#FF7A0B">评价：</font>
    	        <br><%=zzDoc.getStrContent() %>
	            </td>
			    </tr>
	            </table>
            </td>
		    </tr>
    	</table>
    </td>
    </tr>
    </table>
</td>
</tr>
<tr height=22><td>&nbsp;</td></tr>
<tr height=30 style='background:#DDEFEF;border-bottom-color:#8FC9CA;'>
<td align="left" style="font-size:13px;">&nbsp;&nbsp;<font color="#216967"><b>其他人点评</b></font></td>
</tr>
<tr>
<td valign="middle" align="center">
<!--各人点评信息,最多10人//-->
	<s:action name="dispSpzzPinglun" executeResult="true" >
		<s:param name="spId"><%=zzDoc.getZzId()%></s:param>
		<s:param name="limit">10</s:param>
	</s:action>
<!--各人点评信息,最多10人over//-->
</td>
</tr>
<tr>
<td valign="middle" align="left" height="210">
	<table cellspacing="0" cellpadding="0" border="0" width=90% height="100%" style='margin-left:20px;'>
		<tr height="25"><td colspan="2">&nbsp;</td></tr>
		<tr>
		<td align="right" width=110 valign="top" style="font-size:14px;">
        <font color="#216967"><b>我要点评：</b></font>
		</td>
		<td valign="top" align="left">
		  	<s:form method="post" action="saveSppl" name="form1" theme="simple" onsubmit="return doSubmit()" >
		  	<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
		  	<input type='hidden' name='strAuthor' value='<%=objUser.getUserName()%>'/>
		  	<input type='hidden' name='spId' value='<%=zzDoc.getZzId()%>'/>
		  	<input type='hidden' name='spTitle' value='<%=zzDoc.getSpTitle()%>'/>
		  	<input type='hidden' name='fsMyd' value='0' />
		  	<input type='hidden' name='fsKg' value='0' />
		  	<input type='hidden' name='fsSyx' value='0' />
		  	<input type='hidden' name='fsXjb' value='0' />
		  	
			<table cellspacing="0" cellpadding="0" border="0" width=90% height=100% style='margin-left:16px;margin-top:-5px;'>
				<tr height=25>
                <td valign="middle" align="left" width="60">满意度:&nbsp;
				</td>
                <td valign="middle" align="left" width="96">
    				<img id='idStart11' src='images/star1.gif' onclick='doTurnStar(1,1)'/>
    				<img id='idStart12' src='images/star1.gif' onclick='doTurnStar(1,2)'/>
   			 		<img id='idStart13' src='images/star1.gif' onclick='doTurnStar(1,3)'/>
    				<img id='idStart14' src='images/star1.gif' onclick='doTurnStar(1,4)'/>
    				<img id='idStart15' src='images/star1.gif' onclick='doTurnStar(1,5)'/>
				</td>
                <td valign="middle" align="left" width=230>
					<font color='#EB6E1E'><b><span id='idFsMyd' ></span>&nbsp;分</b></font>
				</td>
                <td valign="middle" align="left" width="60">质感/口感:&nbsp;</td>
                <td valign="middle" align="left" width="96">
    				<img id='idStart21' src='images/star1.gif' onclick='doTurnStar(2,1)'/>
    				<img id='idStart22' src='images/star1.gif' onclick='doTurnStar(2,2)'/>
    				<img id='idStart23' src='images/star1.gif' onclick='doTurnStar(2,3)'/>
    				<img id='idStart24' src='images/star1.gif' onclick='doTurnStar(2,4)'/>
    				<img id='idStart25' src='images/star1.gif' onclick='doTurnStar(2,5)'/>
				</td>
                <td valign="middle" align="left">
					<font color='#EB6E1E'><b><span id='idFsKg' ></span>&nbsp;分</b></font>
				</td>
				</tr>
				<tr height=30>
                <td valign="middle" align="left">实用性:&nbsp;
				</td>
                <td valign="middle" align="left">
    				<img id='idStart31' src='images/star1.gif' onclick='doTurnStar(3,1)'/>
    				<img id='idStart32' src='images/star1.gif' onclick='doTurnStar(3,2)'/>
    				<img id='idStart33' src='images/star1.gif' onclick='doTurnStar(3,3)'/>
				    <img id='idStart34' src='images/star1.gif' onclick='doTurnStar(3,4)'/>
				    <img id='idStart35' src='images/star1.gif' onclick='doTurnStar(3,5)'/>
				</td>
                <td valign="middle" align="left">
					<font color='#EB6E1E'><b><span id='idFsSyx' ></span>&nbsp;分</b></font>
				</td>
                <td valign="middle" align="left">性价比:&nbsp;</td>
                <td valign="middle" align="left">
    				<img id='idStart41' src='images/star1.gif' onclick='doTurnStar(4,1)'/>
    				<img id='idStart42' src='images/star1.gif' onclick='doTurnStar(4,2)'/>
    				<img id='idStart43' src='images/star1.gif' onclick='doTurnStar(4,3)'/>
    				<img id='idStart44' src='images/star1.gif' onclick='doTurnStar(4,4)'/>
				    <img id='idStart45' src='images/star1.gif' onclick='doTurnStar(4,5)'/>
				</td>
                <td valign="middle" align="left">
					<font color='#EB6E1E'><b><span id='idFsXjb' ></span>&nbsp;分</b></font>
				</td>
				</tr>
				<tr height="100">
                <td colspan=6 valign="middle" align="left">
                <textarea name='strContent' value="" rows="5" cols="83" onFocus="doFcs()" class='textareaA'>
				请输入点评内容（300字以内）
                </textarea>
				</td>
				</tr>
				<tr>
                <td colspan=6 valign="middle" align="right">
				<input name="" type="image" src='images/btnFb.gif' />
				</td>
				</tr>
			</table>
			</s:form>
		</td>
		</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>

