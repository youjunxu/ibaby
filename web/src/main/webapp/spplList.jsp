<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.Sppl"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser;
String strFbsj;
SimpleDateFormat simpleDateFormat;
java.util.Date date;
Integer intLmp;

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
simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
List lstWait=(List)request.getAttribute("waitDisp_plDoc");
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

	if (intSize>0)
	{
%>
	<table cellspacing="0" cellpadding="0" border="0" width=95% height=100% >
<%
		for (inLmp=0;intLmp<lstWait.size();intLmp++)
		{
			Sppl sl=(Sppl)lstWait.get(intLmp);
%>
    <tr>
    <td>
		<table cellspacing="0" cellpadding="0" border="0" width=100% height=100% >
		<tr height="10"><td colspan="2">&nbsp;</td></tr>
		<tr height="50">
        <td width=45 align="center" valign="top">
        	<img src='images/zzdoc_3.gif' width=38 height=39 />
        </td>
        <td align="center" valign="top">
			<table cellspacing="0" cellpadding="0" border="0" width=849 height=100% >
            <tr>
        	<td valign="middle" align="left">
        		<font color="#298F94"><b>智慧福娃</b></font>&nbsp;<font color="#B2B2B2" size="-2">2012-01-01</font> 
        	</td>
        	<td align="right" valign="middle" width="100">
        		<font color="#1C9A96">综合指标<b>:</b></font>&nbsp;</td>
    	    <td align="left" valign="middle" width="96">
  	    	<%
  	    		Integer da=sl.getFsMyd()+sl.getFsKg()+sl.getFsSyx()+sl.getFsXjb();
  	    		int dd=MyUtils.getMulInt(da,4);
      	    	out.print(MyUtils.dispStartByFs(dd));
        	%>
	   		</td>
        	<td align="left" valign="middle" width="35">
    		    <font color="#EA6C15" size="+0"><b><%=dd%></b></font><font color="#EA6C15">分</font>
    	    </td>
            </tr>
            <tr style="background:url(images/zzdoc_21.gif) no-repeat bottom;">
            <td colspan="4">&nbsp;</td>
            </tr>
            <tr style="height:60px;background:url(images/zzdoc_22.gif) repeat-y;">
            <td colspan="4" align="center" valign="middle">
				<table cellspacing="0" cellpadding="0" border="0" width=95% height=100% >
                <tr>
                <td align="left" valign="middle" style='line-height:30px;'>
                <%
                	strLmp=sl.getStrContent();
                	if (strLmp!=null)
                	{
                		if (strLmp.length()>100)
                		{
                			strLmp=strLmp.substring(0,100)+"...";
                		}
                	}
                %>
                <%=strLmp%>&nbsp;&nbsp;<a href='#'>查看全部>></a>
	            </td>
    	        </tr>
	            </table>
            </td>
            </tr>
            <tr style="background:url(images/zzdoc_23.gif) no-repeat;">
            <td colspan="4">&nbsp;</td>
            </tr>
	        </table>
        </td>
    	</tr>
		</table>
	</td>
    </tr>
<%
		}
%>
	<tr style='height:30px;' ><td>&nbsp;</td></tr>
	<tr>
	<td align='center' valign='middle'>
	<%=strPageOut%>
	</td>
	</tr>
    </table>
<%
	}
%>
