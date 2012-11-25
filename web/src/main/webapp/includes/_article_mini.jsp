<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="article">
    <div class="title">
        ${article.title}
    </div>
    <div class="content">
        ${article.content}
    </div>
    <div class="tags">
        <div class="leading">标签：</div>
        <ul class="tag_list">
        <s:iterator value="#article.tags" var="tag">
            <li class="tag">
                <div class="tag_icon_left"></div>
                <div class="tag_icon">${tag.name}</div>
                <div class="tag_icon_right"></div>
                <div class="clear"></div>
            </li>
        </s:iterator>
        <s:iterator value="#article.deprecateTags" var="tag">
            <li class="tag">
                <div class="tag_icon_left"></div>
                <div class="tag_icon">${tag}</div>
                <div class="tag_icon_right"></div>
                <div class="clear"></div>
            </li>
        </s:iterator>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="details">
        <input name="open_doc" type="image" src="${request.contextPath}/images/index_fulltext.gif"
               data-article_id="${article.id}" />
    </div>
</div>

