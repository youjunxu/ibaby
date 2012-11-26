<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
<%@ page import="com.lhq.prj.bms.po.Spgg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

List lsA=(List)request.getAttribute("baFirst_aa");
List lsB=(List)request.getAttribute("baFirst_ba");
List lsC=(List)request.getAttribute("baFirst_ca");
List lsD=(List)request.getAttribute("baFirst_da");
List lsE=(List)request.getAttribute("baFirst_ea");
List lsF=(List)request.getAttribute("baFirst_fa");

List lsDa=(List)request.getAttribute("baFirst_ab");
List lsDb=(List)request.getAttribute("baFirst_bb");
List lsDc=(List)request.getAttribute("baFirst_cb");
List lsDd=(List)request.getAttribute("baFirst_db");
List lsDe=(List)request.getAttribute("baFirst_eb");
List lsDf=(List)request.getAttribute("baFirst_fb");
List lsGg=(List)request.getAttribute("baFirst_spgg");
String[] objLmp=null;
Integer intLmp;
Integer intTmp;
Integer intA;
Integer intMid;
String strDispA="";
String strDispB="";
String strDispC="";
String strDispD="";
String strDispE="";
String strDispF="";

String strDiA="";
String strDiB="";
String strDiC="";
String strDiD="";
String strDiE="";
//计算每个显示的标题
for (intLmp=0;intLmp<lsDa.size();intLmp++)
{
	if (!"".equals(strDispA)) strDispA=strDispA+"&nbsp;/&nbsp;";
	objLmp=((String)lsDa.get(intLmp)).split("`");
	if (!"".equals(strDiA)) strDiA=strDiA+"`"; 
	strDiA=strDiA+objLmp[1];
	strDispA=strDispA+"<a onmouseover='dispModuleMemo(1,"+objLmp[1]+")' href='"+basePath+"/baSeekList.action?lmCode="+objLmp[1]+"'><font color='#108F84' size=+1><b>"+objLmp[0]+"</b></font></a>";
}
for (intLmp=0;intLmp<lsDb.size();intLmp++)
{
	if (!"".equals(strDispB)) strDispB=strDispB+"&nbsp;/&nbsp;";
	objLmp=((String)lsDb.get(intLmp)).split("`");
	if (!"".equals(strDiB)) strDiB=strDiB+"`"; 
	strDiB=strDiB+objLmp[1];
	strDispB=strDispB+"<a onmouseover='dispModuleMemo(2,"+objLmp[1]+")' href='"+basePath+"/baSeekList.action?lmCode="+objLmp[1]+"'><font color='#108F84' size=+1><b>"+objLmp[0]+"</b></font></a>";
}
for (intLmp=0;intLmp<lsDc.size();intLmp++)
{
	if (!"".equals(strDispC)) strDispC=strDispC+"&nbsp;/&nbsp;";
	objLmp=((String)lsDc.get(intLmp)).split("`");
	if (!"".equals(strDiC)) strDiC=strDiC+"`"; 
	strDiC=strDiC+objLmp[1];
	strDispC=strDispC+"<a onmouseover='dispModuleMemo(3,"+objLmp[1]+")' href='"+basePath+"/baSeekList.action?lmCode="+objLmp[1]+"'><font color='#108F84' size=+1><b>"+objLmp[0]+"</b></font></a>";
}
for (intLmp=0;intLmp<lsDd.size();intLmp++)
{
	if (!"".equals(strDispD)) strDispD=strDispD+"&nbsp;/&nbsp;";
	objLmp=((String)lsDd.get(intLmp)).split("`");
	if (!"".equals(strDiD)) strDiD=strDiD+"`"; 
	strDiD=strDiD+objLmp[1];
	strDispD=strDispD+"<a onmouseover='dispModuleMemo(4,"+objLmp[1]+")' href='"+basePath+"/baSeekList.action?lmCode="+objLmp[1]+"'><font color='#108F84' size=+1><b>"+objLmp[0]+"</b></font></a>";
}
for (intLmp=0;intLmp<lsDe.size();intLmp++)
{
	if (!"".equals(strDispE)) strDispE=strDispE+"&nbsp;/&nbsp;";
	objLmp=((String)lsDe.get(intLmp)).split("`");
	if (!"".equals(strDiE)) strDiE=strDiE+"`"; 
	strDiE=strDiE+objLmp[1];
	strDispE=strDispE+"<a onmouseover='dispModuleMemo(5,"+objLmp[1]+")' href='"+basePath+"/baSeekList.action?lmCode="+objLmp[1]+"'><font color='#108F84' size=+1><b>"+objLmp[0]+"</b></font></a>";
}
strDispF="<a href='"+basePath+"/baSeekList.action?lmCode="+(String)lsDf.get(1)+"'><font color='#FFFFFF'>译言堂:来自国外知识</font></a>";
String strLmp;
String strTmp;
Integer intXh;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝家爱家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script LANGUAGE='Javascript'>
function dispModuleMemo(sxh,sid)
{
	var objA='<%=strDiA%>'.split('`');
	var objB='<%=strDiB%>'.split('`');
	var objC='<%=strDiC%>'.split('`');
	var objD='<%=strDiD%>'.split('`');
	var objE='<%=strDiE%>'.split('`');
	var objT=null;
	var i=0;
	
	if (sxh==1)
	{
		for (i=0;i<objA.length;i++)
		{
			objT=document.getElementById('idBaAreaBy'+objA[i]);
			if (objT)
			{
				if (parseInt(objA[i])==parseInt(sid))
				{
					objT.style.display='block';
				}else
				{
					objT.style.display='none';
				}
			}
		}
	}
	if (sxh==2)
	{
		for (i=0;i<objB.length;i++)
		{
			objT=document.getElementById('idBaAreaBy'+objB[i]);
			if (objT)
			{
				if (parseInt(objB[i])==parseInt(sid))
				{
					objT.style.display='block';
				}else
				{
					objT.style.display='none';
				}
			}
		}
	}
	if (sxh==3)
	{
		for (i=0;i<objC.length;i++)
		{
			objT=document.getElementById('idBaAreaBy'+objC[i]);
			if (objT)
			{
				if (parseInt(objC[i])==parseInt(sid))
				{
					objT.style.display='block';
				}else
				{
					objT.style.display='none';
				}
			}
		}
	}
	if (sxh==4)
	{
		for (i=0;i<objD.length;i++)
		{
			objT=document.getElementById('idBaAreaBy'+objD[i]);
			if (objT)
			{
				if (parseInt(objD[i])==parseInt(sid))
				{
					objT.style.display='block';
				}else
				{
					objT.style.display='none';
				}
			}
		}
	}
	if (sxh==5)
	{
		for (i=0;i<objE.length;i++)
		{
			objT=document.getElementById('idBaAreaBy'+objE[i]);
			if (objT)
			{
				if (parseInt(objE[i])==parseInt(sid))
				{
					objT.style.display='block';
				}else
				{
					objT.style.display='none';
				}
			}
		}
	}
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
			alert('请您先登录再进行此操作！');
			location.href='<%=basePath%>/login.jsp';
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

function doMore1(strBj)
{
	location.href='<%=basePath%>/baSeekList.action?lmCode='+strBj;
}

function doMore(strBj)
{
	location.href='<%=basePath%>/baSeekList.action?grpCode='+strBj;
}
function doOpenBaDoc(strId)
{
	location.href='<%=basePath%>/prevOpenBADoc.action?baId='+strId;
}
  
</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">BAXY</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr><td valign='middle'>
<table width="100%" cellspacing="0" cellpadding="0" style='border:solid 1px #FFFFFF;'>
  <tr style='height:40px;'>
  	<td width=20></td>
    <td class="grnbold" align=left valign="middle" width=70>
    &nbsp;<img src='<%=basePath%>/images/lb.jpg' width=12 />&nbsp;公告：
    </td><td align=left valign="middle" width=660>
    <!-- 滚动公告 -->
    <%
	strLmp="";
    if (lsGg.size()>0)
    {
   		for (intLmp=0;intLmp<lsGg.size();intLmp++)
    	{
    		Spgg gg=(Spgg)lsGg.get(intLmp);
    		if (intLmp>0) strLmp=strLmp+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    		strLmp=strLmp+"<a href='"+basePath+"/prevActGgOpen.action?ggId="+String.valueOf(gg.getGgId())+"'>";
    		strLmp=strLmp+"<font color=red><b>"+gg.getStrTitle()+"</b></font></a>";
    	}
    }
  %>
	<marquee direction=left onMouseOut=this.start() onMouseOver=this.stop() scrollamount=2 scrolldelay=1 ><%=strLmp%></marquee>
	</td>
    <td valign="center" width=200 align='right'>
    <a href='javascript:doWyfx()'><img src="<%=basePath%>/images/wyfx1.jpg" /></a>&nbsp;&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td align=left>
<table border="0" cellspacing="0" cellpadding="0" style='width:900px;margin-left:16px;'>
  <tr height=235>
  <td class='baIndex_yyt' width='461px' height='225' valign=middle align="left">
    <%
    intA=0;
    if(lsF==null)
    {
    	intA=0;
    }else
    {
    	intA=lsF.size();
    }
    if (intA>0)
    {
	    if (intA>4) intA=4;
	    intLmp=intA+3;
	    if (intLmp>6) intLmp=6;
	    %>
	<table border="0" cellspacing="0" cellpadding="0" align=center valign=middle style='width:100%; height:100%; color: #CCCCCC; font-size: 12px;'>
	    <tr style='height:38px; font-size: 24px; font-weight: bold; color: #FFF;'>
    		<td colspan="3" valign='bottom'>&nbsp;<%=strDispF%></td>
    		<td></td>
   		</tr>
	    <tr>
    		<td width=38% align="center" rowspan=<%=intLmp%>>&nbsp;<img src='<%=basePath%>/images/index_26.jpg' style='width:124px;height:124px;'/></td>
        	<td style='height:10px;'></td>
        	<td width=5%></td>
    	</tr>
	    <%
    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsF.get(intLmp);
    	%>
	    <tr>
    		<td style='height:25px; color: #B59423; font-size: 12px; font-weight: normal;'>
	        <img src='<%=basePath%>/images/index_icon_22.gif'/>&nbsp;<a href="javascript:doOpenBaDoc('<%=lm.getBaId()%>')"><%=lm.getStrTitle()%></a></td>
	        <td width=5%></td>
    	</tr>
    	<%
    	}
    	intLmp=0;
    	if (intA<4)
    	{
	    	intLmp=(4-intA)*25;
	    	%>
	    	<tr><td colspan=2 style='height:<%=intLmp%>px;'>&nbsp;</td></tr>
	    	<%
    	}
	   	%>
	    <tr>
    		<td align=right style='height:25px;'><a href='javascript:doMore(6)'>查看更多>></a></td>
    	    <td width=5%></td>
	    </tr>
	    <tr>
    		<td style='height:8px;' colspan="3">&nbsp;</td>
    	</tr>
	   	<%
    }else
    {
	    %>
	<table border="0" cellspacing="0" cellpadding="0" align=center valign=middle style='margin-top:5px;width:100%; height:95%; color: #CCCCCC; font-size: 12px;'>
	    <tr style='height:10px;'><td colspan=2></td></tr>
	    <tr style='height:38px; font-size: 24px; font-weight: bold; color: #FFF;'>
    		<td colspan="2" valign='middle'>&nbsp;
   	        <%=strDispF%>
    		</td>
    	</tr>
	    <tr>
    		<td width=38% align="center" rowspan=2>&nbsp;<img src='<%=basePath%>/images/index_26.jpg' style='width:124px;height:124px;'/></td>
        	<td >&nbsp;</td>
    	</tr>
	    <tr>
    		<td style='height:120px;' colspan="2" valign='top'>
				<table border="0" cellspacing="0" cellpadding="0" width=100% align='center' valign='middle' >
    			<tr style='height:75px;'><td colspan=2></td></tr>
    			<tr style='height:20px;'>
    			<td align=right style='height:25px;'><a href='javascript:doMore(6)'>查看更多>></a></td>
    			<td style='width:20px;'></td>
    			</tr>
    			<tr style='height:20px;' colspan=2><td></td></tr>
    			</table>
    		</td>
    	</tr>
    	<%
    }
    %>
    </table>
  </td>
  <td align=left valign="middle">
	<table border="0" cellspacing="0" cellpadding="0" align=center style='width:400px;margin-left:20px;'>
		<tr><td style='height:180px;' valign=top align='left'>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr><td style='text-align:left;'>
  	        <%=strDispA%>
        </td></tr>
		<tr style='height:150px;'><td>
<%
    intA=0;
    if(lsA==null)
    {
    	intA=0;
    }else
    {
    	intA=lsA.size();
    }
    if (intA>0)
    {
    	intMid=0;

    	objLmp=strDiA.split("`");
    	strLmp="";
    	intXh=0;

    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsA.get(intLmp);
    		strTmp="."+String.valueOf(lm.getLmCode())+".";
    		if (!strLmp.contains(strTmp))
    		{
        		strLmp=strLmp+"."+String.valueOf(lm.getLmCode())+".";
    		}
    		if (intMid.equals(lm.getLmCode()))
    		{
    			intXh=intXh+1;
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'>");
    			out.print("<img src='"+basePath+"/images/index_icon_21.gif' />");
				out.print("<a href=\"javascript:doOpenBaDoc('"+String.valueOf(lm.getBaId())+"')\">"+lm.getStrTitle()+"</a></td>");
				out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
				out.print("</tr>");
    		}else
    		{
    			if (intMid>0)
    			{
    		    	if ((5-intXh)>0)
    		    	{
    		    		intTmp=(5-intXh)*30;
    		    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    		    	}
    				out.print("</table>");
    			}
				intXh=1;
    			if (Integer.valueOf(objLmp[0]).equals(lm.getLmCode()))
   				{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0>");
    			}else
    			{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
    			}
    			intMid=lm.getLmCode();
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'><img src='"+basePath+"/images/index_icon_21.gif' />");
    			out.print("<a href='javascript:doOpenBaDoc("+String.valueOf(lm.getBaId())+")'>"+lm.getStrTitle()+"</a></td>");
    			out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    			out.print("</tr>");
    		}
		}
    	intLmp=5-intXh;
    	if (intLmp>0)
    	{
    		intTmp=intLmp*30;
    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    	}
		out.print("</table>");

		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
    		strTmp="."+objLmp[intLmp]+".";
			if (!strLmp.contains(strTmp))
			{
				if (intLmp==0)
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 >");
				}else
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
				}
				out.print("<tr style='height:150px;'><td></td></tr>");
				out.print("</table>");
			}
		}
    }
	%>
    	    </td></tr>
		</table>
		</td></tr>
        <tr><td height=30 valign="bottom" align='right'>
   	        <input name="" type="image" src="<%=basePath%>/images/index_icon_28.gif" onclick='doMore(1)'/>
        </td></tr>
	</table>
  </td>
  </tr>
  <tr height=235>
  <td align=left valign="middle" style='border-right:1px dashed;'>
  	<table border="0" cellspacing="0" cellpadding="0" align=center style='width:400px;margin-left:10px;'>
		<tr>
        <td align=left valign=top style='height:180px;'>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr><td style='text-align:left;'>
  	        <%=strDispB%>
        </td></tr>
		<tr style='height:150px;'><td>
<%
    intA=0;
    if(lsA==null)
    {
    	intA=0;
    }else
    {
    	intA=lsB.size();
    }
    if (intA>0)
    {
    	intMid=0;

    	objLmp=strDiB.split("`");
    	strLmp="";
    	intXh=0;

    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsB.get(intLmp);
    		strTmp="."+String.valueOf(lm.getLmCode())+".";
    		if (!strLmp.contains(strTmp))
    		{
        		strLmp=strLmp+"."+String.valueOf(lm.getLmCode())+".";
    		}
    		if (intMid.equals(lm.getLmCode()))
    		{
    			intXh=intXh+1;
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'>");
    			out.print("<img src='"+basePath+"/images/index_icon_21.gif' />");
				out.print("<a href=\"javascript:doOpenBaDoc('"+String.valueOf(lm.getBaId())+"')\">"+lm.getStrTitle()+"</a></td>");
				out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
				out.print("</tr>");
    		}else
    		{
    			if (intMid>0)
    			{
    		    	if ((5-intXh)>0)
    		    	{
    		    		intTmp=(5-intXh)*30;
    		    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    		    	}
    				out.print("</table>");
    			}
				intXh=1;
    			if (Integer.valueOf(objLmp[0]).equals(lm.getLmCode()))
   				{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0>");
    			}else
    			{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
    			}
    			intMid=lm.getLmCode();
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'><img src='"+basePath+"/images/index_icon_21.gif' />");
    			out.print("<a href='javascript:doOpenBaDoc("+String.valueOf(lm.getBaId())+")'>"+lm.getStrTitle()+"</a></td>");
    			out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    			out.print("</tr>");
    		}
		}
    	intLmp=5-intXh;
    	if (intLmp>0)
    	{
    		intTmp=intLmp*30;
    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    	}
		out.print("</table>");

		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
    		strTmp="."+objLmp[intLmp]+".";
			if (!strLmp.contains(strTmp))
			{
				if (intLmp==0)
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 >");
				}else
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
				}
				out.print("<tr style='height:150px;'><td></td></tr>");
				out.print("</table>");
			}
		}
    }
	%>
    	    </td></tr>
			</table>
  		    </td></tr>
            <tr><td height=30 valign="bottom"  align='right'>
    	        <input name="" type="image" src="<%=basePath%>/images/index_icon_28.gif" onclick='doMore(2)'/>
    	    </td></tr>
		</table>
	</td>
    <td align=left valign="middle">
	   	<table border="0" cellspacing="0" cellpadding="0" align=center style='width:400px;margin-left:20px;'>
			<tr>
        	<td align=left style='height:180px;' valign=top>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr><td style='text-align:left;'>
  	        <%=strDispC%>
        </td></tr>
		<tr style='height:150px;'><td>
<%
    intA=0;
    if(lsA==null)
    {
    	intA=0;
    }else
    {
    	intA=lsC.size();
    }
    if (intA>0)
    {
    	intMid=0;

    	objLmp=strDiC.split("`");
    	strLmp="";
    	intXh=0;

    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsC.get(intLmp);
    		strTmp="."+String.valueOf(lm.getLmCode())+".";
    		if (!strLmp.contains(strTmp))
    		{
        		strLmp=strLmp+"."+String.valueOf(lm.getLmCode())+".";
    		}
    		if (intMid.equals(lm.getLmCode()))
    		{
    			intXh=intXh+1;
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'>");
    			out.print("<img src='"+basePath+"/images/index_icon_21.gif' />");
				out.print("<a href=\"javascript:doOpenBaDoc('"+String.valueOf(lm.getBaId())+"')\">"+lm.getStrTitle()+"</a></td>");
				out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
				out.print("</tr>");
    		}else
    		{
    			if (intMid>0)
    			{
    		    	if ((5-intXh)>0)
    		    	{
    		    		intTmp=(5-intXh)*30;
    		    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    		    	}
    				out.print("</table>");
    			}
				intXh=1;
    			if (Integer.valueOf(objLmp[0]).equals(lm.getLmCode()))
   				{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0>");
    			}else
    			{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
    			}
    			intMid=lm.getLmCode();
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'><img src='"+basePath+"/images/index_icon_21.gif' />");
    			out.print("<a href='javascript:doOpenBaDoc("+String.valueOf(lm.getBaId())+")'>"+lm.getStrTitle()+"</a></td>");
    			out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    			out.print("</tr>");
    		}
		}
    	intLmp=5-intXh;
    	if (intLmp>0)
    	{
    		intTmp=intLmp*30;
    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    	}
		out.print("</table>");

		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
    		strTmp="."+objLmp[intLmp]+".";
			if (!strLmp.contains(strTmp))
			{
				if (intLmp==0)
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 >");
				}else
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
				}
				out.print("<tr style='height:150px;'><td></td></tr>");
				out.print("</table>");
			}
		}
    }
	%>
    	    </td></tr>
			</table>
  		    </td></tr>
            <tr><td height=30 valign="bottom" align='right'>
    	        <input name="" type="image" src="<%=basePath%>/images/index_icon_28.gif" onclick='doMore(3)'/>
    		</td></tr>
		</table>
  </td>
  </tr>
  <tr height=235>
  <td align=left valign="middle" style='border-right:1px dashed;'>
  	<table border="0" cellspacing="0" cellpadding="0" align=center style='width:400px;margin-left:10px;'>
		<tr>
        <td align=left style='height:180px;' valign=top>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr><td style='text-align:left;'>
  	        <%=strDispD%>
        </td></tr>
		<tr style='height:150px;'><td>
<%
    intA=0;
    if(lsA==null)
    {
    	intA=0;
    }else
    {
    	intA=lsD.size();
    }
    if (intA>0)
    {
    	intMid=0;

    	objLmp=strDiD.split("`");
    	strLmp="";
    	intXh=0;

    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsD.get(intLmp);
    		strTmp="."+String.valueOf(lm.getLmCode())+".";
    		if (!strLmp.contains(strTmp))
    		{
        		strLmp=strLmp+"."+String.valueOf(lm.getLmCode())+".";
    		}
    		if (intMid.equals(lm.getLmCode()))
    		{
    			intXh=intXh+1;
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'>");
    			out.print("<img src='"+basePath+"/images/index_icon_21.gif' />");
				out.print("<a href=\"javascript:doOpenBaDoc('"+String.valueOf(lm.getBaId())+"')\">"+lm.getStrTitle()+"</a></td>");
				out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
				out.print("</tr>");
    		}else
    		{
    			if (intMid>0)
    			{
    		    	if ((5-intXh)>0)
    		    	{
    		    		intTmp=(5-intXh)*30;
    		    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    		    	}
    				out.print("</table>");
    			}
				intXh=1;
    			if (Integer.valueOf(objLmp[0]).equals(lm.getLmCode()))
   				{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0>");
    			}else
    			{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
    			}
    			intMid=lm.getLmCode();
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'><img src='"+basePath+"/images/index_icon_21.gif' />");
    			out.print("<a href='javascript:doOpenBaDoc("+String.valueOf(lm.getBaId())+")'>"+lm.getStrTitle()+"</a></td>");
    			out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    			out.print("</tr>");
    		}
		}
    	intLmp=5-intXh;
    	if (intLmp>0)
    	{
    		intTmp=intLmp*30;
    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    	}
		out.print("</table>");

		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
    		strTmp="."+objLmp[intLmp]+".";
			if (!strLmp.contains(strTmp))
			{
				if (intLmp==0)
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 >");
				}else
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
				}
				out.print("<tr style='height:150px;'><td></td></tr>");
				out.print("</table>");
			}
		}
    }
	%>
    	    </td></tr>
			</table>
  		    </td></tr>
            <tr><td height=30 valign="bottom" align='right'>
    	        <input name="" type="image" src="<%=basePath%>/images/index_icon_28.gif" onclick='doMore(4)'/>
    	    </td></tr>
		</table>
  </td>
  <td align=left valign="middle">
  	<table border="0" cellspacing="0" cellpadding="0" align=center style='width:400px;margin-left:20px;'>
		<tr>
        <td align=left style='height:180px;' valign=top>
		<table border='0' cellspacing='0' cellpadding='0'>
		<tr><td style='text-align:left;'>
  	        <%=strDispE%>
        </td></tr>
		<tr style='height:150px;'><td>
<%
    intA=0;
    if(lsA==null)
    {
    	intA=0;
    }else
    {
    	intA=lsE.size();
    }
    if (intA>0)
    {
    	intMid=0;

    	objLmp=strDiE.split("`");
    	strLmp="";
    	intXh=0;

    	for (intLmp=0;intLmp<intA;intLmp=intLmp+1)
    	{
    		LmBaxy lm=(LmBaxy) lsE.get(intLmp);
    		strTmp="."+String.valueOf(lm.getLmCode())+".";
    		if (!strLmp.contains(strTmp))
    		{
        		strLmp=strLmp+"."+String.valueOf(lm.getLmCode())+".";
    		}
    		if (intMid.equals(lm.getLmCode()))
    		{
    			intXh=intXh+1;
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'>");
    			out.print("<img src='"+basePath+"/images/index_icon_21.gif' />");
				out.print("<a href=\"javascript:doOpenBaDoc('"+String.valueOf(lm.getBaId())+"')\">"+lm.getStrTitle()+"</a></td>");
				out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
				out.print("</tr>");
    		}else
    		{
    			if (intMid>0)
    			{
    		    	if ((5-intXh)>0)
    		    	{
    		    		intTmp=(5-intXh)*30;
    		    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    		    	}
    				out.print("</table>");
    			}
				intXh=1;
    			if (Integer.valueOf(objLmp[0]).equals(lm.getLmCode()))
   				{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0>");
    			}else
    			{
    				out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(lm.getLmCode())+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
    			}
    			intMid=lm.getLmCode();
    			out.print("<tr style='height:30px;'>");
    			out.print("<td width=300 class=td_dash style='font-size:12px;text-align:left;'><img src='"+basePath+"/images/index_icon_21.gif' />");
    			out.print("<a href='javascript:doOpenBaDoc("+String.valueOf(lm.getBaId())+")'>"+lm.getStrTitle()+"</a></td>");
    			out.print("<td width=80 class=td_dash align='right' style='font-size:12px;color:#cccccc'>"+String.valueOf(lm.getReaders())+"&nbsp;阅读&nbsp;&nbsp;&nbsp;&nbsp;</td>");
    			out.print("</tr>");
    		}
		}
    	intLmp=5-intXh;
    	if (intLmp>0)
    	{
    		intTmp=intLmp*30;
    		out.print("<tr style='height:"+String.valueOf(intTmp)+"px;'><td colspan=2></td></tr>");
    	}
		out.print("</table>");

		for (intLmp=0;intLmp<objLmp.length;intLmp++)
		{
    		strTmp="."+objLmp[intLmp]+".";
			if (!strLmp.contains(strTmp))
			{
				if (intLmp==0)
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 >");
				}else
				{
					out.print("<table align='center' width=380 id='idBaAreaBy"+String.valueOf(objLmp[intLmp])+"' border=0 cellspacing=0 cellpadding=0 style='display:none;'>");
				}
				out.print("<tr style='height:150px;'><td></td></tr>");
				out.print("</table>");
			}
		}
    }
	%>
    	    </td></tr>
			</table>
  		    </td></tr>
            <tr><td height=30 valign="bottom" align='right'>
    	        <input name="" type="image" src="<%=basePath%>/images/index_icon_28.gif" onclick='doMore(5)'/>
    	    </td></tr>
		</table>
  </td>
  </tr>
</table>
</td></tr>
<tr><td colspan=2>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
