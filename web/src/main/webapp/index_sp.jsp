<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.core.MyUtils"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmSpzz"%>
<%@ page import="com.lhq.prj.bms.po.SpType"%>
<%@ page import="com.lhq.prj.bms.po.SpBrand"%>
<%@ page import="com.lhq.prj.bms.po.Spgg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
String strUserAcl=(String)request.getSession().getAttribute("userAcl");
Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
Integer intLmp;
Integer intTmp;
List lstLmp;
String strLmp;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品知知</title>
<link href="<%=basePath%>/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
<script LANGUAGE='Javascript'>
function doSay()
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
function doSeekBrandxx(strBrandId)
{
}
function doMorePp(strPpId)
{
}
function doSeekTjpp(strPpId)
{
}
function doOpenSpGgDoc(strDocId)
{
	location.href='<%=basePath%>/sysGgOpen.action?ggId='+strDocId;
}
function doOpenSpzzDoc(strZzId)
{
	location.href='<%=basePath%>/prevOpenZZDoc.action?zzId='+strZzId;
}
</script>
</head>
<body>
	<s:action name="gvCurUserTopMenu" executeResult="true" >
		<s:param name="strCurMkCode">SP</s:param>
	</s:action>
<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
<tr>
  <td align=left valign=top style='height:178px;'>
	<table border="0" cellpadding="0" cellspacing="0" style='height:177px;width:936px;margin-left:8px;margin-top:6px; background:url(images/sp_bk1.gif) no-repeat;'>
	  <tr style='height:23px; font-size: 16px;'>
	  <td width="85" align=left style='valign:bottom;'><font face='黑体'>&nbsp;品牌导航</font></td>
	  <td width="843" align=right valign="middle">
    <input name="" type="image" src="images/sp_say.gif" onclick='doSay()' style='margin-top:-5px;'/>
	&nbsp;</td>
	  </tr>
  	  <tr>
	  <td colspan=2 style='height:145px;' align="center">
		<table border="0" cellspacing="0" cellpadding="0" style='width:930px;'>
		<s:iterator value="#request.reqListType" id="id_splx" >
		  <tr style='height:25px;'>
		  <td align='right' width='55px' style=" font-weight:bold;"><font color='CC9A39'>${id_splx.spTypeName}:</font></td>
		  <td align='left'>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <s:iterator value="#id_splx.brandList" id="id_spbrand" status="it_st">
			<s:if test="#it_st.isFirst()">&nbsp;&nbsp;</s:if><s:else>|&nbsp;&nbsp;</s:else>
		  <font color="#31A6AD"><a href="javascript:doSeekBrandxx('${id_spbrand.brandId}')">${id_spbrand.brandName}</a></font>
		  &nbsp;&nbsp;
		  </s:iterator>
		  &nbsp;&nbsp;&nbsp;&nbsp;<font color="#CACCC9">
		  <a href="javascript:doMorePp('${id_splx.spTypeId}')">更多</font>>>
		  </a>
		  </td>
	  	  </tr>
		</s:iterator>
		</table>
  	  </td>
  	  </tr>
	</table>
</td></tr>
<tr><td style='height:163px;' align="center">
	<table border="0" cellspacing="0" cellpadding="0" style='width:930px;' height=100% >
    <tr>
    <td width=71% >
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
	    <tr><td colspan=8 style='height:54px;' valign="middle" align="left">&nbsp;<img src='images/sp_tjpp.gif'/></td></tr>
	    <tr style='height:54px;'>
	    <s:iterator value="#request.reqListTjpp" id="id_tjpp" status="it_tjpp">
        <td valign="middle" align="center" width=89>
	    <input name="" type="image" src='${id_tjpp.brandImg}' onclick="doSeekTjpp('${id_tjpp.brandId}')" style='margin-top:-5px;'/>
		</td>
		<s:if test="it_tjpp.index==7">
		<td></td><tr><tr style='height:54px;'>
		</s:if>
	    </s:iterator>
	    <!--  
	    //-->
		<%
			lstLmp=(List)request.getAttribute("reqListType");
			intLmp=lstLmp.size();
			if (intLmp<7)
			{
				intLmp=7-intLmp;
				%><td colspan=<%=intLmp%>>&nbsp;</td><td></td></tr><tr style='height:54px;'><td colspan=7>&nbsp;</td><%
			}else
			{
				if (intLmp>7 && intLmp<14)
				{
					intLmp=14-intLmp;
					%><td colspan=<%=intLmp%>>&nbsp;</td><%
				}
			}
		%>
        <td></td>
        </tr>
	    </table>
    </td>
    <td>
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
	    <tr>
        <td style='height:54px; font-size: 16px;' valign="middle" align="left" width=75% >&nbsp;<font color='#129285'><b>&nbsp;公告</b></font></td>
        <td align="left" valign="middle"><input name="" type="image" src="images/index_icon_28.gif" onclick='doMoreGg()'/></td>
        </tr>
        <s:iterator value="#request.reqListSpgg" id="id_spgg" >
	    <tr style='height:25px;'>
		<td colspan=2 align="left" class='index_memo1_left'>
		<a href="javascript:doOpenSpGgDoc('${id_spgg.ggId}')">${id_spgg.strTitle}</a></td>
        </tr>
        </s:iterator>
		<%
			lstLmp=(List)request.getAttribute("reqListSpgg");
			intLmp=lstLmp.size();
			if (intLmp<3)
			{
				intLmp=(3-intLmp)*25;
				%>
			    <tr style='height:<%=intLmp%>px;'><td colspan=2>&nbsp;</td></tr>
				<%
			}
		%>
	    <tr><td>&nbsp;</td></tr>
	    </table>
    </td>
    </tr>
	</table>
</td></tr>
    <tr>
    <td style='height:235px;'>
		<table border="0" cellspacing="0" cellpadding="0" width=100% height=100% >
	    <tr style='height:1px;'><td></td></tr>
	    <tr>
        <td colspan=5 style='height:41px; font-size:20px;border-bottom:1px solid #31A6AD;' valign="middle" align="left" >
        &nbsp;<font color='#31A6AD'><b>&nbsp;拾识看看</b></font></td>
        </tr>
        <tr style='height:3px;'><td colspan=3>&nbsp;</td></tr>
        <tr>
        <td style='border-right:1px dashed;' width=33% align="center" valign="middle">
        <!--第1列//-->
		<%
			lstLmp=(List)request.getAttribute("reqListSpzz");
			LmSpzz sz=null;
			intLmp=0;
			if (lstLmp!=null)
			{
				if (!lstLmp.isEmpty())
				{
					intLmp=lstLmp.size();
				}
			}
			if (intLmp>0)
			{
				sz=(LmSpzz)lstLmp.get(0);
		%>
			<table border="0" cellspacing="0" cellpadding="0" width=90% style='height:190px;' >
            <tr>
            <td style='border-bottom:1px dotted;height:50%;' align="center" valign="middle" >
				<table border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
    	        <tr>
        	    <td style='border-bottom:1px dotted;height:90px;width:100px;' align="left" valign="middle" >
            	<img src='<%=sz.getStrZzImg()%>'/>
            	</td>
            	<td style='border-bottom:1px dotted;' valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width=100% >
                		<tr style='height:28px;'>
                    		<td colspan=3 align="left"><b><%=sz.getSpTitle()%></b></td>
	                     </tr>
    	            	<tr style='height:26px;'>
        	        	<td width=27% align="left">满意度:</td>
            	    	<td align="left" valign="middle" style="width:80px;">
            	    	<%
            	    	out.print(MyUtils.dispStartByFs(sz.getFsMyd()));
            	    	%>
						</td>
                	    <td align="left" valign="middle">
	    	            <font color="#EA6C15" size="+0"><%=sz.getFsMyd()%></font>
    		            <font color="#EA6C15">分</font>
                	    </td>
                		</tr>
                		<tr style='height:26px;'>
                		<td align="left">口&nbsp;&nbsp;&nbsp;&nbsp;感:</td>
                		<td align="left" valign="middle">
            	    	<%
            	    	out.print(MyUtils.dispStartByFs(sz.getFsKg()));
            	    	%>
                		</td>
                	    <td align="left" valign="middle">
	    	            <font color="#EA6C15" size="+0"><%=sz.getFsKg()%></font>
    		            <font color="#EA6C15">分</font>
                	    </td>
                		</tr>
  	          		</table>
                    </td>
                   	</tr>
                 </table>
            </td>
            </tr>
            <tr>
            <td align="center" valign="middle" style='height:95px;'>
				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
    	        <tr>
                <td valign="middle" align="center" style='height:50px;'>
      				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
					<tr>
        		    <td style='width:45px;' align="center" valign="middle" >
            		<img src='<%=sz.getStrZzImg()%>'/>
        	    	</td>
                    <td align="left" valign="middle">
                    <%
                    strLmp=sz.getStrContent();
                    if (MyUtils.getStringLength(strLmp.trim())>64)
                    {
                    strLmp=strLmp.trim().substring(1,64)+"...";
                    }
                    out.print(strLmp);
                    %>
                    &nbsp;&nbsp;<a href="javascript:(<%=sz.getZzId()%>)">详细>></a>
                    </td>
    	            </tr>
	                </table>
                </td>
               	</tr>
    	        <tr>
				<td >
                </td>
               	</tr>
                </table>
            </td>
            </tr>
	        </table>
			<%
			}
			%>
        <!--第1列over//-->
        </td>
        <td style='border-right:1px dashed;' width=33% align="center">
        <!--第2列//-->
			<table border="0" cellspacing="0" cellpadding="0" width=90% style='height:190px;' >
            <tr>
            <td style='border-bottom:1px dotted;height:50%;' align="center" valign="middle" >
				<table border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
    	        <tr>
        	    <td style='border-bottom:1px dotted;height:90px;width:100px;' align="left" valign="middle" >
            	<img src='images/zz_1.gif'/>
            	</td>
            	<td style='border-bottom:1px dotted;' valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width=100% >
                		<tr style='height:28px;'>
                    		<td colspan=3 align="left"><b>帮宝适超薄干爽型纸尿裤</b></td>
	                     </tr>
    	            	<tr style='height:26px;'>
        	        	<td width=27% align="left">满意度:</td>
            	    	<td align="left" valign="middle" style="width:80px;"><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/></td>
                	    <td align="left" valign="middle">10分</td>
                		</tr>
                		<tr style='height:26px;'>
                		<td align="left">口&nbsp;&nbsp;&nbsp;&nbsp;感:</td>
                		<td align="left" valign="middle"><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star3.gif'/></td>
                    	<td align="left">9分</td>
                		</tr>
  	          		</table>
                    </td>
                   	</tr>
                 </table>
            </td>
            </tr>
            <tr>
            <td align="center" valign="middle" style='height:95px;'>
				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
    	        <tr>
                <td valign="middle" align="center" style='height:50px;'>
      				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
					<tr>
        		    <td style='width:45px;' align="center" valign="middle" >
            		<img src='images/zz_2.gif'/>
        	    	</td>
                    <td align="left" valign="middle">
                    1月见宝宝：我家宝宝今年开始喝雅士利，吸收很好，宝宝很喜欢喝。奶。。。&nbsp;&nbsp;<a href='#'>详细>></a>
                    </td>
    	            </tr>
	                </table>
                </td>
               	</tr>
    	        <tr>
				<td >
                </td>
               	</tr>
                </table>
            </td>
            </tr>
	        </table>
        <!--第2列over//-->
        </td>
        <td align="center">
        <!--第3列//-->
			<table border="0" cellspacing="0" cellpadding="0" width=90% style='height:190px;' >
            <tr>
            <td style='border-bottom:1px dotted;height:50%;' align="center" valign="middle" >
				<table border="0" cellspacing="0" cellpadding="0" width=100% height="100%">
    	        <tr>
        	    <td style='border-bottom:1px dotted;height:90px;width:100px;' align="left" valign="middle" >
            	<img src='images/zz_1.gif'/>
            	</td>
            	<td style='border-bottom:1px dotted;' valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width=100% >
                		<tr style='height:28px;'>
                    		<td colspan=3 align="left"><b>帮宝适超薄干爽型纸尿裤</b></td>
	                     </tr>
    	            	<tr style='height:26px;'>
        	        	<td width=27% align="left">满意度:</td>
            	    	<td align="left" valign="middle" style="width:80px;"><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/></td>
                	    <td align="left" valign="middle">10分</td>
                		</tr>
                		<tr style='height:26px;'>
                		<td align="left">口&nbsp;&nbsp;&nbsp;&nbsp;感:</td>
                		<td align="left" valign="middle"><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star2.gif'/><img src='images/star3.gif'/></td>
                    	<td align="left">9分</td>
                		</tr>
  	          		</table>
                    </td>
                   	</tr>
                 </table>
            </td>
            </tr>
            <tr>
            <td align="center" valign="middle" style='height:95px;'>
				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
    	        <tr>
                <td valign="middle" align="center" style='height:50px;'>
      				<table border="0" cellspacing="0" cellpadding="0" width=100% height=100%>
					<tr>
        		    <td style='width:45px;' align="center" valign="middle" >
            		<img src='images/zz_2.gif'/>
        	    	</td>
                    <td align="left" valign="middle">
                    1月见宝宝：我家宝宝今年开始喝雅士利，吸收很好，宝宝很喜欢喝。奶。。。&nbsp;&nbsp;<a href='#'>详细>></a>
                    </td>
    	            </tr>
	                </table>
                </td>
               	</tr>
    	        <tr>
				<td >
                </td>
               	</tr>
                </table>
            </td>
            </tr>
	        </table>
        <!--第3列over//-->
        </td>
        </tr>
        <tr style='height:3px;'><td colspan=3>&nbsp;</td></tr>
        </table>
    </td>
    </tr>
</table>
</body>
</html>
<s:include value='footer.jsp'></s:include>
