<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils" %>
<%@ page import="com.lhq.prj.bms.po.UserInfo" %>
<%@ page import="com.lhq.prj.bms.po.SpType" %>
<%@ page import="com.lhq.prj.bms.po.SpBrand" %>
<%@ page import="com.lhq.prj.bms.po.LineIgo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
Integer intUmp;
String strLmp;
List lstMain=(List)request.getAttribute("sysList_disp");
List lstType=(List)request.getAttribute("sysList_lxdisp");
List lstBrand=(List)request.getAttribute("sysList_ppdisp");
List lstABrand=(List)request.getAttribute("sysList_allppdisp");
Integer intCurGuide=(Integer)request.getAttribute("wait_guideId");
Integer intCurLx=(Integer)request.getAttribute("wait_typeId");
Integer intCurBrand=(Integer)request.getAttribute("wait_brandId");
String strCurGuide=(String)request.getAttribute("wait_guideMc");
String strCurType=(String)request.getAttribute("wait_typeMc");
String strCurBrand=(String)request.getAttribute("wait_brandMc");

if (intCurGuide==null) intCurGuide=0;
if (intCurLx==null) intCurLx=0;
if (intCurBrand==null) intCurBrand=0;
if (strCurGuide==null) strCurGuide="";
if (strCurType==null) strCurType="";
if (strCurBrand==null) strCurBrand="";

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
Integer intPageLine=9;
intTmp=7;
String strPageOut=MyUtils.getNormalPageInfo(intSize,intPageLine,intPageCur,intPageZs,intTmp);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>线上IGO</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<style type="text/css">
#idABack{ display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: gray;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
#idBBack{display: none;  position: absolute; top:20%;left:30%; padding: 0px;  border: 0px;  background-color: #E8E9F7;  z-index:1002;  overflow: auto;}
</style>
<script language="javascript">
<!--
function toPage(strPg)
{
	var t1='<%=basePath%>/firstIGO.action?igoTypeId='+sid+'&brandId=<%=intCurBrand%>&pCur='+strPg+'&limit=<%=intPageLine%>';
	t1=t1+'&guide=<%=intCurGuide%>';
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
function toOpenIgo(sid)
{
	var t1='<%=basePath%>/prevASeekIgo.action?igoId='+sid;
	location.href=t1;
}
function changeType(sid)
{
	var t1='<%=basePath%>/firstIGO.action?igoTypeId='+sid+'&brandId=<%=intCurBrand%>';
	t1=t1+'&guide=<%=intCurGuide%>';
	location.href=t1;
}
function changeGuide(sid)
{
	var t1='<%=basePath%>/firstIGO.action?igoTypeId=<%=intCurLx%>&brandId=<%=intCurBrand%>';
	t1=t1+'&guide='+sid;
	location.href=t1;
}
function changeBrand(sid)
{
	var t1='<%=basePath%>/firstIGO.action?igoTypeId=<%=intCurLx%>&brandId='+sid;
	t1=t1+'&guide=<%=intCurGuide%>';
	location.href=t1;
}
//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">IGO</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:20px;'>
	<td style='background:url(<%=basePath%>/images/top_bottom.gif) no-repeat;'/>
    </td>
</tr>
<tr >
<td align='center' valign='top' >
	<table border="0" cellspacing="0" cellpadding="0" >
	<tr>
	<td style='height:155px;width:935px;background:url(<%=basePath%>/images/igo1.gif) no-repeat ;' align='center'>
		<table border="0" cellspacing="0" cellpadding="0" style='height:140px;' width=98% >
		<tr style='height:40px;'>
		<td style='width:75px;' align='right'>
		<font color='#209493'><b>分&nbsp;&nbsp;&nbsp;&nbsp;类：</b></font></td>
		<td align='left' class='td_dash'>
			<table cellspacing="0" cellpadding="0" width=98% border=0>
			<tr style='height:25px;'>
		<%
		if (intCurLx==0)
		{
			out.println("<td style='background-color:#229293;' align='center' width=50 >");
			out.println("<font color='#FFFFFF'>全部</font></td>");
		}else
		{
			%>
			<td align='center' width=50 >
			<a href="javascript:changeType('0')">全部</a></td>
			<%
		}
		intUmp=840-50;
		if (lstType.size()>0)
		{
			for (intLmp=0;intLmp<lstType.size();intLmp++)
			{
				SpType st=(SpType)lstType.get(intLmp);
				if (st.getSpTypeId().equals(intCurLx))
				{
					if (MyUtils.getStringLength(st.getSpTypeName())<7)
					{
						out.println("<td style='background-color:#229293;' align='center' width=50 >");
						intUmp=intUmp-50;
					}else
					{
						out.println("<td style='background-color:#229293;' align='center' width=68 >");
						intUmp=intUmp-68;
					}
					out.println("<font color='#FFFFFF'>"+st.getSpTypeName()+"</font></td>");
				}else
				{
					if (MyUtils.getStringLength(st.getSpTypeName())<7)
					{
						out.print("<td align='center' width=50 >");
						intUmp=intUmp-50;
					}else
					{
						out.print("<td align='center' width=68 >");
						intUmp=intUmp-68;
					}
					%>
					<a href="javascript:changeType('<%=st.getSpTypeId()%>')"><%=st.getSpTypeName()%></a></td>
					<%
				}
				if (intLmp>=9) break;
			}
			if (lstType.size()>10)
			{
				%>
				<td align='center' width=50 >...</td>
				intUmp=intUmp-50;
				<%
			}
		}
		%>
			<td width=<%=intUmp%> ></td>
			</tr>
			</table>
		</td>
		</tr>
		<tr style='height:40px;'>
		<td align='right' style='width:75px;' >
		<font color='#209493'>
		<b>价&nbsp;&nbsp;&nbsp;&nbsp;格：</b></font></td>
		<td align='left' class='td_dash'>
			<table border='0' cellspacing="0" cellpadding="0" width=98% >
			<tr style='height:25px;'>
		<%
		if (intCurGuide==0)
		{
			out.println("<td style='background-color:#229293;' align='center' width=50 >");
			out.println("<font color='#FFFFFF'>全部</font></td>");
		}else
		{
			%>
			<td align='center' width=50 >
			<a href="javascript:changeGuide('0')">全部</a></td>
			<%
		}
		intUmp=840-50;
		if (intCurGuide==1)
		{
			%>
			<td style='background-color:#229293;' align='center' width=50 >
			<font color='#FFFFFF'>0-49元</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=50 ><a href="javascript:changeGuide('1')">0-49元</a></td>
			<%
		}
		intUmp=intUmp-50;
		if (intCurGuide==2)
		{
			%>
			<td style='background-color:#229293;' align='center' width=50 >
			<font color='#FFFFFF'>50-99元</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=50 ><a href="javascript:changeGuide('2')">50-99元</a></td>
			<%
		}
		intUmp=intUmp-50;
		if (intCurGuide==3)
		{
			%>
			<td style='background-color:#229293;' align='center' width=60 >
			<font color='#FFFFFF'>100-199元</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=60 ><a href="javascript:changeGuide('3')">100-199元</a></td>
			<%
		}
		intUmp=intUmp-60;
		if (intCurGuide==4)
		{
			%>
			<td style='background-color:#229293;' align='center' width=60 >
			<font color='#FFFFFF'>200-499元</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=60 ><a href="javascript:changeGuide('4')">200-499元</a></td>
			<%
		}
		intUmp=intUmp-60;
		if (intCurGuide==5)
		{
			%>
			<td style='background-color:#229293;' align='center' width=70 >
			<font color='#FFFFFF'>500-999元</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=70 ><a href="javascript:changeGuide('5')">500-999元</a></td>
			<%
		}
		intUmp=intUmp-70;
		if (intCurGuide==6)
		{
			%>
			<td style='background-color:#229293;' align='center' width=70 >
			<font color='#FFFFFF'>1000元以上</font></td>
			<%
		}else
		{
			%>
			<td align='center' width=70 ><a href="javascript:changeGuide('6')">1000元以上</a></td>
			<%
		}
		intUmp=intUmp-70;
		%>
			<td width=<%=intUmp%> ></td>
			</tr>
			</table>
		</td>
		</tr>
		<tr>
		<td align='right' style='width:75px;' ><font color='#209493'><b>品牌区：</b></font></td>
		<td align='left' valign='middle'>
			<table border=0 cellspacing="0" cellpadding="0" width=98% >
			<tr style='height:41px;'>
		<%
		if (intCurBrand==0)
		{
			out.println("<td style='background-color:#229293;' width=50 align='center' >");
			out.println("<font color='#FFFFFF'>全部</font></td>");
		}else
		{
			%>
			<td align='center' width=50 >
			<a href="javascript:changeBrand('0')">全部</a></td>
			<%
		}
		intUmp=840-50;
		%>
		<td align='center' width=10 ></td>
		<%
		intUmp=intUmp-10;
		if (lstBrand.size()>0)
		{
			for (intLmp=0;intLmp<lstBrand.size();intLmp++)
			{
				SpBrand sb=(SpBrand)lstBrand.get(intLmp);
				strLmp=basePath+"/graph/lmxx/"+sb.getBrandImg();
				if (intLmp>0)
				{
					out.println("<td style='width:15px;'>&nbsp;</td>");
					intUmp=intUmp-15;
				}
				if (sb.getBrandId().equals(intCurBrand))
				{
					%>
					<td style='width:78px;' ><img src='<%=strLmp%>' width=78 height=41 title='<%=sb.getBrandName()%>' />&nbsp;</td>
					<%
					intUmp=intUmp-78;
				}else
				{
					%>
					<td style='width:78px;'>
					<a href="javascript:changeBrand('<%=sb.getBrandId()%>')">
					<img src='<%=strLmp%>' width=78 height=41 title='<%=sb.getBrandName()%>' /></a>
					</td>
					<%
					intUmp=intUmp-78;
				}
				if (intLmp>=7) break;
			}
		}
		if (lstABrand.size()>0)
		{
			out.println("<td align='right' valign='bottom' style='width:40px;'><a href='javascript:toSkLevelPp()'>更多</a></td>");
			intUmp=intUmp-40;
		}
		%>
			<td width=<%=intUmp%> >&nbsp;</td>
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
<tr style='height:10px;'><td></td></tr>
<tr>
<td align='left'>
	<table border="0" cellspacing="0" cellpadding="0" style='width:910px;margin-left:10px;'>
	<tr style='height:19px;' >
	<td style='width:60px;' align='left' valign='middle' >您已选择：</td>
	<%
	if (!"".equals(strCurType))
	{
		intTmp=MyUtils.getStringLength(strCurType);
		if (intTmp<=2)
		{
			intLmp=40;
		}else
		{
			if (intTmp==3)
			{
				intLmp=50;
			}else
			{
				if (intTmp==4)
				{
					intLmp=60;
				}else
				{
					intLmp=70;
				}
			}
		}
		%>
		<td width=8 style='background:url(<%=basePath%>/images/igo_l.gif) no-repeat ;'>&nbsp;</td>
		<td style='background:url(<%=basePath%>/images/igo_m.gif) repeat-x ;' align='center' width=<%=intLmp%> >
		<%=strCurType%>&nbsp;&nbsp;<font color=red>X</font></td>
		<td width=8 style='background:url(<%=basePath%>/images/igo_r.gif) no-repeat ;'>&nbsp;</td>
		<%
	}
	if (!"".equals(strCurGuide))
	{
		strLmp="";
		if (!"".equals(strCurType)) out.print("<td width=20>&nbsp;</td>");
		intTmp=MyUtils.getStringLength(strCurGuide);
		if (intTmp<6)
		{
			strLmp="width=60";
		}else
		{
			if (intTmp>=6 && intTmp<=6)
			{
				strLmp="width=70";
			}else
			{
				if (strCurGuide.contains("1000"))
				{
					strLmp="width=100";
				}else
				{
					strLmp="width=80";
				}
			}
		}
		%>
		<td width=8 style='background:url(<%=basePath%>/images/igo_l.gif) no-repeat ;' >&nbsp;</td>
		<td style='background:url(<%=basePath%>/images/igo_m.gif) repeat-x ;' align='center' <%=strLmp%> >
		<%=strCurGuide%>&nbsp;&nbsp;<font color=red>X</font></td>
		<td width=8 style='background:url(<%=basePath%>/images/igo_r.gif) no-repeat ;'>&nbsp;</td>
		<%
	}
	if (!"".equals(strCurBrand))
	{
		strLmp="";
		if (!"".equals(strCurGuide)) out.print("<td width=20>&nbsp;</td>");
		intTmp=MyUtils.getStringLength(strCurBrand);
		if (intTmp<6)
		{
			strLmp="width=60";
		}else
		{
			if (intTmp>=6 && intTmp<=6)
			{
				strLmp="width=70";
			}else
			{
				strLmp="width=100";
			}
		}
		%>
		<td width=8 style='background:url(<%=basePath%>/images/igo_l.gif) no-repeat ;' >&nbsp;</td>
		<td style='background:url(<%=basePath%>/images/igo_m.gif) repeat-x ;' align='center' <%=strLmp%> >
		<%=strCurBrand%>&nbsp;&nbsp;<font color=red>X</font></td>
		<td width=8 style='background:url(<%=basePath%>/images/igo_r.gif) no-repeat ;'>&nbsp;</td>
		<%
	}
	%>
	<td>&nbsp;</td>
	<td align='right' valign='middle' width=100 >
	<font color='#E6002A'>共<%=intSize%>个商品</font></td>
	</tr>
	</table>
</td>
</tr>
<tr style='height:10px;'><td></td></tr>
<tr>
<td align='center'>
	<table border="0" cellspacing="0" cellpadding="0" width=920 >
	<%
	if (intSize>0)
	{
		for (intLmp=0;intLmp<lstMain.size();intLmp++)
		{
			LineIgo ig=(LineIgo)lstMain.get(intLmp);
			if (intLmp==0 || intLmp==3 || intLmp==6)
			{
				out.print("<tr>");
			}else
			{
				out.print("<td style='width:25px;'>&nbsp;</td>");
			}
			out.print("<td align='center' style='width:290px;'>");

			/*单个主体内容start*/
			out.print("<table border='0' cellspacing='0' height=114 cellpadding='0' width=100% >");
/*			
			out.print("<tr><td colspan=2>");
			out.print(ig.getIgoShLink());
			out.print("</td></tr>");
*/
			
			out.print("<tr>");
			out.print("<td align='center' width=150 height=104>");
//			out.print("<img src='"+basePath+"/graph/lmxx/"+ig.getSpImg()+"' width=104 height=104 />");
			out.print(ig.getIgoShLink());
			out.print("</td>");
			out.print("<td align='center' valign='top' style='width:140px;'>");
			
			out.print("	<table border='0' cellspacing='0' cellpadding='0' width=90% >");
			out.print("	<tr style='height:20px;' >");
			out.print("	<td align='left' style='font-size:11px;'>");
//			out.print("<a href=\"javascript:toOpenIgo('"+String.valueOf(ig.getIgoId())+"')\">");
			out.print("<font color='#258F81'><b>"+ig.getIgoName()+"</b></font>");
			out.print("	</td>");
			out.print("	</tr>");
			out.print("	<tr style='height:20px;' >");
			out.print("	<td align='left' >产地："+ig.getIgoOriginal()+"</td>");
			out.print("	</tr>");
			out.print("	<tr style='height:20px;' >");
			strLmp="";
			if (ig.getStrZbmc()!=null)
			{
				strLmp=ig.getStrZbmc();
			}
			strLmp=strLmp+":"+String.valueOf(ig.getIgoSection());
			if (ig.getStrZbdw()!=null)
			{
				strLmp=strLmp+" "+ig.getStrZbdw();
			}
			out.print("	<td align='left' >"+strLmp+"</td>");
			out.print("	</tr>");
			out.print("	<tr style='height:20px;' >");
			out.print("	<td align='left' >官方指导价：");
			out.print("	<font color='#FF0000' >￥ "+String.valueOf(ig.getIgoGuide())+"</font>");
			out.print("	</td>");
			out.print("	</tr>");
			out.print(" <tr style='height:24px;' ><td>&nbsp;</td></tr>");
			out.print(" </table>");

			out.print("</td>");
			out.print("</tr>");
			out.print("<tr style='height:10px;'><td colspan=2>&nbsp;</td></tr>");

			
			out.print("<tr style='height:28px;'>");
			out.print("<td colspan=2 align='left' style='background-color:#FFFABA;border:1px dotted;border-color:#C9C9C9;'>");
			out.print("	<table border='0' cellspacing='1' cellpadding='2' width=100% >");
			out.print("	<tr >");
			out.print("	<td align='left'>");
			if (ig.getIgoShmcA()!=null)
			{
				if (!"".equals(ig.getIgoShmcA()))
				{
					out.print(ig.getIgoShmcA()+"：");
				}
			}
			if (ig.getIgoShmcB()!=null)
			{
				if (!"".equals(ig.getIgoShmcB()))
				{
					out.print(ig.getIgoShmcB());
				}
			}
			out.print("	</td>");
			out.print("	<td align='right' valign='middle'>信用：");
			if (ig.getIgoXy()!=null)
			{
				strLmp="";
				for (intTmp=0;intTmp<ig.getIgoXy();intTmp++)
				{
					strLmp=strLmp+"<img src='"+basePath+"/images/igo_xy.gif' />&nbsp;";
				}
				out.print(strLmp);
			}
			out.print("	</td>");
			out.print("	</tr>");
			out.print(" </table>");
			
			out.print("</td>");
			out.print("</tr>");
			out.print("</table>");
			/*单个主体内容over*/

			out.print("</td>");
			if (intLmp==2 || intLmp==5 || intLmp==8)
			{
				out.print("</tr>");
			}
		}
		intTmp=3-lstMain.size()%3;
		if (intTmp!=0 && intTmp!=3)
		{
			for (intLmp=1;intLmp<=intTmp;intLmp++)
			{
				out.print("<td style='width:25px;'></td>");
				out.print("<td align='center' style='width:290px;'></td>");
			}
			out.print("</tr>");
		}
	}
	%>
	</table>
</td>
</tr>
<tr style='height:20px;' ><td>&nbsp;</td></tr>
<%
if(strPageOut!=null)
{
	if ("".equals(strPageOut))
	{
		%>
		<tr>
		<td align='center' valign='middle' style='font-size:12px;'><%=strPageOut%></td>
		</tr>
		<tr style='height:30px;' ><td>&nbsp;</td></tr>
		<%
	}
}
%>
</table>
<%
strLmp="";
String strTmp;
strTmp="";

if (lstABrand.size()>0)
{
	for (intLmp=0;intLmp<lstABrand.size();intLmp++)
	{
		SpBrand sra=(SpBrand)lstABrand.get(intLmp);
		if (lstABrand.size()<21)
		{
			if ((intLmp%5)==0)
			{
				strTmp=strTmp+"<tr style='height:20px;'>";
			}
		}else
		{
			if ((intLmp%8)==0)
			{
				strTmp=strTmp+"<tr style='height:20px;'>";
			}
		}
		strTmp=strTmp+"<td width=100><a href='javascript:changeBrand("+String.valueOf(sra.getBrandId())+")'>"+sra.getBrandName()+"</a></td>";
		if (intLmp>0)
		{
			if (lstABrand.size()<21)
			{
				if ((intLmp%4)==0)
				{
					strTmp=strTmp+"</tr>";
				}
			}else
			{
				if ((intLmp%7)==0)
				{
					strTmp=strTmp+"</tr>";
				}
			}
		}
	}
	if (lstABrand.size()<21)
	{
		intLmp=5-(lstABrand.size()%5);
		strLmp="<table border='0' cellspacing='0' cellpadding='0' width=400 align='center' >";
		strLmp=strLmp+"<tr style='height:10px;'><td colspan="+String.valueOf(intLmp)+"></td></tr>";
		strTmp=strLmp+strTmp;
	}else
	{
		intLmp=8-(lstABrand.size()%8);
		strLmp="<table border='0' cellspacing='0' cellpadding='0' width=600 align='center' >";
		strLmp=strLmp+"<tr style='height:10px;'><td colspan="+String.valueOf(intLmp)+"></td></tr>";
		strTmp=strLmp+strTmp;
	}
	strTmp=strTmp+"<tr style='height:10px;'><td colspan="+String.valueOf(intLmp)+"></td></tr>";
	strLmp=strTmp+"</table>";
}
%>
<script LANGUAGE='Javascript'>
function doCloseGd()
{
	var objA;
	var objB;

	objA=document.getElementById('idABack');
	objB=document.getElementById('idBBack');
	objA.style.display='none';
	objB.style.display='none';
}
function toSkLevelPp()
{
	var objA;
	var objB;
	var i=0;

	objA=document.getElementById('idABack');
	objB=document.getElementById('idBBack');
	objA.style.display='block';
	objB.style.display='block';
	<%
	intLmp=lstABrand.size()/5;
	intTmp=lstABrand.size()%5;
	if (intTmp>0)
	{
		intLmp=intLmp+1;
	}
	intTmp=intLmp*25+30;
	%>
	i=<%=intTmp%>;
	objB.style.height=i;
}

</script>
<div  width=400 height=400 id='idABack' ></div>
<div  width=400 height=400 id='idBBack' >
<table border=0 width=100% height=100%>
<tr style='height:15px;'>
<td align='right'><img src='<%=basePath%>/images/icons/error.gif' width=15 height=15 onclick='doCloseGd()'/></td></tr>
<tr><td bgcolor=#FFFFFF>
<%
out.println(strLmp);
%>
</td></tr>
</table>
</div>







</body>
</html>
<s:include value='footer.jsp'></s:include>

