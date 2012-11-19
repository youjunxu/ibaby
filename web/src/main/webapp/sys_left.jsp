<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
%>
    
		<table cellspacing='0' cellpadding="0" border='0'>
 		<%
 		if (strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaA.action'><font color=green>信息发布</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("IG509")>=0 || strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaG.action'><font color=green>线上IGO</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaB.action'><font color=green>会员信息</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaC.action'><font color=green>用户权限</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaE.action'><font color=green>省市管理</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("999")>=0 | strUserAcl.indexOf("IG509")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaLX.action'><font color=green>商品类型</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaPP.action'><font color=green>商品品牌</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysBA_jygl.action'><font color=green>文档校验管理</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaF.action'><font color=green>相片审核</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("BA509")>=0 || strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaBa.action'><font color=green>文章审核</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaBb.action'><font color=green>历史审核信息</font></a></td>
 		</tr>
 		<%
 		}
 		if (strUserAcl.indexOf("999")>=0)
 		{
 		%>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaHd.action'><font color=green>贝爱乐园</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/myInBox.action'><font color=green>信箱</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaJf.action'><font color=green>积分规则</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaNET.action'><font color=green>网站信息</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaTxsh.action'><font color=green>用户头像审核</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaYqlj.action'><font color=green>好站链接</font></a></td>
 		</tr>
     	<tr>
      		<td height=25 width=50>&nbsp;</td>
      		<td><img src='<%=basePath%>/images/icon_dot.gif' />&nbsp;<a href='<%=basePath%>/sysmanaD.action'><font color=green>系统日志</font></a></td>
 		</tr>
 		<%
 		}
 		%>
        <tr>
        <td colspan=2>&nbsp;</td>
        </tr>
    	</table>

