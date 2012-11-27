<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="module_articles">
<div class="module_name">${param.moduleName}</div>
<ul class="article_titles">
<c:forEach items="${requestScope[param.moduleName]}" var="article">
    <li>
        <span class="title">
            <a href="${request.contextPath}/prevOpenBADoc.action?baId=${article.id}">${article.title}</a>
        </span>
        <span class="readCount">${article.readCount} 阅读</span>
    </li>
</c:forEach>
</ul>
<div class="more">
    <a href="${request.contextPath}/listByModule?module_id=${requestScope['modules'][param.moduleName]}"><img src="${request.contextPath}/images/index_icon_28.gif" alt="More" border="0"></a>
</div>
</div>

