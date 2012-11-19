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
List lstGs=(List)request.getAttribute("waitDisp_xcgs");
Integer intAllzs=(Integer)request.getAttribute("waitDisp_zpall");
PhotoMemo pm=(PhotoMemo)request.getAttribute("waitEditPhoto");

UserEj ej=(UserEj)request.getSession().getAttribute("waitDisp_ej");
String strLmp="";
Integer intXcZs=0;
if (lsXc==null)
{
	intXcZs=0;
}else
{
	intXcZs=lsXc.size();
}

if (pm==null)
{
	strLmp=basePath+"/error.jsp";
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
<script LANGUAGE='JavaScript'>
function doSubmit()
{
	var doc=document.form1;
	
	if (doc.xcTitle.value=='')
	{
		alert('对不起，请选择相册！');
	}else
	{
		if (doc.strTitle.value=='')
		{
			alert('对不起，请输入照片标题！');
		}else
		{
			if (!doc.sfFm[0].checked && !doc.sfFm[1].checked)
			{
				alert('对不起，请选择是否相册的封面！');
			}else
			{
				if (confirm('确实上传吗？'))
				{
					doc.submit();
				}
			}
		}
	}
}

function toXc(strId)
{
	var t1='';
	t1='<%=basePath%>/myPersonPhoto.action?xcId='+strId;
	location.href=t1;
}
function doChgLb()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.xcId,'1');
	frm.xcTitle.value=t1;
}
function doCjxc()
{
	var t1='';
	t1='<%=basePath%>/photoGl.action?BJ=0';
	location.href=t1;
}
function doLoad()
{
	var frm=document.form1;
	var t1='<%=pm.getXcId()%>';
	var i=0;
	
	for (i=0;i<frm.xcId.length;i++)
	{
		if (frm.xcId.options[i].value==t1)
		{
			frm.xcId.options[i].selected=true;
			break;
		}
	}
}
</script>
</head>
<body onLoad='doLoad()'>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">EJ</s:param>
	</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:80px;'>
<td align="left" style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:20px;border-bottom:1px solid;border-bottom-color:#9BC5B9;'>
   	<tr style='height:40px; '>
   	<td align='left' valign="bottom" style='font-size:14px;'>
		<s:action name="myPageTopMenu" executeResult="true" >
			<s:param name="topMk">PHOTOINFO</s:param>
		</s:action>
   	</td>
   	</tr>
   	<tr style='height:5px;'><td ></td></tr>
   	</table>
</td>
</tr>
<tr>
<td align='left'>
    <table width=97% border="0" cellspacing="0" cellpadding="0" style='margin-left:14px;' >
   	<tr>
    <td valign="top" width='200'>
    	<table border="0" cellspacing="0" cellpadding="0" >
    	<tr >
    	<td align='center' valign='middle'>
	    	<table border="0" cellspacing="0" cellpadding="0" style='width:187px;'>
	    	<tr>
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_1.jpg) no-repeat;'>
			</td>
	    	</tr>
	    	<tr>
	    	<td align='left' style='background:url(<%=basePath%>/images/content_bk_2.jpg) repeat-y;' valign='top'>
		    	<table border="0" style='width:150px;margin-left:10px;' cellspacing="0" cellpadding="0" >
	    		<tr style='height:40px;'>
    			<td style='width:80px;' align='left'>&nbsp;&nbsp;
    			<font face='黑体' size=3 color='#332F2E'><b>相册分类</b></font>
    			</td>
    			<td style='width:25px;'>&nbsp;</td>
    			<td align='center' style='width:30px;' >
    			<a href='<%=basePath%>/photoPzManage.action'><font color='#FE8F1C'>管理</font></a>
    			</td>
	    		</tr>
	    		<tr style='height:1px;'><td valign='middle' colspan=3 ><img src='images/content.gif' /></td></tr>
	    		<tr style='height:5px;'><td colspan=3></td></tr>
	    		<tr><td>
    			&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toXc('0')"><font color='#33927E'>全部相册</font></a>
				</td>
    			<td >&nbsp;</td>
	    		<td align='left' >(<%=intAllzs%>)</td></tr>
				<%
				if (intXcZs>0)
				{
	    			for (intLmp=0;intLmp<intXcZs;intLmp++)
	    			{
	    				PhotoPz p=(PhotoPz)lsXc.get(intLmp);
	    				out.println("<tr style='height:15px;'><td colspan=3></td></tr>");
	    				out.println("<tr><td>");
	    				%>
	    				&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toXc('<%=p.getXcId()%>')">
	    				<font color='#33927E'><%=p.getStrTitle()%></font></a>
	    				<%
	    				out.println("</td>");
	    				out.println("<td >&nbsp;</td>");
						intTmp=(Integer)lstGs.get(intLmp);
			    		out.println("<td align='left' >("+intTmp.toString()+")");
	    				out.println("</td></tr>");
		    		}
	    		}
				if (intXcZs<=3)
				{
				%>
	    		<tr style='height:34px;' ><td colspan=3></td></tr>
				<%
				}
				%>
		    	</table>
    		</td>
	    	</tr>
	    	<tr >
	    	<td style='height:5px;background:url(<%=basePath%>/images/content_bk_3.jpg) no-repeat;'>
			</td>
	    	</tr>
    		<tr style='height:20px;' ><td ></td></tr>
	    	</table>
    	</td>
    	</tr>
    	<tr><td></td></tr>
    	</table>
    </td>
    <td valign='top'>
    <!-- 文档区 -->
    	<table border="0" cellspacing="0" cellpadding="0" width=100% >
		<tr>
		<td align='left'>
		&nbsp;&nbsp;<img src="<%=basePath%>/images/sczp.jpg" />
		</td>
		</tr>
   		<tr style='height:15px;' ><td colspan=3></td></tr>
		<tr>
		<td >
		  	<s:form method="post" action="updatePhotoMemo" name="form1" theme="simple" enctype="multipart/form-data">
		  	<input type='hidden' name='photoId' value='<%=pm.getPhotoId()%>'/>
		  	<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
		  	<input type='hidden' name='userName' value='<%=objUser.getUserName()%>'/>
		  	<input type='hidden' name='xcTitle' value='<%=pm.getXcTitle()%>'/>
		  	<input type='hidden' name='wjName' value=''/>
			<table cellspacing='0' cellpadding="0" border='0' width=450 align="center" style='margin-left:50px;'>
			<tr style='height:25px;'><td colspan=2>&nbsp;</td></tr>
			<tr>
			<td align='right' width=250 >相册名称<font color=red>*</font>：</td>
 		   <td align='left'>&nbsp;
		    <s:select name='xcId' list='#request.waitDisp_xcxcxx' listKey='xcId' listValue='strTitle' headerKey='' headerValue='' onchange='doChgLb()' ></s:select>
		    	&nbsp;&nbsp;&nbsp;&nbsp;
    		</td>
			</tr>
			<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=2></TD></TR>
			<tr>
			<td align='right' width=20% >相片名称<font color=red>*</font>：</td>
 		   <td align='left'>&nbsp;
 		   <INPUT class=form value="<%=pm.getStrTitle()%>"
				style="WIDTH: 300px" type="text" maxLength=32
					name="strTitle" minlength="6" />
    		</td>
			</tr>
			<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=2></TD></TR>
			<tr>
			<td align='right' >是否相册封面<font color=red>*</font>：</td>
    		<td colspan=3 align='left'>&nbsp;
    		<%
    		if (pm.getSfFm()==null)
    		{
      		%>
       		<INPUT type='radio' value='0' name='sfFm' onclick='doXy()'>否</input>
       		<INPUT type='radio' value='1' name='sfFm' onclick='doXy()'>是</input>
       		<%
    		}else
    		{
    		%>
    		<INPUT type='radio' value='0' name='sfFm' <%=pm.getSfFm()==0?"checked":""%> onclick='doXy()'>否</input>
    		<INPUT type='radio' value='1' name='sfFm' <%=pm.getSfFm()==1?"checked":""%> onclick='doXy()'>是</input>
    		<%
    		}
    		%>
    		</td>
			</tr>
			<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=2></TD></TR>
			<TR><TD colspan=2 align="center">
			<input type=button value='提交' onclick='doSubmit()' />
			</TD></TR>
			<TR><TD height=8 colspan=2 class=td_dash></TD></TR>
			<TR><TD height=8 colspan=2></TD></TR>
			<tr >
	    	<td align='center' colspan=2>&nbsp;
	    	<%
	    	Integer iw=640;
	    	Integer ih=480;
	    	if (pm.getPhotoWidth()<640)
	    	{
	    		iw=pm.getPhotoWidth();
	    	}
	    	if (pm.getPhotoHeight()<480)
	    	{
	    		ih=pm.getPhotoHeight();
	    	}
	    	%>
    		<img src='<%=basePath%>/graph/people/<%=pm.getWjName()%>' width=<%=iw%> height=<%=ih%> />
    		</td>
			</tr>
			<TR><TD height=20 colspan=2></TD></TR>
  			</table>
	  		</s:form>
    <!-- 文档区over -->
		</td>
   		</tr>
	   	</table>
	</td>
   	</tr>
   	</table>
</td>
</tr>
</table>

</body>
</html>
<s:include value='footer.jsp'></s:include>
