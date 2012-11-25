<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<ul class="tag_list">
<s:iterator value="#request.tagList" var="tag">
    <li class="tag">
        <div class="tag_item">
            <a href="${request.contextPath}/listByTag.action?tag_id=${tag.id}&module_id=${requestScope.moduleId}">${tag.name}</a>
        </div>
        <!--div class="tag_icon_left"></div>
        <div class="tag_icon"><a href="${request.contextPath}/listByTag.action?tag_id=${tag.id}&module_id=${requestScope.moduleId}">${tag.name}</a></div>
        <div class="tag_icon_right"></div>
        <div class="clear"></div-->
    </li>
</s:iterator>
</ul>