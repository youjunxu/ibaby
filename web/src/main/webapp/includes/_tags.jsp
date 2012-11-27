<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<ul class="tag_list">
<c:forEach items="${requestScope.tagList}" var="tag">
    <li class="tag">
        <div class="tag_item">
            <a href="${request.contextPath}/listByTag.action?tag_id=${tag.id}&module_id=${requestScope.moduleId}">${tag.name}</a>
        </div>
    </li>
</c:forEach>
</ul>