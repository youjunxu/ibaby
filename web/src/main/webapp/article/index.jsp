<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <c:import url='../includes/_head.jsp'>
        <c:param name="title" value="贝爱学园" />
    </c:import>
</head>
<body>
<s:action name="defaultTopMenu" executeResult="true">
    <s:param name="strCurMkCode">BAXY</s:param>
</s:action>

<div class="main">

    <div class="marquee_area">
        <div style="float: left; line-height: 30px; padding:3px 0 0 16px;">
            <img src="${request.contextPath}/images/lb.jpg" width="12" /> 公告：
        </div>
        <marquee direction=left onMouseOut="this.start()" onMouseOver="this.stop()" scrollamount="2" scrolldelay="1" >
        ${requestScope.marquee}
        </marquee>
        <div style="float: right; margin: 5px 5px;">
        <s:if test="#session.flagUser != null and #session.flagUser > 1">
            <input name="" type="image" src="${request.contextPath}/images/wyfx1.jpg" class="contribute" />
        </s:if>
        </div>
        <div class="clear"></div>
    </div>

    <div class="foreign_board">
        <div class="title">译言堂:来自国外知识</div>
        <div class="logo">
            <img src="${request.contextPath}/images/index_26.jpg" />
        </div>
        <div class="list">
        <c:forEach items="${requestScope['译言堂']}" var="article">
            <div class="item">${article.title}</div>
        </c:forEach>
        </div>
        <div class="clear"></div>
        <div class="more">
            <a href="${request.contextPath}/listByModule?module_id=${requestScope['modules']['译言堂']}">
                查看更多>> </a>
        </div>
    </div>

    <div class="group0">
    <c:import url="../includes/_articles_mini.jsp">
        <c:param name="moduleName" value="认知多一点" />
    </c:import>
    </div>

    <div class="clear"></div>
    <div class="group1">
        <c:import url="../includes/_articles_mini.jsp">
            <c:param name="moduleName" value="健康加一点" />
        </c:import>
        <c:import url="../includes/_articles_mini.jsp">
            <c:param name="moduleName" value="动手勤一点" />
        </c:import>
    </div>
    <div class="group2">
        <c:import url="../includes/_articles_mini.jsp">
            <c:param name="moduleName" value="天天学一点" />
        </c:import>
        <c:import url="../includes/_articles_mini.jsp">
            <c:param name="moduleName" value="扮靓美一点" />
        </c:import>
    </div>

    <div class="clear" style="height:30px;"></div>
</div>

<c:import url='../footer.jsp' />




</body>
</html>