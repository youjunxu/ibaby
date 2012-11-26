<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.SpType"%>
<%@ page import="com.lhq.prj.bms.po.SpBrand"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");

List lstType=(List)request.getAttribute("reqListSplx");
List lstBrand=(List)request.getAttribute("reqListSppp");
Integer intLmp;
Integer intTmp;
if (flagUser==0)
{
%>
	<jsp:forward page="<%=basePath%>/login.jsp" />
<%
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我要说说</title>
<link href="css/style.css" rel="stylesheet" type="<%=basePath%>/text/css" />
<script type="text/javascript" src="<%=basePath%>/js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
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
<script language="javascript">
<!--
var PIC_EXT='jpg|gif';
function checkGraph()
{
	var doc=document.forms[0];
	var filename=doc.strZzImg.value;

	if (filename!='')
	{
		if (!(filename.length>5 && filename.indexOf(':')==1 && (filename.length-filename.lastIndexOf('.'))==4 && checkExt(filename.substr(filename.length-3,3))))
		{
			alert('对不起，您选择的图片不含符合要求！');
			doc.strZzImg.focus();
			document.execCommand('selectall');
			document.execCommand('Delete');
		}
	}
}
function checkExt(ext)
{
	var ext_ok;
	var arrayExt;
	arrayExt=PIC_EXT.split('|');

	ext_ok=false;
	for (var i=0; i<arrayExt.length; i++)
	{
		if(ext.toLowerCase()==arrayExt[i])
		{
			ext_ok=true;
			break;
		}
	}
	return ext_ok;
}
function doSubmit()
{
	var frm=document.form1;
	var t1='';
	
	if(frm.spTitle.value=='')
	{
		alert('请输入主题！');
		return false;
	}
	if (!checkIsNumber(frm.spPirce))
	{
		alert('价格必须为数值型！');
		return false;
	}
	if(frm.lbName.value=='')
	{
		alert('请选择类别！');
		return false;
	}
	t1=getValueBySelected(frm.lbCode,1);
	if(t1=='')
	{
		alert('请选择类别！');
		return false;
	}
	if(frm.brandName.value=='')
	{
		alert('请选择型号！');
		return false;
	}
	t1=getValueBySelected(frm.brandCode,1);
	if(t1=='')
	{
		alert('请选择型号！');
		return false;
	}
	frm.strZzImg.value=frm.fiStrZzImg.value;
	frm.submit();
}
function doChgLb()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.lbCode,'1');
	frm.lbName.value=t1;
	t1=getValueBySelected(frm.lbCode,'2');
	t1='<%=basePath%>/findBrandByType.action?spTypeId='+t1;

	getByAjax(t1,'after_chgLb');
}
function after_chgLb()
{
	var doc=document.forms[0];
	var resp=xml_Http.responseText;
	var objM=null;
	var objN=null;
	var objP=null;
	var i=0;

	eval('objM=('+resp+')');
	objN=objM.typeBrandList;
	objP=doc.brandCode;
	objP.length=1;
	objP.options[0].value='';
	objP.options[0].text='';
	for (i=0; i<objN.length; i++)
	{
		objP.length=objP.length+1;
		objP.options[objP.length-1].value=objN[i].brandCode;
		objP.options[objP.length-1].text=objN[i].brandName;
	}
}
function doChgBrand()
{
	var frm=document.form1;
	var t1;
	
	t1=getValueBySelected(frm.brandCode,'1');
	frm.brandName.value=t1;
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
function doClickXq(strXh)
{
	var doc=document.forms[0];
	doc.strXq.value='xinqin'+strXh+'.gif';
}
//-->
</script>
</head>

<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SP</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr style='height:30px;'>
	<td style='background:url(images/top_bottom.gif) no-repeat;'/>
	    <table width=100% style='margin-top:10px;'>
    	<tr>
        <td width=2%></td>
    	<td align="left">
    		您现在所在的位置: <a href='<%=basePath%>'>首页</a> > <a href='<%=basePath%>/firstSP.action'>商品知知</a> > 我要说说
		</td>
    	</tr>
    	</table>
    </td>
</tr>
<tr>
<td style='height:80px;' valign="middle" align='center'>
	<table cellspacing='0' cellpadding="0" border='0' width=100% >
	<tr>
	<td align='center' width=30% style='font-size:22px;'>
		<font color='#1F9393' ><b>我要说说</b></font>
	</td>
    <td>&nbsp;</td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td align=center>
  	<s:form method="post" action="saveSpzz" name="form1" theme="simple" onsubmit="return doSubmit()" enctype="multipart/form-data">
  	<input type='hidden' name='userId' value='<%=objUser.getUserId()%>'/>
  	<input type='hidden' name='strAuthor' value='<%=objUser.getUserName()%>'/>
  	<input type='hidden' name='lbName' value=''/>
  	<input type='hidden' name='brandName' value=''/>
	<input type='hidden' name='fsMyd' value='0'>
	<input type='hidden' name='fsKg' value='0'>
	<input type='hidden' name='fsSyx' value='0'>
	<input type='hidden' name='fsXjb' value='0'>
	<input type='hidden' name='strZzImg' value='' >
	<table cellspacing='0' cellpadding="0" border='0' width=780 align="center" style='font-size:14px;'>
	<tr>
	<td align='right' width=80 >产&nbsp;&nbsp;&nbsp;&nbsp;品：</td>
    <td colspan=3 align='left'>&nbsp;&nbsp;
    <INPUT class=form value="<s:property value='spTitle' />"
			style="WIDTH: 400px" type="text" maxLength=32
				name="spTitle" minlength="6">
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right' width=80 >价&nbsp;&nbsp;&nbsp;&nbsp;格：</td>
    <td colspan=3 align='left'>&nbsp;&nbsp;
    <INPUT class=form value="<s:property value='spPrice' />"
			style="WIDTH: 400px" type="text" maxLength=32
				name="spPrice" minlength="6">
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>类&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    <td width=300 align='left'>&nbsp;&nbsp;
    <s:select name='lbCode' list='#request.reqListSplx' listKey='spTypeId' listValue='spTypeName' headerKey='' headerValue=' ' onchange='doChgLb()' ></s:select>
    </td>
	<td align='right' width=80 >型&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
    <td align='left'>&nbsp;
    <select name='brandCode' onchange='doChgBrand()'></select>
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>满意度：</td>
    <td align='left'>&nbsp;&nbsp;
    <img id='idStart11' src='images/star1.gif' onclick='doTurnStar(1,1)'/>
    <img id='idStart12' src='images/star1.gif' onclick='doTurnStar(1,2)'/>
    <img id='idStart13' src='images/star1.gif' onclick='doTurnStar(1,3)'/>
    <img id='idStart14' src='images/star1.gif' onclick='doTurnStar(1,4)'/>
    <img id='idStart15' src='images/star1.gif' onclick='doTurnStar(1,5)'/>
    &nbsp;&nbsp;&nbsp;&nbsp;
	<font color='#EB6E1E'><b><span id='idFsMyd' ></span>&nbsp;分</b></font>
    </td>
	<td align='right' >质感/口感：</td>
    <td align='left'>&nbsp;
    <img id='idStart21' src='images/star1.gif' onclick='doTurnStar(2,1)'/>
    <img id='idStart22' src='images/star1.gif' onclick='doTurnStar(2,2)'/>
    <img id='idStart23' src='images/star1.gif' onclick='doTurnStar(2,3)'/>
    <img id='idStart24' src='images/star1.gif' onclick='doTurnStar(2,4)'/>
    <img id='idStart25' src='images/star1.gif' onclick='doTurnStar(2,5)'/>
    &nbsp;&nbsp;&nbsp;&nbsp;
	<font color='#EB6E1E'><b><span id='idFsKg' ></span>&nbsp;分</b></font>
    </td>
    </tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>实用性：</td>
    <td align='left'>&nbsp;&nbsp;
    <img id='idStart31' src='images/star1.gif' onclick='doTurnStar(3,1)'/>
    <img id='idStart32' src='images/star1.gif' onclick='doTurnStar(3,2)'/>
    <img id='idStart33' src='images/star1.gif' onclick='doTurnStar(3,3)'/>
    <img id='idStart34' src='images/star1.gif' onclick='doTurnStar(3,4)'/>
    <img id='idStart35' src='images/star1.gif' onclick='doTurnStar(3,5)'/>
    &nbsp;&nbsp;&nbsp;&nbsp;
	<font color='#EB6E1E'><b><span id='idFsSyx' ></span>&nbsp;分</b></font>
    </td>
	<td align='right' >性价比：</td>
    <td align='left'>&nbsp;
    <img id='idStart41' src='images/star1.gif' onclick='doTurnStar(4,1)'/>
    <img id='idStart42' src='images/star1.gif' onclick='doTurnStar(4,2)'/>
    <img id='idStart43' src='images/star1.gif' onclick='doTurnStar(4,3)'/>
    <img id='idStart44' src='images/star1.gif' onclick='doTurnStar(4,4)'/>
    <img id='idStart45' src='images/star1.gif' onclick='doTurnStar(4,5)'/>
    &nbsp;&nbsp;&nbsp;&nbsp;
	<font color='#EB6E1E'><b><span id='idFsXjb' ></span>&nbsp;分</b></font>
    </td>
    </tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right' valign='top'>说明：</td>
	<td colspan=3 align='left'>&nbsp;&nbsp;
	<textarea name='strContent' cols=80 rows="15" style='overflow-y:auto;overflow-x:auto;'></textarea></td>
    </tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<tr>
	<td align='right'>心情：</td>
    <td align='left' >&nbsp;&nbsp;
	<input type=hidden name='strXq' value=''>
	<img src='images/xinqin1.gif' onclick='doClickXq(1)' />&nbsp;&nbsp;
	<img src='images/xinqin2.gif' onclick='doClickXq(2)' />&nbsp;&nbsp;
	<img src='images/xinqin3.gif' onclick='doClickXq(3)' />&nbsp;&nbsp;
	<img src='images/xinqin4.gif' onclick='doClickXq(4)' />&nbsp;&nbsp;
	<img src='images/xinqin5.gif' onclick='doClickXq(5)' />&nbsp;&nbsp;
	<img src='images/xinqin6.gif' onclick='doClickXq(6)' />
    </td>
	<td align='right'>推荐与否：</td>
    <td align='left' colspan=3>&nbsp;&nbsp;
	<input type=radio name='flagTj' value='1'>是
	<input type=radio name='flagTj' value='0'>否
    </td>
	</tr>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=8 colspan=4></TD></TR>
	<TR>
	<TD align="right">商品照片：</TD>
	<TD colspan=3 align="left" style='line-height:30px;'>&nbsp;&nbsp;
	<input type=file name='fiStrZzImg' size=60>
	<br>&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>文件后缀：JPG/GIF，大小不得超过2MB。</font>
	</TD></TR>
	<TR><TD height=8 colspan=4 class=td_dash></TD></TR>
	<TR><TD height=20 colspan=4></TD></TR>
	<TR><TD colspan=4 align="center"><input name="" type="image" src="images/btnWytj.gif" /></TD></TR>
	</table>
	</s:form>
</td>
</tr>
<tr style='height:5px;'><td>&nbsp;</td></tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
