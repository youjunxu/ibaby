<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.ibaby.www.domain.valuetypes.Tag" %>
<%@ page import="com.ibaby.www.util.ApplicationHelper" %>


<%
    Tag tag = (Tag) request.getAttribute("tag");
    String label = "创建";
    String action = "saveTag.action";
    if (tag != null) {
        label = "更新";
        action = "updateTag.action?id=" + request.getParameter("id");
    } else {
        tag = new Tag();
    }
%>

<div class="tag_form_dialog">
    <form accept-charset="UTF-8" action="<%= action %>" name="tag_form" id="tag_form" method="post" data-remote="true">

        <div class="field">
            <label for="tag_name">名称：</label>
            <input id="tag_name" name="tag[name]" size="30" type="text"
                class="required" value="<%= ApplicationHelper.toString(tag.getName()) %>"/>
        </div>
        <div class="field">
            <label for="tag_description">描述：</label>
            <textarea cols="45" id="tag_description" name="tag[description]"
                rows="6"><%= ApplicationHelper.toString(tag.getDescription()) %></textarea>
        </div>

        <div class="field">
            <label for="tag_catalog">类别：</label>
            <select data-placeholder="Choose catalog" id="tag_catalog" name="tag[catalog]" class="chzn-select">
                <% if (tag.getCatalog() != null) {%>
                <option value="<%= tag.getCatalog().getLmId() %>"><%= ApplicationHelper.toString(tag.getCatalog().getLmName()) %></option>
                <% } %>
            </select>
        </div>

        <div class="actions">
            <input name="commit" type="submit" value="<%= label %>标签"/>
        </div>

    </form>
</div>
