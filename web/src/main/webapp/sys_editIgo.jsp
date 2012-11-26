<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LineIgo"%>
<%@ page import="com.lhq.prj.bms.po.SpBrand"%>
<%@ page import="com.lhq.prj.bms.po.SpType"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.List"%>

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
if (strUserAcl.indexOf("IG509")==-1 && strUserAcl.indexOf("999")==-1)
{
%>
	<jsp:forward page="error.jsp" />
<%
} 
 
LineIgo ig=(LineIgo)request.getAttribute("waitEdit_doc");
Integer intLmp;
Integer intTmp;
String strLmp="";
String strNav="";

//导航信息
strNav="<a href='"+basePath+"/manager.jsp'><font color='#2F9681'>首页</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaA.action'><font color='#2F9681'>系统管理</font></a>";
strNav=strNav+" > <a href='"+basePath+"/sysmanaG.action'><font color='#2F9681'>IGO管理</font></a>";
strNav=strNav+" > IGO编辑";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/normalAjax.js"></script>
<script LANGUAGE='Javascript'>
<!--
function doSubmit()
{
	var doc=document.form1;
	var t1='';
	var t2='';

	t1=getValueBySelected(doc.igoTypeId,1);
	t2=getValueBySelected(doc.brandId,1);
	if (doc.igoName.value=='')
	{
		alert('对不起，请输入商品名称！');
		return ;
	}
	if (doc.igoTypeId.value=='' || doc.igoTypeName.value=='')
	{
		alert('对不起，请选择商品类型！');
		return ;
	}
	if (doc.brandId.value=='' || doc.brandName.value=='')
	{
		alert('对不起，请选择商品品牌！');
		return ;
	}
	if (doc.igoSection.value=='' || doc.igoGuide.value=='')
	{
		alert('对不起，请输入段数或指导价！');
		return ;
	}
	if (doc.igoOriginal.value=='')
	{
		alert('对不起，请输入产地！');
		return ;
	}
	t1=doc.fiSpImg.value;
	if (t1!='')
	{
		t2=t1.substring(t1.length-3,t1.length);
		if (t2.toUpperCase()!='JPG' && t2.toUpperCase()!='GIF')
		{
			alert('不支持该文件后缀类型！');
			return ;
		}
	}

	if (confirm('确实提交吗？'))
	{
		doc.spImg.value=t1;
		doc.submit();
	}
}
function doChgLb()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.igoTypeId,'1');
	frm.igoTypeName.value=t1;
	t1=getValueBySelected(frm.igoTypeId,'2');
	t1='<%=basePath%>/findBrandByType.action?spTypeId='+t1;
	getByAjax(t1,'after_chgLb');
}
function after_chgLb()
{
	var doc=document.form1;
	var resp=xml_Http.responseText;
	var objM=null;
	var objN=null;
	var objP=null;
	var i=0;

	eval('objM=('+resp+')');
	objN=objM.typeBrandList;
	objP=doc.brandId;
	objP.length=1;
	objP.options[0].value='';
	objP.options[0].text='';
	for (i=0; i<objN.length; i++)
	{
		objP.length=objP.length+1;
		objP.options[objP.length-1].value=objN[i].brandId;
		objP.options[objP.length-1].text=objN[i].brandName;
	}
}
function doChgBrand()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.brandId,'1');
	frm.brandName.value=t1;
}
function checkJg()
{
	var frm=document.form1;
	if (!checkIsNumber(frm.igoGuide))
	{
		frm.igoGuide.value='';
//		alert('请输入数值型数据！');
		return false;
	}
	return true;
}
function checkXy()
{
	var frm=document.form1;
	if (!checkIsNumber(frm.igoXy))
	{
		frm.igoXy.value='';
//		alert('请输入数值型数据！');
		return false;
	}
	return true;
}
function ckZbmc(){
	var frm=document.form1;
	var objZa=document.getElementById('idzbmc');
	objZa.innerHTML=frm.strZbmc.value;
}
function ckZbdw(){
	var frm=document.form1;
	var objZa=document.getElementById('idzbdw');
	objZa.innerHTML=frm.strZbdw.value;
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
	<td style='background:url(images/top_bottom.gif) no-repeat;' >
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
	<td width=240>
		<font color='#A9714E' size='5'>IGO管理</font>
	</td>
    <td valign="bottom">&nbsp;<img src='<%=basePath%>/images/top_bottom.gif' width=693 /></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td>
	<table cellspacing='0' cellpadding="0" border='0' style='width:100%; font-size: 12px;'>
	<tr>
	<td width=20% valign="top">
	<jsp:include page="sys_left.jsp" />
	</td>
    <td width=45 style='background:url(<%=basePath%>/images/icon_dash.gif) repeat-y;' ></td>
    <td valign='top' align='left'>
    <s:form method="post" action="updateIgo" name="form1" theme="simple" enctype="multipart/form-data">
		<input type='hidden' name='igoId' value='<%=ig.getIgoId()%>' />
		<input type='hidden' name='brandName' value='<%=ig.getBrandName()%>' />
		<input type='hidden' name='igoTypeName' value='<%=ig.getIgoTypeName()%>' />
		<input type='hidden' name='spImg' value='' />
    
		<table cellspacing='0' cellpadding="0" border='0' style='width:94%; height:100%; font-size: 12px;'>
		<%
		if (ig.getSpImg()!=null)
		{
			if (!"".equals(ig.getSpImg()))
			{
		%>
		<tr>
			<td colspan=4 align='center'><img src='<%=basePath%>/graph/lmxx/<%=ig.getSpImg()%>' /></td>
		</tr>
	   		<tr><td style='height:5px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td colspan=4 align='left'><a href='<%=basePath%>/deleteIgoImg.action?igoId=<%=ig.getIgoId()%>'><font color=#2F9681>删除原图片</font></a></td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
	   	<%
			}
		}
	   	%>
		<tr>
		<td align='right' width=100>商品名称：<font color=red>*</font></td>
		<td align='left' colspan=3>
		<INPUT class=form value="<%=ig.getIgoName()%>" 
			style="WIDTH: 400px" type="text" maxLength=50
				name="igoName" minlength="2" />
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>类型：<font color=red>*</font></td>
		<td align='left' width=200>
			<select name='igoTypeId' onchange='doChgLb()'>
			<%
			List lsLx=(List)request.getAttribute("waitList_lx");
			if (lsLx.size()>0)
			{
				for (intLmp=0;intLmp<lsLx.size();intLmp++)
				{
					SpType st=(SpType)lsLx.get(intLmp);
					if (st.getSpTypeId().equals(ig.getIgoTypeId()))
					{
						out.print("<option value='"+String.valueOf(st.getSpTypeId())+"' selected>"+st.getSpTypeName()+"</option>");
					}else
					{
						out.print("<option value='"+String.valueOf(st.getSpTypeId())+"' >"+st.getSpTypeName()+"</option>");
					}
				}
			}
			%>
			</select>
		</td>
		<td align='right' width=100>品牌：<font color=red>*</font></td>
		<td align='left'>
		    <select name='brandId' onchange='doChgBrand()'>
			<%
			List lspp=(List)request.getAttribute("waitList_pp");
			if (lspp.size()>0)
			{
				for (intLmp=0;intLmp<lspp.size();intLmp++)
				{
					SpBrand sb=(SpBrand)lspp.get(intLmp);
					if (sb.getBrandId().equals(ig.getBrandId()))
					{
						out.print("<option value='"+String.valueOf(sb.getBrandId())+"' selected>"+sb.getBrandName()+"</option>");
					}else
					{
						out.print("<option value='"+String.valueOf(sb.getBrandId())+"' >"+sb.getBrandName()+"</option>");
					}
				}
			}
			%>
		    </select>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>指标名称：</td>
		<td align='left' colspan=3>
		<INPUT class=form value=""
			style="WIDTH: 100px" type="text" 
				name="strZbmc" onchange='ckZbmc()' /> 
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>指标单位：</td>
		<td align='left' colspan=3>
		<INPUT class=form value=""
			style="WIDTH: 100px" type="text" 
				name="strZbdw" onchange='ckZbdw()' /> 
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'><span id='idzbmc'><%=ig.getStrZbmc()==null?"":ig.getStrZbmc()%></span><font color=red>*</font></td>
		<td align='left' width=200>
		<INPUT class=form value='<%=ig.getIgoSection()%>'  
			size=5 type="text" name="igoSection" /> <span id='idzbdw'><%=ig.getStrZbdw()==null?"":ig.getStrZbdw()%></span>
		</td>
		<td align='right' width=100>官方指导价：<font color=red>*</font></td>
		<td align='left'>
		<INPUT class=form value="<%=ig.getIgoGuide()%>" onchange="checkJg()" 
			style="WIDTH: 60px" type="text" maxLength=10 
				name="igoGuide" minlength="6" /> 元
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>产地：<font color=red>*</font></td>
		<td align='left' colspan=3>
		<INPUT class=form value="<%=ig.getIgoOriginal()%>" 
			style="WIDTH: 400px" type="text" maxLength=50
				name="igoOriginal" minlength="6" />
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户所在网址：</td>
		<td align='left' colspan=3>
		<INPUT class=form value="<%=ig.getIgoShmcA()%>" 
			style="WIDTH: 400px" type="text" maxLength=40
				name="igoShmcA" minlength="6" />
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户名称：</td>
		<td align='left' colspan=3>
		<INPUT class=form value="<%=ig.getIgoShmcB()%>" 
			style="WIDTH: 400px" type="text" maxLength=40
				name="igoShmcB" minlength="6" />
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户链接：</td>
		<td align='left' colspan=3>
		<textarea name='igoShLink' rows=5 cols=70><%=ig.getIgoShLink()%></textarea>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>商户信用：</td>
		<td align='left' colspan=3>
		<INPUT class=form value="<%=ig.getIgoXy()==null?"":ig.getIgoXy()%>"
			style="WIDTH: 20px" type="text" maxLength=40
				name="igoXy" minlength="6" onchange='checkXy()'/> 钻
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<tr>
		<td align='right'>重新上传照片：</td>
		<td align='left' colspan=3 style='line-height:30px;'>
		<INPUT type=file name='fiSpImg' />
		</td>
		</tr>
		<tr>
		<td></td>
		<td colspan=3>
		<font color=red>(备注：如果不上传，将采用上次上传的照片。)</font>
		</td>
		</tr>
			<tr><td style='height:5px;' colspan=4 class='td_dash'>&nbsp;</td></tr>
	   		<tr><td style='height:10px;' colspan=4>&nbsp;</td></tr>
		<TR><TD colspan=4 align="center">
		<a href='javascript:doSubmit()'><img src="<%=basePath%>/images/btnWytj.gif" /></a>
		</TD></TR>
		</table>
    </s:form>
	</td></tr>
	<tr>
	<td colspan=3 style='height:20px;'></td>
	</tr>
	</table>
</td>
</tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
