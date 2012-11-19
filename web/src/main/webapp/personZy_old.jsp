<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.UserEj"%>
<%@ page import="com.lhq.prj.bms.po.GoodFriend"%>
<%@ page import="com.lhq.prj.bms.po.EjDocuments"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String strHomePath="graph/net";

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
UserEj e=(UserEj) request.getSession().getAttribute("waitListA_ej");
String strLmp;
Integer flagHy;
String[] objBq;
if (e==null)
{
%>
	<jsp:forward page="error.jsp" />
<%
}
flagHy=(Integer)request.getAttribute("flagHy");

List lstDoc=(List)request.getAttribute("waitList_doc");
List lstFriend=(List)request.getAttribute("sysFriends_disp");

//页码等信息
Integer intA;
Integer intB;
Integer intSize=(Integer)request.getAttribute("sysCount_disp");
Integer intPageZs=(Integer)request.getAttribute("sysPageZs_disp");
Integer intPageLine;
Integer intPageCur;
String strPageOut="";
Integer intCurGrp;
Integer intGrpPage=7;
strLmp=(String)request.getParameter("pCur");

if (intSize==null) intSize=0;
if (intPageZs==null) intPageZs=0;
intPageLine=10;
intPageCur=1;
if (strLmp!=null)
{
	intPageCur=Integer.valueOf(strLmp);
}
if (intSize>0)
{
	//计算翻页信息
	if (intPageZs>1)
	{
		intCurGrp=1;
		strPageOut="共"+intPageZs.toString()+"页&nbsp;";
		if (intPageCur==1)
		{
			strPageOut=strPageOut+" 第一页 ";
		}else
		{
			strPageOut=strPageOut+"<input type='button' value='第一页' onclick='toPage(1)'>";
		}
		if (intPageCur==1)
		{
			strPageOut=strPageOut +" 上一页 ";
		}else
		{
			intLmp=intPageCur-1;
			strPageOut=strPageOut+"<input type='button' value='上一页' onclick='toPage("+intLmp.toString()+")'>";
		}
		//当中页码
		if (intPageZs<=intGrpPage)
		{
			for (intLmp=1;intLmp<=intPageZs;intLmp++)
			{
				if (intLmp!=intPageCur)
				{
					strPageOut=strPageOut+"&nbsp;&nbsp;<input type='button' value='"+String.valueOf(intLmp)+"' nclick='toPage("+intLmp.toString()+")'>";
				}else
				{
					strPageOut=strPageOut+"&nbsp;&nbsp;<b>"+String.valueOf(intLmp)+"</b>";
				}
			}
		}else
		{
			intCurGrp=intPageCur/intGrpPage;
			if (intPageCur<intGrpPage)
			{
				intCurGrp=0;
			}
			if ((intPageCur%intGrpPage)>0)
			{
				intCurGrp=intCurGrp+1;
			}
			intA=(intCurGrp-1)*intGrpPage+1;
			intB=intCurGrp*intGrpPage;
			if (intPageZs<intB)
			{
				intB=intPageZs;
			}
			for (intLmp=intA;intLmp<=intB;intLmp++)
			{
				if (intLmp!=intPageCur)
				{
					strPageOut=strPageOut+"&nbsp;&nbsp;<input type='button' value='"+String.valueOf(intLmp)+"' onclick='toPage("+intLmp.toString()+")'>";
				}else
				{
					strPageOut=strPageOut+"&nbsp;&nbsp;<b>"+String.valueOf(intLmp)+"</b>";
				}
			}
		}
			
		if (intPageCur==intPageZs)
		{
			strPageOut=strPageOut+"&nbsp;&nbsp;下一页&nbsp;&nbsp;末页&nbsp;";
		}else
		{
			intLmp=intPageCur+1;
			strPageOut=strPageOut+"&nbsp;&nbsp;<input type='button' value='下一页' onclick='toPage("+intLmp.toString()+")'>";
   			strPageOut=strPageOut+"&nbsp;&nbsp;<input type='button' value='末页' onclick='toPage("+intPageZs.toString()+")'>";
		}
		strPageOut=strPageOut+"&nbsp;&nbsp;<input type=text name='ipg' size=5 width=50 value=''/>";
		strPageOut=strPageOut+"&nbsp;&nbsp;<input type='button' value='跳转' onclick='toTurnPage()'>";
	}
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝爱e家</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script LANGUAGE='Javascript'>
function toContent()
{
	var t1='';
	t1='<%=basePath%>/oPersonContent.action?userId=<%=e.getUserId()%>';
	location.href=t1;
}
function toGrPhoto()
{
	var t1='';
	<%
	if (e.getPhotoStatus()==0)
	{
		%>
		alert('对不起，他/她尚未开通相册！');
		return ;
		<%
	}else
	{
	%>
		t1='<%=basePath%>/oPersonPhoto.action?userId=<%=e.getUserId()%>';
		location.href=t1;
	<%
	}
	%>
}
function openGoodFriend(sid)
{
	var t1='';
	t1='<%=basePath%>/toPersonHome.action?userId='+sid;
	location.href=t1;
}
function toOpenDoc(sid)
{
	var t1='';
	t1='<%=basePath%>/prevOpenBADoc.action?baId='+sid;
	location.href=t1;
}
function toPage(strP)
{
	var i=0;
	var t1='';
	i=(parseInt(strP)-1)*<%=intPageLine%>;
	t1='<%=basePath%>/toPersonHome.action?pCur='+strP+'&limit=<%=intPageLine%>&start='+i;
	location.href=t1;
}
function toTurnPage()
{
	var doc=document.forms[0];
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

</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>
	    <table width=100% border="0" cellspacing="0" cellpadding="0" >
    	<tr>
        <td style='width:25px;'></td>
		<%
		if (e.getPhotoStatus().equals(1))
		{
		%>
    	<td align="left" width=73% style='font-size:24px;' >
    	<font color='#248D93'><b><%=e.getEjName()%></b></font>
		</td>
    	<td align='left' valign="bottom" style='width:100px;font-size:14px;'>
    	<img src="images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toContent()'><font color='#2F9681'>博文列表</font></a>
    	</td>
    	<td align='left' valign="bottom" style='font-size:14px;' >
    	<img src="images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toGrPhoto()'><font color='#2F9681'>制造记忆</font></a>
    	</td>
		<%
		}else
		{
		%>
    	<td align="left" width=85% style='font-size:24px;' >
    	<font color='#248D93'><b><%=e.getEjName()%></b></font>
		</td>
    	<td align='left' valign="bottom" style='width:100px;font-size:14px;'>
    	<img src="images/index_icon_03s.gif" />&nbsp;&nbsp;
    	<a href='javascript:toContent()'><font color='#2F9681'>博文列表</font></a>
    	</td>
		<%
		}
		%>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td align="left" valign="middle">
    <table border="0" cellspacing="0" cellpadding="0" style="width:909px;margin-left:20px;height:322px;background:url(images/homebk_top.gif) no-repeat left;">
   	<tr>
	<td align="center" valign="middle" style='width:400px;background:url(images/homeBk_photo.gif) no-repeat center;'>
	<%
	if (e.getSyPhoto()!=null)
	{
		strLmp=strHomePath+e.getSyPhoto();
	%>
	<img src='<%=strLmp%>' style='width:357px;height:260px;' />
	<%
	}
	%>
	</td>
	<td align="left" valign="top">
    	<table border="1" width=100% cellspacing="0" cellpadding="0" style='margin-top:20px;'>
	   	<tr>
		<td align="center" valign="bottom" style='height:27px;'>
		<img src='images/homeXy1.gif'  />
   		</td>
   		</tr>
   		<tr style='height:10px;'><td>&nbsp;</td></tr>
	   	<tr style='height:100px;'>
   		<td valign="top" style='line-height:30px;'>
		<%=e.getHomeXy()==null?"":e.getHomeXy()%>
   		</td>
   		</tr>
	   	<tr style="height:98px;">
		<td align="left" valign="top" style="background:url(images/homeBk_js.gif) left no-repeat;">
	    	<table border="0" width=80% cellspacing="0" cellpadding="0" style='margin-left:40px;margin-top:20px;'>
			<tr><td align='left' valign='top' style='line-height:20px;'>
			<%=e.getEjContent()==null?"":e.getEjContent()%>
   			</td>
	   		</tr>
	   		</table>
   		</td>
   		</tr>
   		<tr style='height:26px;'>
   		<td align='left'>
   			<table border="0" width=92% cellspacing="0" cellpadding="0" style='margin-left:14px;'>
	   		<tr style='height:5px;'>
   			<td class=td_dash colspan=9>&nbsp;</td>
   			</tr>
   			<tr style='height:35px;'>
	   		<td class=td_dash width=60 align=left valign="middle"><b>个人标签</b></td>
	   		<%
	   		if (e.getGrLable()!=null)
	   		{
	   			objBq=e.getGrLable().split(" ");
	   			for (intLmp=0;intLmp<objBq.length;intLmp++)
	   			{
	   				if (intLmp>0)
	   				{
		   				%>
			   			<td class=td_dash align=left valign="middle" style='width:10px;'>&nbsp;</td>
		   				<%
	   				}
	   				%>
   					<td class=td_dash align=left valign="middle" style='width:15px;background:url(images/lab_left.jpg) right no-repeat ;'>&nbsp;</td>
   					<td class=td_dash align=left valign="middle" style='width:42px;background:url(images/lab_middle.jpg) repeat-x center;'>
   					<font color='#FFFFFF'><%=objBq[intLmp]%></font>
   					</td>
		   			<td class=td_dash align=left valign="middle" style='width:5px;background:url(images/lab_right.jpg) left no-repeat ;'>&nbsp;</td>
	   				<%
	   			}
	   		}
	   		%>
   			<td class=td_dash>&nbsp;</td>
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
<tr style='height:20px;'><td>&nbsp;</td></tr>
<tr>
<td width=100% align="left" >
	<table border="0" width=96% cellspacing="0" cellpadding="0" style='margin-left:20px;'>
	<tr>
	<td class='td_rdash' valign="top" align="left" style='width:200px;'>
		<table border="0" width=100% cellspacing="0" cellpadding="0" >
		<%
		if (flagHy==0)
		{
		%>
		<tr style='height:20px;'>
		<td style='font-size:14px;'>
		<a href='<%=basePath%>/addMemberHy.action?bgzUserName=<%=e.getUserName()%>&bgzUserId=<%=e.getUserId()%>' >
		<font color='#2F9681' ><b>加为好友</b></font></a>
		</td>
		</tr>
		<%
		}
		%>
		<tr style='height:20px;'>
		<td style='font-size:14px;'>
		<a href='<%=basePath%>/prevSendNewMsg.action?recUserId=<%=e.getUserId()%>' >
		<font color='#2F9681' ><b>发送站内信</b></font></a>
		</td>
		</tr>
		<tr style='height:30px;'>
		<td>
			<table border="0" width=98% cellspacing="0" cellpadding="0" >
			<tr>
			<td align='left' style='width:150px;font-size:14px;'>
			<font color='#0C9689'><b><%=e.getSex().equals("男")?"他":"她"%>的好友</b></font>
   			</td>
			<td align='left'>
			<a href='<%=basePath%>/seekOtherHy.action?userId=<%=e.getUserId()%>'><u>更多</u></a>
   			</td>
   			</tr>
		   	</table>
   		</td>
   		</tr>
		<%
		if(lstFriend.size()==0)
		{
			out.println("<tr style='height:10px;'>");
		}else
		{
			if(lstFriend.size()<4)
			{
				out.println("<tr style='height:70px;'>");
			}else
			{
				if(lstFriend.size()<7)
				{
					out.println("<tr style='height:150px;'>");
				}else
				{
					out.println("<tr style='height:230px;'>");
				}
			}
		}
		%>
		<td align='left' valign='top'>
		<%
		if(lstFriend.size()>0)
		{
			%>
			<table border="0" width=90% cellspacing="0" cellpadding="0" style='border-bottom:1px solid #EAE6E7;'>
			<%
			for (intLmp=0;intLmp<lstFriend.size();intLmp++)
			{
				GoodFriend g=(GoodFriend)lstFriend.get(intLmp);
				if (intLmp==0)
				{
					out.print("<tr>");
				}
				if (intLmp==3 || intLmp==6)
				{
			%>
			<tr style='height:10px;'><td colspan=3>&nbsp;</td></tr>
			<tr>
			<%
				}
			%>
			<td align='center' valign='top' >
				<table border="0" width=100% cellspacing="0" cellpadding="0" >
				<%
				if(g.getBgzHeadImg()!=null)
				{
				%>
				<tr><td><img src='<%=basePath%>/<%=strHomePath%>/<%=g.getBgzHeadImg()%>' width=52 height=52 /></td></tr>
				<%
				}else
				{
				%>
				<tr><td><img src='' width=52 height=52 /></td></tr>
				<%
				}
				%>
				<tr style='height:20px;'><td valign='bottom'>
				<a href="javascript:openGoodFriend('<%=g.getBgzUserId()%>')"><%=g.getBgzNickName()%></a>
   				</td></tr>
		   		</table>
			</td>
			<%
				if (intLmp==2 || intLmp==5 || intLmp==8)
				{
					out.print("</tr>");
				}
			}
			if (lstFriend.size()%3==1)
			{
				out.println("<td colspan=2 width=104></td></tr>");
			}else
			{
				if (lstFriend.size()%3==2)
				{
					out.println("<td width=52></td></tr>");
				}
			}
			%>
			</table>
   		</td>
   		</tr>
		<tr style='height:35px;'><td>&nbsp;</td></tr>
		<%
		}else
		{
		%>
   		</td>
   		</tr>
		<%
		}
		%>
		<tr>
		<td style='font-size:14px;'>
		<font color="#0C9689"><b>个人应用</b></font>
   		</td>
   		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
		&nbsp;
   		</td>
		</tr>
	   	</table>
	</td>
	<td align='center' valign='top'>
	<!-- 右侧主体 文章信息-->
		<table border="0" width=93% cellspacing="0" cellpadding="0" >
		<%
		if (lstDoc.size()>0)
		{
			for (intLmp=0;intLmp<lstDoc.size();intLmp++)
			{
				EjDocuments ed=(EjDocuments) lstDoc.get(intLmp);
				if (intLmp>0)
				{
					out.println("<tr style='height:20px;'>");
					out.println("<td style='border-bottom:1px dotted gray;'>&nbsp;</td>");
					out.println("</tr>");
				}
				
				out.println("<tr style='height:40px;'>");
				out.println("<td align='left' valign='middle' style='font-family:黑体;font-size:15px;'>");
				out.println("<b>"+ed.getStrTitle()+"</b>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='left' style='font-size:10px;'>");
				out.println("<font color='#EAE6E7'>"+ed.getDtCrea()+"</font>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr style='height:20px;'><td>&nbsp;</td></tr>");
				out.println("<tr>");
				out.println("<td align='left' style='line-height:20px;nowrap:always;'>");
				strLmp=ed.getDocMemo();
				if (MyUtils.getStringLength(strLmp)>180)
				{
					strLmp=strLmp.substring(0,180);
				}
				intTmp=ed.getDocId();
				strLmp=strLmp+"...";
				out.println(strLmp);
				%>
				<a href="javascript:toOpenDoc('<%=intTmp.toString()%>')" >
				<font color='#F5992B'><b>查看全文 >></b></font></a>
				<%
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr style='height:20px;'><td>&nbsp;</td></tr>");
				out.println("<tr>");
				out.println("<td align='left' >");
				out.println("	<table border='0' width=98% cellspacing='0' cellpadding='0' >");
				out.println("	<tr>");
				out.println("	<td align='left' width=100 >");
				out.println("类别：");
				out.println("<a href='"+basePath+"/firstBA.action'><font color='#0C9689'>贝爱学园</font></a>");
				out.println("	</td>");
				out.println("	<td align='right' >");

				strLmp="阅读(";
				intTmp=ed.getIntReaders();
				strLmp=strLmp+"("+intTmp.toString()+")";
				strLmp=strLmp+"&nbsp;&nbsp;";
				out.println(strLmp);
				out.println("	</td>");
				out.println("	</tr>");
				out.println("	</table>");
				out.println("</td>");
				out.println("</tr>");
			}
		}
		%>
		<tr style='height:20px;'>
		<td style='border-bottom:1px dotted gray;'>&nbsp;</td>
		</tr>
		<tr style='height:40px;'><td>&nbsp;</td></tr>
		<tr>
		<td><form>
		<%=strPageOut%>
		</form>
		</td>
		</tr>
		<tr style='height:40px;'><td>&nbsp;</td></tr>
	   	</table>
	</td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:20px;'><td>&nbsp;</td></tr>
<table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
