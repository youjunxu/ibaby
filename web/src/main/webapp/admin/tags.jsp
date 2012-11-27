<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.lhq.prj.bms.po.UserInfo" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>

<%
    UserInfo objUser = (UserInfo) request.getSession().getAttribute("user");
    String strUserAcl = (String) request.getSession().getAttribute("userAcl");

    if (objUser == null) {
%>
<jsp:forward page="../error.jsp"/>
<%
    }
    if (strUserAcl.indexOf("BA509") == -1 && strUserAcl.indexOf("999") == -1) {
%>
<jsp:forward page="../error.jsp"/>
<%
    }

//导航信息
    Map<String, String> navigation = new LinkedHashMap<String, String>();
    navigation.put("首页", "manager.jsp");
    navigation.put("系统管理", "sysmanaA.action");
    request.setAttribute("userNav", navigation);
    request.setAttribute("current", "标签管理");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    <c:import url='../includes/_head.jsp'>
        <c:param name="title" value="标签管理" />
    </c:import>
</head>

<body>
<s:action name="defaultTopMenu" executeResult="true">
    <s:param name="strCurMkCode">SYS</s:param>
</s:action>

<table border="0" cellspacing="0" cellpadding="0" class='wrap2'>
    <tr style='height:30px;'>
        <td style='background:url(${request.contextPath}/images/top_bottom.gif) no-repeat;'>
            <c:import url='../includes/_user_nav.jsp' />
        </td>
    </tr>
    <tr>
        <td style='height:40px;'>
            <table cellspacing='0' cellpadding="0" border='0' style='width:100%;'>
                <tr>
                    <td width=240 style="color:#A9714E; font-size:25px;">${requestScope.current}</td>
                    <td valign="bottom">&nbsp;<img src='${request.contextPath}/images/top_bottom.gif' width=693/></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table class="main_content">
                <tr>
                    <td class="main_left">
                        <c:import url="../sys_left.jsp"/>
                    </td>
                    <td class="mid_gap"></td>
                    <td class="main_right">
                        <table width='95%' class="tags_container">
                            <thead>
                            <tr>
                                <th>名称</th>
                                <th>描述</th>
                                <th>模块</th>
                                <th class="function">功能</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${requestScope.tagCount > 0}">
                                <c:forEach items="${requestScope.tagList}" var="tag">
                                <tr title="${tag.id}">
                                    <td>${tag.name}</td>
                                    <td>${tag.description}</td>
                                    <td title="${tag.catalog.lmId}">${tag.catalog.lmName}</td>
                                    <td>
                                        <a href="editTag.action?id=${tag.id}" data-remote="true"
                                           class="edit_tag" data-title="Edit Tag ${tag.name}">编辑</a>
                                        <a href="deleteTag.action?id=${tag.id}" data-remote="true" data-confirm="Are you sure?"
                                           data-method="delete" rel="nofollow" class="delete_tag">删除</a>
                                    </td>
                                </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.tagCount <= 0}">
                                <tr><td colspan="4">暂无数据记录。</td></tr>
                            </c:if>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4" class="table_footer">
                                    <div class="add"><a href="newTag.action" data-remote="true" class="add_tag" data-title="添加标签">新增标签</a></div>
                                    ${requestScope.pager}
                                    <div class="clear"></div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan=3 style='height:20px;'></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<div id="tag_dialog"></div>

<c:import url='../footer.jsp' />

</body>
</html>

