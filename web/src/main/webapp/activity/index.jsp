<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <c:import url='../includes/_head.jsp'>
        <c:param name="title" value="贝爱乐园" />
    </c:import>
</head>
<body>
<s:action name="defaultTopMenu" executeResult="true">
    <s:param name="strCurMkCode">BALY</s:param>
</s:action>

<div class="main" style="padding:0; border:none; background: none; width:927px;">
    <div class="main-content">
        <div class="activity_head">
            <div class="link">
                <div class="activity_link">
                    <a href="?active=yes"><img src="${request.contextPath}/images/ly_jxz.jpg" /></a>
                </div>
                <div class="arrow">
                     <c:if test="${requestScope.active}">
                        <img src="${request.contextPath}/images/downarrow.jpg" />
                    </c:if>
                </div>
            </div>
            <div class="link">
                <div class="activity_link">
                    <a href="?active=no"><img src="${request.contextPath}/images/ly_end.jpg" /></a>
                </div>
                <div class="arrow">
                    <c:if test="${!requestScope.active}">
                        <img src="${request.contextPath}/images/downarrow.jpg" />
                    </c:if>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="activities">
            <div class="title">
                <c:choose>
                    <c:when test="${requestScope.active}">

                    </c:when>
                    <c:otherwise>
                        <img src="${request.contextPath}/images/ly2.jpg" />
                    </c:otherwise>
                </c:choose>
                <div style="width:80%;margin: 10px auto; overflow-x: hidden;">
                    <img src="${request.contextPath}/images/ly_line1.jpg" width="500" />
                </div>
            </div>
            <c:forEach items="${requestScope.activities}" var="activity" varStatus="status">
                <div class="activity">
                    <div class="activity_image">
                        <a href="http://${activity.link}">
                            <img src="${request.contextPath}/graph/game/${activity.imageUrl}" width="153" height="118" alt="No Image" />
                        </a>
                    </div>
                    <div class="activity_main">
                        <div class="activity_name">活动名称：${activity.name}</div>
                        <div class="activity_time">
                            <strong>热推时间：</strong><fmt:formatDate value="${activity.startDate}" pattern="yyyy-MM-dd" /> - <fmt:formatDate value="${activity.endDate}" pattern="yyyy-MM-dd" />
                        </div>
                        <div class="activity_desc"><strong>活动内容：</strong>${activity.description}</div>
                        <div class="more">
                            <a href="${request.contextPath}/prevOpenActXx.action?actId=${activity.id}">
                                <img src="${request.contextPath}/images/more.jpg" />
                            </a>
                        </div>
                    </div>
                    <div class="clear">
                        <c:if test="${requestScope.pageSize - 1 != status.index}">
                            <img src="${request.contextPath}/images/ly_line2.jpg" />
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            <div style="text-align:center;padding-top:13px;">${requestScope.pager}</div>
        </div>
    </div>
    <div class="main-left">
        <div class="tag_cloud">
            <c:import url="../includes/_tags.jsp" />
        </div>
        <div class="ads">

        </div>
    </div>

    <div class="clear" style="height:30px;"></div>
</div>

<c:import url='../footer.jsp' />

</body>
</html>