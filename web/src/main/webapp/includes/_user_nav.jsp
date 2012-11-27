<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.ibaby.www.util.ApplicationHelper" %>
<%@ page import="java.util.Map" %>
<%
    //TODO We should remove all the java code in page.
    String userNav = "";
    Object mid = request.getAttribute("moduleId");
    if (mid == null) {
        mid = request.getAttribute("baList_lmCode");
    }

    if (mid == null) {
        Object nav = request.getAttribute("userNav");
        if (nav instanceof String) {
            userNav = ApplicationHelper.toString(nav);
        } else if (nav instanceof Map) {
            String current = ApplicationHelper.toString(request.getAttribute("current"));
            userNav = ApplicationHelper.userNav((Map<String, String>) nav, current);
        }
    } else {
        userNav = ApplicationHelper.userNav(ApplicationHelper.parseInt(mid.toString()));
    }
%>


<div class="user_nav">
    <div class="user_pos">
        您现在所在的位置: <span><%= userNav %></span>
    </div>
    <div class="add_article">
        <s:if test="#session.flagUser != null and #session.flagUser > 1">
            <input name="" type="image" src="${request.contextPath}/images/wyfx1.jpg" class="contribute" />
        </s:if>
    </div>
    <div class="clear"></div>
</div>

