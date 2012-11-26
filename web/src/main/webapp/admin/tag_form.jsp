<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="tag_form_dialog">
    <form accept-charset="UTF-8" action="${requestScope.action}" name="tag_form" id="tag_form" method="post" data-remote="true">

        <div class="field">
            <label for="tag_name">名称：</label>
            <input id="tag_name" name="tag[name]" size="30" type="text" class="required" value="${requestScope.tag.name}"/>
        </div>
        <div class="field">
            <label for="tag_description">描述：</label>
            <textarea cols="45" id="tag_description" name="tag[description]" rows="6">${requestScope.tag.description}</textarea>
        </div>

        <div class="field">
            <label for="tag_catalog">类别：</label>
            <select data-placeholder="Choose catalog" id="tag_catalog" name="tag[catalog]" class="chzn-select">
                <s:if test="#request.tag.catalog != null">
                    <option value="${requestScope.tag.catalog.lmId}">${requestScope.tag.catalog.lmName}</option>
                </s:if>
            </select>
        </div>

        <div class="actions">
            <s:if test="null == #request.tag.name">
                <input name="commit" type="submit" value="创建标签"/>
            </s:if>
            <s:else>
                <input name="commit" type="submit" value="更新标签"/>
            </s:else>
        </div>

    </form>
</div>
