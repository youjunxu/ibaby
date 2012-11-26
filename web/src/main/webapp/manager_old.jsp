<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lhq.prj.bms.po.UserInfo"%>
<%@ page import="com.lhq.prj.bms.po.LmBaxy"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>贝家爱家</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>js/normalAjax.js"></script>
<style type="text/css">
<!--
.STYLE1 {color: #00c1a7}
-->
</style>
<script language='Javascript'>
function initMainPage()
{
}
</script>
</head>
<body onload='initMainPage()'>
<%
	UserInfo objUser=(UserInfo)request.getSession().getAttribute("user");
	String strUserAcl=(String)request.getSession().getAttribute("userAcl");
	Integer flagUser=(Integer)request.getSession().getAttribute("flagUser");
	if (flagUser==0)
	{
	%>
	<jsp:forward page="login.jsp" />
	<%
	}
%>
	<s:action name="gvCurUserTopMenu" executeResult="true" />
<div class="wrap">
  <div class="index_left">
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_22.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">宝贝儿奕豪</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_24.jpg" width="145" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">龙龙虎宝妈妈</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_26.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">装白开水的易拉罐</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_22.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">宝贝儿奕豪</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_24.jpg" width="145" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">龙龙虎宝妈妈</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_26.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">装白开水的易拉罐</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_22.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">宝贝儿奕豪</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_24.jpg" width="145" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">龙龙虎宝妈妈</a></li>
	</ul>
    <ul>
	  <li class="pic"><a href="#"><img src="images/index_26.jpg" width="144" height="144" border="0" /></a></li>
	  <li class="pic_title" onMouseOver="this.style.backgroundColor='#d5edec'"
onMouseOut="this.style.backgroundColor='#56b1a8'"><a href="#">装白开水的易拉罐</a></li>
	</ul>
  </div>
  <div class="index_right">
    <div>
	  <ul class="clear">
	  <li class="index_right_left"><img src="images/index_icon_19.gif" /></li>
	  <li class="index_right_right"><img src="images/index_icon_28.gif" /></li>
	  </ul>

	<s:action name="findIndexBaxy" executeResult="false" />
<% %>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="<%=path%>/ba/BA_read.jsp">给宝宝洗脸有顺序</a></li>
	  <li class="index_tab_right">18阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">宝宝10天了，吃什么奶粉好  </a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">标准口径和宽口径的奶瓶有什么区别</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">新妈妈遭遇职场危机，众多方法巧化解</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">39周 3了，要怎么样才能快快生出..</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">出生20天的肺炎宝宝如何护理？</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	   <ul class="clear">
	  <li class="index_tab_left"><a href="#">新妈妈遭遇职场危机，众多方法巧化解</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab_left"><a href="#">39周 3了，要怎么样才能快快生出..</a></li>
	  <li class="index_tab_right">1875阅读</li>
	  </ul>
	  <ul class="clear" style="padding-top:15px;">
	  <li class="index_right_left"><img src="images/index_icon_39.gif" /></li>
	  <li class="index_right_right"><img src="images/index_icon_28.gif" /></li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab2_left"><img src="images/pic_sm_10.jpg" /></li>
	  <li class="index_tab2_right"><span class="STYLE1">1月见宝宝</span>：我家宝宝今年开始喝雅士利，营养吸收很好，宝宝
很喜欢喝。奶... <span class="more"><a href="#">详细>></a></span></li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab2_left"><img src="images/pic_sm_10.jpg" /></li>
	  <li class="index_tab2_right"><span class="STYLE1">西伯利亚小老鼠</span>：这款优衡多的奶粉还是不错的，适合偏食宝
宝，那时候我家宝宝... <span class="more"><a href="#">详细>></a></span></li>
	  </ul>
	  <ul class="clear">
	  <li class="index_tab2_left"><img src="images/pic_sm_10.jpg" /></li>
	  <li class="index_tab2_right"><span class="STYLE1">1月见宝宝</span>：我家宝宝今年开始喝雅士利，营养吸收很好，宝宝
很喜欢喝。奶... <span class="more"><a href="#">详细>></a></span></li>
	  </ul>	  

	</div>
  </div>
</div>
</body>
</html>
<s:include value='footer.jsp'></s:include>
